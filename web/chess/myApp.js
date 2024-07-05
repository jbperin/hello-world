console.log("myApp.js")

const DEFAULT_POSITION='rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'

const game = new Chess();

let position_history=[];

let chessboard_parameters = {
    draggable           : true,
    position            : 'start',
    orientation         : 'white',
    dropOffBoard        : 'snapback', // 'trash',
    onDrop              : onBoardDrop,
    sparePieces         : false,
    pieceTheme          : 'https://chessboardjs.com/img/chesspieces/alpha/{piece}.png',
};

let board = Chessboard('board', chessboard_parameters);

jQuery('#board').on('scroll touchmove touchend touchstart contextmenu', function(e){
    e.preventDefault();
    }
);


function onBoardDrop (source, target, piece, newPos, oldPos, orientation) {
    // console.log('Source: ' + source)
    // console.log('Target: ' + target)
    // console.log('Piece: ' + piece)
    // console.log('New position: ' + Chessboard.objToFen(newPos))
    // console.log('Old position: ' + Chessboard.objToFen(oldPos))
    // console.log('Orientation: ' + orientation)
    // console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    if (game.move({ from: source, to: target })) {
        listmove = game.history({ verbose: true }).map (e => e.from+e.to)
        // openingBookWhite.filter((muv)=> muv.move == listmove[0])
        if (position_history[0]==DEFAULT_POSITION) {
            ii=0;
            if (game.turn === 'b') {
                openingBook = openingBookBlack
            } else {
                openingBook = openingBookWhite
            }
            stp=openingBook.filter((muv)=> muv.mov == listmove[ii])[0].vars;
            outOfBook = false;
            while (stp && ii < listmove.length-1){
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
                        position_history.push(game.fen())
                        console.log("history = "+ position_history)
                        updateEvaluation();
                    } else {
                        alert("Invalid move from Opening book ???");
                    }

                } else {
                    setTimeout(makeStockfishMove, 500);
                    console.log("Ask Stockfish to guess the bet move");
                }
            } else {
                setTimeout(makeStockfishMove, 500);
                console.log("Ask Stockfish to guess the bet move");
            }
        }
        console.log (stp)

        
    } else {
        return 'snapback'
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
}
function newStudy() {
    const randomFEN = FEN_STUDIES[Math.floor(Math.random() * FEN_STUDIES.length)];
    console.log("Start new study")
    position_history=[];
    position_history.push(randomFEN)
    game.load(randomFEN);
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



function startNewGame() {
    // const randomFEN = FEN_POSITIONS[Math.floor(Math.random() * FEN_POSITIONS.length)];
    color = (Math.floor(Math.random() * (1 - 0 + 1) + 0) == 0) ? 'white' : 'black'
    console.log("Start new game ", color )
    position_history=[];
    position_history.push(DEFAULT_POSITION)
    game.load(DEFAULT_POSITION);

    if (color == 'white') {

    } else {
        console.log("User play Black. We need to choose a move for White")
        theMove = probChoose(openingBookWhite)
        console.log(theMove)
        resmove = game.move({from:theMove.substring(0, 2), to: theMove.substring(2, 4)})
        position_history.push(game.fen())
        console.log(); 
    }
    refreshBoard();
}

function updateEvaluation() {
    stockfish.postMessage(`position fen ${game.fen()}`);
    stockfish.postMessage('eval');
    console.log("Update Evaluation")
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
        position_history.push(game.fen())
        updateEvaluation();
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
        updateEvaluation();
    } else {
        if (position_history.length > 1) {
            game.undo();
            position_history.pop()
            refreshBoard();
            updateEvaluation();
        }        
    }
    console.log(" history == "+position_history)
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
        start_pos = position_history[0]
        console.log(" initial position == "+start_pos)
        game.load(start_pos)
        refreshBoard();
        updateEvaluation();
    // if (position_history.length >= 1) {
        // game.undo();
        // position_history.pop()
        // game.undo();
        // position_history.pop()
        // board.position(game.fen());
    }
    // 
}
stockfish.onmessage = function(event) {
    const message = event.data;
    // console.log("stockfish.onmessage "+message)
    if (message.startsWith("Total Evaluation")) {
        console.log('Total Evaluation')
        const evaluation = message.split(': ')[1];
        evaluationElement.innerText = `Evaluation:`+evaluation; // `${event.data}`;
    }
    if (message.startsWith('bestmove')) {
        const bestMove = message.split(' ')[1];
        console.log('bestmove = ' + bestMove + '.')
        if (game.move({from:bestMove.substring(0, 2), to: bestMove.substring(2, 4)})){
            board.position(game.fen());
            position_history.push(game.fen())
            console.log("history = "+ position_history)
            updateEvaluation();
        } else {
            console.log('XXXXXXX ===== >>unable to play bestmove = ' + bestMove)
        }
    } else if (message.startsWith('info depth')) {
        const bestLine = parseBestLine(message);
        if (bestLine) {
            bestLineElement.innerText = `Best line: ${bestLine}`;
        }
    }
};

function makeStockfishMove() {
    stockfish.postMessage(`position fen ${game.fen()}`);
    stockfish.postMessage('go depth 15');
}


// let evaluationElement = document.getElementById('evaluation');
// let moveInput = document.getElementById('moveInput');
// let submitMove = document.getElementById('submitMove');

// document.getElementById('newGame').addEventListener('click', startNewGame);
// submitMove.addEventListener('click', handleUserMove);

// // Initialize the game
// startNewGame();
