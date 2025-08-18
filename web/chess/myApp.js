// Author: Jean-Baptiste PERIN
// TODO: Empêcher qu'on puisse déplacer une pièce pendant que stockfish réfléchit
// 


// list_piece_place = game.SQUARES.map(function (sq) {return (game.get(sq))?{"sq":sq, "color":game.get(sq).color, "type":game.get(sq).type}:null}).filter(x=>x)
// 
console.log("myApp.js")

const DEFAULT_POSITION='rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'

const game = new Chess();
let currentEvaluation = null;
let currentBestline = null;
let position_history=[];
const position_eval= new Map();
position_eval.set (DEFAULT_POSITION,{
    evaluation: null,
    bestLine: null
})
let pendingPromotion = null;


let chessboard_parameters = {
    draggable           : true,
    position            : 'start',
    orientation         : 'white',
    dropOffBoard        : 'snapback', // 'trash',
    onDrop              : onBoardDrop,
    onDragStart         : onDragStart,
    onSnapEnd           : onSnapEnd,
    onMouseoutSquare    : onMouseoutSquare,
    onMouseoverSquare   : onMouseoverSquare,
    sparePieces         : false,
    pieceTheme          : 'https://chessboardjs.com/img/chesspieces/alpha/{piece}.png',
};

let board = Chessboard('board', chessboard_parameters);

jQuery('#board').on('scroll touchmove touchend touchstart contextmenu', function(e){
    e.preventDefault();
    }
);

function updateHistory(){
    position_history.push(game.fen())
    position_eval.set (game.fen(),{
        evaluation: currentEvaluation,
        bestLine: currentBestline
    })
    // console.log("update history = ",game.fen(),{
    //     evaluation: currentEvaluation,
    //     bestLine: currentBestline
    // })

}
function resetHistory(initFEN){
    position_history=[];
    position_history.push(initFEN);
}
function checkGameState(){
    result = 'ongoing';
    if (game.game_over()) {
        if (game.in_draw()){
            
            if (game.in_stalemate()) {
                result = 'draw: in_stalemate';
            } else if (game.in_threefold_repetition()){
                result = 'draw: in_threefold_repetition';
            } else if (game.insufficient_material()) {
                result = 'draw: insufficient_material';
            }
        } else {
            if (game.turn() === 'b'){
                result = 'Whites win';
            } else {
                result = 'Blacks wins';
            }      
        }     
    }
    return result;
}

function getMovesFromBook (listmove) {
    // Search for this position in the Opening Book
    ii=0;
    if (game.turn() === 'b') {
        openingBook = openingBookBlack
    } else {
        openingBook = openingBookWhite
    }
    tmpstp=openingBook.filter((muv)=> muv.mov == listmove[ii]);
    // stp=openingBook.filter((muv)=> muv.mov == listmove[ii])[0].vars;
    // outOfBook = false;
    if (tmpstp.length != 0) {
        stp = tmpstp[0].vars;
        outOfBook = false;
    } else {
        outOfBook = true;
    }
    while ((! outOfBook) && stp && (ii < listmove.length-1)){
        ii++;
        tmpstp=stp.filter((muv)=> muv.mov == listmove[ii]);
        if (tmpstp.length != 0) {
            stp = tmpstp[0].vars;
        } else {
            outOfBook = true;
            break;
        }
    }

    // If we found an entry in opening book
    if ((! outOfBook) && (ii == listmove.length-1)){
        return (stp)
    } else {
        return []
    }
}
function formatTheoryMoveList(theory){
    const algebraicMoves = [];
    theory.sort((a, b) => b.prob - a.prob).forEach(move => {
        let moveResult = game.move(move.mov, { sloppy: true });
        let san = moveResult.san;
        let unicode_san = san; // Default to the SAN notation

        if (san.startsWith('N')) {
            unicode_san = game.turn() === 'w' ? '♞' : '♘';
            unicode_san += san.substring(1);
        } else if (san.startsWith('K')) {
            unicode_san = game.turn() === 'w' ? '♚' : '♔';
            unicode_san += san.substring(1);
        } else if (san.startsWith('Q')) {
            unicode_san = game.turn() === 'w' ? '♛' : '♕';
            unicode_san += san.substring(1);
        } else if (san.startsWith('R')) {
            unicode_san = game.turn() === 'w' ? '♜' : '♖';
            unicode_san += san.substring(1);
        } else if (san.startsWith('B')) {
            unicode_san = game.turn() === 'w' ? '♝' : '♗';
            unicode_san += san.substring(1);
        }
        unicode_san += ` (${Math.round(move.prob*10000)/100}%)`
        game.undo();
        algebraicMoves.push(unicode_san);
    });

    return algebraicMoves.join(', ');

}


