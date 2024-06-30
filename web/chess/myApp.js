console.log("myApp.js")

const FEN_POSITIONS = [
    // Add your FEN positions here
    'rnbqkb1r/pppppppp/5n2/8/8/5N2/PPPPPPPP/RNBQKB1R w KQkq - 1 2',
    'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
    // Add more positions as needed
];
// board.on('drop', function(source, target, piece, newPos, oldPos, orientation) {
//     if (game.move({ from: source, to: target })) {
//         updateEvaluation();
//         setTimeout(makeStockfishMove, 500);
//     }
// });
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
        console.log('~~~~~~~ Move not played ~~~~~')
    }
}
const board = Chessboard('board', {
    draggable: true,
    position: 'start',
    dropOffBoard: 'trash',
    onDrop: onBoardDrop,
    sparePieces: false
});
const game = new Chess();
// const stockfish = new Worker('stockfish.js');

let evaluationElement = document.getElementById('evaluation');

document.getElementById('newGame').addEventListener('click', startNewGame);

function startNewGame() {
    const randomFEN = FEN_POSITIONS[Math.floor(Math.random() * FEN_POSITIONS.length)];
    game.load(randomFEN);
    board.position(randomFEN);
    updateEvaluation();
    console.log("Start new game")
}



function updateEvaluation() {
    stockfish.postMessage(`position fen ${game.fen()}`);
    stockfish.postMessage('eval');
    console.log("Update Evaluation")
}

stockfish.onmessage = function(event) {
    console.log("stockfish.onmessage"+event.data)
    if (event.data.includes('Total evaluation')) {
        console.log('Total evaluation')

        evaluationElement.innerText = `Evaluation: ${event.data}`;
    }
    if (event.data.includes('bestmove')) {
        console.log('Total bestmove')
        const bestMove = event.data.split(' ')[1];
        game.move(bestMove);
        board.position(game.fen());
        updateEvaluation();
    }
};

function makeStockfishMove() {
    stockfish.postMessage(`position fen ${game.fen()}`);
    stockfish.postMessage('go depth 15');

    // stockfish.onmessage = function(event) {
    //     if (event.data.includes('bestmove')) {
    //         const bestMove = event.data.split(' ')[1];
    //         game.move(bestMove);
    //         board.position(game.fen());
    //         updateEvaluation();
    //     }
    // };
}

// Initialize the game
startNewGame();
