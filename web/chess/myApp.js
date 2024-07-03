console.log("myApp.js")

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
const FEN_POSITIONS = [
    // Add your FEN positions here
    'rnbqkb1r/pppppppp/5n2/8/8/5N2/PPPPPPPP/RNBQKB1R w KQkq - 1 2',
    'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
    'rnbqkbnr/ppp1pppp/3p4/8/3PP3/8/PPP2PPP/RNBQKBNR b KQkq - 0 2',
    'rnbqkb1r/ppp1pppp/3p1n2/8/3PP3/2N5/PPP2PPP/R1BQKBNR b KQkq - 2 3',
    // Add more positions as needed
];

function onBoardDrop (source, target, piece, newPos, oldPos, orientation) {
    console.log('Source: ' + source)
    console.log('Target: ' + target)
    console.log('Piece: ' + piece)
    console.log('New position: ' + Chessboard.objToFen(newPos))
    console.log('Old position: ' + Chessboard.objToFen(oldPos))
    console.log('Orientation: ' + orientation)
    console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    if (game.move({ from: source, to: target })) {
        updateEvaluation();
        position_history.push(game.fen())
        setTimeout(makeStockfishMove, 500);
    } else {
        console.log('~~~~~~~ Move not played !!~~~~~');
        // illegal move
        return 'snapback'
        // game.undo();
        // board.position(Chessboard.objToFen(oldPos));
        // board.position(game.fen()); // Chessboard.objToFen(oldPos));
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
function startNewGame() {
    const randomFEN = FEN_POSITIONS[Math.floor(Math.random() * FEN_POSITIONS.length)];
    console.log("Start new game")
    position_history=[];
    position_history.push(randomFEN)
    game.load(randomFEN);
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
    console.log("stockfish.onmessage "+message)
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