function updatePossibleMoves() {
    const moves = game.moves();
    possibleMovesElement.innerHTML = '';
    moves.forEach(move => {
        const button = document.createElement('button');
        button.innerText = move;
        button.addEventListener('click', () => {
            makeMove(move);
            // game.move(move);
            // board.position(game.fen());
            // updateEvaluation();
            // updatePossibleMoves();
            // setTimeout(makeMove, 500);
        });
        possibleMovesElement.appendChild(button);
    });
}

// isGameOver() Returns true if the game has ended via checkmate, stalemate, draw, threefold repetition, or insufficient material. Otherwise, returns false
// isInsufficientMaterial() Returns true if the game is drawn due to insufficient material (K vs. K, K vs. KB, or K vs. KN) otherwise false.
// isStalemate() Returns true or false if the side to move has been stalemated.
// isDraw() Returns true or false if the game is drawn (50-move rule or insufficient material).
// isCheckmate() Returns true or false if the side to move has been checkmated.

function makeMove(theMove){

    if (game.move(theMove)) {

        board.position(game.fen());
        updateHistory();

        if ((res = checkGameState()) != 'ongoing') {alert(res);return true};


        listmove = game.history({ verbose: true }).map (e => e.from+e.to) // FIXME : deal with promotion
        // openingBookWhite.filter((muv)=> muv.move == listmove[0])

        // If we are in a game that started from default start position, then we can use OpenBook
        if (position_history[0]==DEFAULT_POSITION) {
            
            // Search for this position in the Opening Book
            ii=0;
            if (game.turn() === 'b') {
                openingBook = openingBookBlack
            } else {
                openingBook = openingBookWhite
            }
            tmpstp=openingBook.filter((muv)=> muv.mov == listmove[ii]);
            // stp=openingBook.filter((muv)=> muv.mov == listmove[ii])[0].vars;
            // outOfBook = false;
            if (tmpstp.length != 0) {
                stp = tmpstp[0].vars;
                outOfBook = false;
            } else {
                outOfBook = true;
            }
            while ((! outOfBook) && stp && (ii < listmove.length-1)){
                ii++;
                tmpstp=stp.filter((muv)=> muv.mov == listmove[ii]);
                if (tmpstp.length != 0) {
                    stp = tmpstp[0].vars;
                } else {
                    outOfBook = true;
                    break;
                }
            }

            // If we found an entry in opening book
            if ((! outOfBook) && (ii == listmove.length-1)){
                if (stp.length >= 1){
                    theMove = probChoose(stp)
                    if (game.move({from:theMove.substring(0, 2), to: theMove.substring(2, 4)})){
                        board.position(game.fen());
                        updateHistory();
                        if ((res = checkGameState()) != 'ongoing') {alert(res);return};
                        // update book content
                        updateBookMoveList();
                        updateEvaluation();
                        updatePossibleMoves();
                    } else {
                        alert("Invalid move from Opening book ???");
                    }

                } else {
                    console.log("Ask Stockfish to guess the best move");
                    bookElement.innerText = "Book: empty" 
                    setTimeout(makeStockfishMove, 500);
                }
            } else {
                console.log("Ask Stockfish to guess the best move");
                bookElement.innerText = "Book: empty" 
                setTimeout(makeStockfishMove, 500);
            }
        } else {
            // console.log("Ask Stockfish to guess the best move");
            setTimeout(makeStockfishMove, 500);
            bookElement.innerText = "Book: empty" 

        }
        // updatePossibleMoves();
        return true
    } else {
        return false
    }
}

