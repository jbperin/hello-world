console.log("myApp.js")

const game = new Chess();

const board = Chessboard('board', {
    draggable           : true,
    position            : 'start',
    dropOffBoard        : 'snapback', // 'trash',
    onDrop              : onBoardDrop,
    sparePieces         : false
});
jQuery('#board').on('scroll touchmove touchend touchstart contextmenu', function(e){
    e.preventDefault();
    }
);
const FEN_POSITIONS = [
    // Add your FEN positions here
    'rnbqkb1r/pppppppp/5n2/8/8/5N2/PPPPPPPP/RNBQKB1R w KQkq - 1 2',
    'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
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


function startNewGame() {
    const randomFEN = FEN_POSITIONS[Math.floor(Math.random() * FEN_POSITIONS.length)];
    console.log("Start new game")
    game.load(randomFEN);
    board.position(randomFEN);
    updateEvaluation();
    
}

function updateEvaluation() {
    stockfish.postMessage(`position fen ${game.fen()}`);
    stockfish.postMessage('eval');
    console.log("Update Evaluation")
}

stockfish.onmessage = function(event) {
    console.log("stockfish.onmessage "+event.data)
    if (event.data.startsWith("Total Evaluation")) {
        console.log('Total Evaluation')
        const evaluation = event.data.split(': ')[1];
        evaluationElement.innerText = `Evaluation:`+evaluation; // `${event.data}`;
    }
    if (event.data.startsWith('bestmove')) {
        const bestMove = event.data.split(' ')[1];
        console.log('bestmove = ' + bestMove + '.')
        if (game.move({from:bestMove.substring(0, 2), to: bestMove.substring(2, 4)})){
            board.position(game.fen());
            updateEvaluation();
        } else {
            console.log('XXXXXXX ===== >>unable to play bestmove = ' + bestMove)
        }
    }
};

function makeStockfishMove() {
    stockfish.postMessage(`position fen ${game.fen()}`);
    stockfish.postMessage('go depth 15');
}


let evaluationElement = document.getElementById('evaluation');

document.getElementById('newGame').addEventListener('click', startNewGame);

// Initialize the game
startNewGame();