function onBoardDrop (source, target, piece, newPos, oldPos, orientation) {
    // console.log('Source: ' + source)
    // console.log('Target: ' + target)
    // console.log('Piece: ' + piece)
    // console.log('New position: ' + Chessboard.objToFen(newPos))
    // console.log('Old position: ' + Chessboard.objToFen(oldPos))
    // console.log('Orientation: ' + orientation)
    // console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')

    promotions = game.moves({ verbose: true }).filter((mv)=> mv.to == target && mv.promotion)

    if (promotions.length != 0) {
        pendingPromotion = { from: source, to: target };
        showPromotionChoices(target);
    } else {
        if (! makeMove({ from: source, to: target })){
            updateEvaluation();
            return 'snapback'
        }

    }
    updatePossibleMoves();
}

function onDragStart (source, piece, position, orientation) {
    // do not pick up pieces if the game is over
    if (game.game_over()) return false;
    // only pick up pieces for White
    console.log (source, piece, game.turn());
    if (game.turn() === 'w'){
        if (piece.startsWith('b')) return false
    } else {
        if (piece.startsWith('w')) return false
    }
}

// update the board position after the piece snap
// for castling, en passant, pawn promotion
function onSnapEnd () {
  board.position(game.fen());
}

function onMouseoverSquare (square, piece) {
}
function onMouseoutSquare (square, piece) {
}



function showPromotionChoices(targetSquare) {
    const boardElement = document.getElementById('board');
    const rect = boardElement.getBoundingClientRect();
    const squareSize = rect.width / 8;
    const file = targetSquare[0].charCodeAt(0) - 'a'.charCodeAt(0);
    const rank = 8 - parseInt(targetSquare[1]);
    const top = rank * squareSize + rect.top;
    const left = file * squareSize + rect.left;

    promotionDiv.style.top = `${top}px`;
    promotionDiv.style.left = `${left}px`;
    promotionDiv.style.display = 'block';
}

function makePromotionMove(piece) {
    if (pendingPromotion) {
        const theMove = {
            from: pendingPromotion.from,
            to: pendingPromotion.to,
            promotion: piece
        };
        pendingPromotion = null;
        promotionDiv.style.display = 'none';
        makeMove(theMove);
        updateEvaluation();
        updatePossibleMoves();
        setTimeout(makeStockfishMove, 500);
    }
}

function refreshBoard(){
    if (game.turn() === 'b'){
        chessboard_parameters.orientation = 'black';
    } else {
        chessboard_parameters.orientation = 'white';
    }
    board = Chessboard('board', chessboard_parameters);    
    board.position(game.fen());
    updateEvaluation();
    updatePossibleMoves();
}


function newStudy() {
    const randomFEN = FEN_STUDIES[Math.floor(Math.random() * FEN_STUDIES.length)];
    console.log("Start new study")
    game.load(randomFEN);
    resetHistory(randomFEN);
    bestLineElement.innerText = `Best line: undefined`;
    evaluationElement.innerText = `Evaluation: undefined`;
    refreshBoard();
}

function probChoose(moves) {
    // Calculate the total sum of probabilities
    const totalProb = moves.reduce((sum, move) => sum + move.prob, 0);

    // Generate a random number between 0 and totalProb
    let rand = Math.random() * totalProb;

    // Iterate through the moves to find which move corresponds to the random number
    for (let i = 0; i < moves.length; i++) {
        rand -= moves[i].prob;
        if (rand <= 0) {
            return moves[i].mov;
        }
    }

    // In case of rounding errors, return the last move
    return moves[moves.length - 1].mov;
}


function updateBookMoveList (){
    listmove = game.history({ verbose: true }).map (e => e.from+e.to)// FIXME : deal with promotion
    theory = getMovesFromBook (listmove);
    bookElement.innerText = "Book: " + ((theory.length != 0)? formatTheoryMoveList(theory): "empty");

}
function startNewGame() {
    // const randomFEN = FEN_POSITIONS[Math.floor(Math.random() * FEN_POSITIONS.length)];
    color = (Math.floor(Math.random() * (1 - 0 + 1) + 0) == 0) ? 'white' : 'black'
    console.log("Start new game ", color )
    resetHistory(DEFAULT_POSITION);
    bestLineElement.innerText = `Best line: undefined`;
    evaluationElement.innerText = `Evaluation: undefined`;

    game.load(DEFAULT_POSITION);

    if (color == 'white') {
        updateBookMoveList ();
    } else {
        console.log("User play Black. We need to choose a move for White")
        theMove = probChoose(openingBookWhite)
        console.log(theMove)
        resmove = game.move({from:theMove.substring(0, 2), to: theMove.substring(2, 4)})
        updateHistory();
        updateBookMoveList ();
    }
    refreshBoard();
}

function updateEvaluation() {
    // stockfish.postMessage(`position fen ${game.fen()}`);
    // stockfish.postMessage('eval');
    // console.log("Update Evaluation")
}

function extractEvaluation (message){
    let match = message.match(/ score cp (.*)/);
    if (match) {
        const eval = match[1].split(' ')[0]/100;
        // console.log ("Evaluation = " +eval);
        
        return (game.turn() === 'w') ? eval: -eval
    }
    match = message.match(/ score mate (.*)/);
    if (match) {
        const eval = match[1].split(' ')[0];
        // console.log ("Evaluation = M " +eval);
        return (game.turn() === 'w') ? eval: "-"+eval;
    }
}
function parseBestLine(message, startingMoveNumber = 1) {
    const match = message.match(/ pv (.*)/);
    if (match) {
        const moves = match[1].split(' ');
        const algebraicMoves = [];
        let currentMoveNumber = startingMoveNumber;
        let moveCount = 0;
        if (game.turn() === 'b') {
            algebraicMoves.push('1...');
            moveCount++
        }
        moves.forEach(move => {
            let moveResult = game.move(move, { sloppy: true });
            let san = moveResult.san;
            let unicode_san = san; // Default to the SAN notation

            if (san.startsWith('N')) {
                unicode_san = game.turn() === 'w' ? '♞' : '♘';
                unicode_san += san.substring(1);
            } else if (san.startsWith('K')) {
                unicode_san = game.turn() === 'w' ? '♚' : '♔';
                unicode_san += san.substring(1);
            } else if (san.startsWith('Q')) {
                unicode_san = game.turn() === 'w' ? '♛' : '♕';
                unicode_san += san.substring(1);
            } else if (san.startsWith('R')) {
                unicode_san = game.turn() === 'w' ? '♜' : '♖';
                unicode_san += san.substring(1);
            } else if (san.startsWith('B')) {
                unicode_san = game.turn() === 'w' ? '♝' : '♗';
                unicode_san += san.substring(1);
            }

            if (moveCount % 2 === 0) {
                algebraicMoves.push(`${currentMoveNumber}.`);
                currentMoveNumber++;
            }

            algebraicMoves.push(unicode_san);
            moveCount++;
        });

        moves.forEach(() => game.undo());
        return algebraicMoves.join(' ');
    }
    return null;
}


function handleUserMove() {
    const move = moveInput.value;
    const moveResult = game.move(move, {sloppy: true});
    if (moveResult) {
        board.position(game.fen());
        updateHistory();
        updateEvaluation();
        if ((res = checkGameState()) != 'ongoing') {alert(res);};
        moveInput.value = '';
        setTimeout(makeStockfishMove, 500);
    } else {
        alert("Invalid move. Please try again.");
    }
}

function backMove() {
    
    if (position_history.length > 2) {
        game.undo();
        position_history.pop()
        game.undo();
        position_history.pop()
        board.position(game.fen());

        theEval = position_eval.get(game.fen());
        bestLineElement.innerText = `Best line: ${theEval.bestLine}`;
        evaluationElement.innerText = `Evaluation: `+theEval.evaluation;
        // updateEvaluation();
    } else {
        if (position_history.length > 1) {
            game.undo();
            position_history.pop()
            refreshBoard();

            theEval = position_eval.get(game.fen());
            bestLineElement.innerText = `Best line: ${theEval.bestLine}`;
            evaluationElement.innerText = `Evaluation: `+theEval.evaluation;
            // updateEvaluation();
        }        
    }
    if (position_history[0]==DEFAULT_POSITION) {
        updateBookMoveList();
    } else {
        bookElement.innerText = "Book: empty" ;
    }

}   
function playMove() {
    if (game.turn() === 'w'){
        chessboard_parameters.orientation = 'black';
    } else {
        chessboard_parameters.orientation = 'white';
    }
    board = Chessboard('board', chessboard_parameters);    
    board.position(game.fen());
    setTimeout(makeStockfishMove, 500);
    updateEvaluation();
    
}
function resetPosition() {
    if (position_history.length >= 1) {
        start_pos = position_history[0];
        console.log(" initial position == "+start_pos);
        game.load(start_pos);
        resetHistory(start_pos);
        bestLineElement.innerText = `Best line: undefined`;
        evaluationElement.innerText = `Evaluation: undefined`;
    
        refreshBoard();
        updateEvaluation();
    }
}

stockfish.postMessage('uci');
stockfish.onmessage = function(event) {
    const message = event.data;
    console.log("stockfish.onmessage "+message)
    if (message.startsWith("Total Evaluation")) {
        console.log('Total Evaluation')
        const evaluation = message.split(': ')[1];
        evaluationElement.innerText = `Evaluation:`+evaluation; // `${event.data}`;
    }
    if (message.startsWith('bestmove')) {
        const bestMove = message.split(' ')[1];
        console.log('bestmove = ' + bestMove + '.')
        theMove = {from:bestMove.substring(0, 2), to: bestMove.substring(2, 4)};
        if (bestMove.length == 5) theMove.promotion = bestMove.substring(4, 5)
        if (game.move(theMove)){
            board.position(game.fen());
            updateHistory();
            if ((res = checkGameState()) != 'ongoing') {alert(res);return};
            updateBookMoveList();
            updateEvaluation();
            updatePossibleMoves();
        } else {
            console.log('XXXXXXX ===== >>unable to play bestmove = ' + bestMove)
        }
    } else if (message.startsWith('info depth')) {
        console.log("stockfish.onmessage "+message)
        const bestLine = parseBestLine(message);
        if (bestLine) {
            currentBestline = bestLine;
            bestLineElement.innerText = `Best line: ${bestLine}`;
        }
        currentEvaluation = extractEvaluation(message);
        evaluationElement.innerText = `Evaluation: `+currentEvaluation;
    }
};

function makeStockfishMove() {
    depth = 3;
    level = 0;
    elo = 1320;
    stockfish.postMessage('setoption name Skill Level value '+level);
    // stockfish.postMessage('setoption name Skill Level Maximum Error value 600');
    // stockfish.postMessage('setoption name Skill Level Probability value 128');
    // UCI_LimitStrength    type check default false
    stockfish.postMessage('setoption name UCI_LimitStrength value true');
    // UCI_Elo              type spin default 1320 min 1320 max 3190
    stockfish.postMessage('setoption name UCI_Elo value '+ elo);
    
    stockfish.postMessage(`position fen ${game.fen()}`);
    // stockfish.postMessage("setoption name Skill Level value " + level);
    stockfish.postMessage('go depth '+depth);
}

// let evaluationElement = document.getElementById('evaluation');
// let moveInput = document.getElementById('moveInput');
// let submitMove = document.getElementById('submitMove');

// document.getElementById('newGame').addEventListener('click', startNewGame);
// submitMove.addEventListener('click', handleUserMove);

// // Initialize the game
// startNewGame();
