const FEN_STUDIES = [    
    '1B6/4b3/pp3k1p/6p1/3PK1p1/1P6/P6P/8 w - - 0 1',
    '1K1k4/1P6/8/8/8/8/r7/2R5 w - - 0 1',
    '1K6/8/P7/8/5k2/8/3q4/8 w - - 0 1',
    '1k6/2q2p2/5p2/KP3P1p/P2Q3P/8/8/8 w - - 0 1',
    '1k6/8/1b2pp2/6p1/2P4p/5K1P/2B5/8 w - - 0 1',
    '2b5/pp3p2/6k1/5p1p/4pK2/1P2P2P/P3BPP1/8 w - - 0 1',
    '2k5/8/2K5/1P6/8/8/8/8 w - - 0 1',
    '2k5/8/P7/2KNp1P1/4b2p/8/8/8 w - - 0 1',
    '2r1r3/5k2/3p3p/8/4P1PP/2PP3Q/1P6/7K w - - 0 1',
    '2r4k/p5pp/2p2p2/3p4/8/1P2P3/P4PPP/2R2K2 w - - 0 1',
    '2r5/3k4/3Pp1p1/1NP2p1p/1P3P1P/2B3P1/1P3K2/3r4 w - - 0 1',
    '3K4/6k1/3P4/3Q4/8/8/1q6/8 w - - 0 1',
    '3K4/r6p/5ppk/5P2/PR4PP/8/8/8 b - - 0 1',
    '3R4/8/8/8/8/8/4K1pk/8 w - - 0 1',
    '3b2k1/pp3pp1/4p2p/8/2P5/7P/PP3PPB/6K1 w - - 0 1',
    '3k4/1pR5/pPbN1K2/3pPp2/7r/8/8/8 w - - 0 1',
    '3k4/8/8/8/6P1/8/5K2/8 w - - 0 1',
    '3n2k1/p4pp1/1p5p/4pN2/8/1P4P1/P3PPKP/8 w - - 0 1',
    '4k3/1pp2ppp/p1p5/8/4P3/8/PPP2PPP/4K3 w - - 1 1',
    '4k3/6p1/2p2p2/1bB5/1P3P2/P3K1P1/7P/8 w - - 0 1',
    '4k3/7p/p5p1/1p3p2/1Bb5/2P2P2/6P1/4K3 w - - 0 1',
    '4k3/7q/8/4PR1N/5P1K/8/8/8 w - - 0 133',
    '4k3/8/4N3/5n1P/8/8/8/7K w - - 0 1',
    '4k3/8/8/7P/8/4K2B/8/8 w - - 0 1',
    '4k3/ppp2ppp/2p5/8/4P3/8/PPP2PPP/4K3 w - - 0 1',
    '4n3/p3kpp1/1p5p/1P2P2P/4KPP1/5N2/8/8 w - - 0 1',
    '4r1k1/2n1bppp/p3p3/1p6/8/1P2B1P1/P3PPBP/R5K1 w - - 0 1',
    '4r1k1/8/4P2p/P2P1Pp1/4P1R1/r7/6KP/8 w - - 0 1',
    '4r3/5pk1/1p4p1/1Pp5/2P5/5P1P/5BP1/5BK1 w - - 0 1',
    '5k2/1b1n2p1/6Qp/1p2p3/1b6/6P1/PPP2P1P/1K6 w - - 0 1',
    '5k2/3b1P2/3p1K2/4p3/1pP1P3/1P1B4/8/8 w - - 0 1',
    '5k2/6p1/7p/8/7P/7K/8/8 w - - 0 1',
    '5k2/8/3P4/8/6K1/8/8/8 w - - 0 1',
    '5k2/pp3pp1/2b4p/8/8/7P/PP3PP1/4R1K1 w - - 0 1',
    '5k2/pp3pp1/2n4p/8/8/7P/PP3PP1/4R1K1 w - - 0 1',
    '5k2/pp3pp1/5n1p/2p5/8/4PN1P/PP3PP1/6K1 w - - 0 1',
    '5k2/pp3ppb/7p/2p5/8/4P2P/PP3PP1/3B2K1 w - - 0 1',
    '5n2/1p3kp1/p7/8/2P1N3/1P1K4/P5P1/8 w - - 0 1',
    '5rk1/1RR2pp1/p1p1P2p/5r2/5P2/2P3P1/6KP/8 w - - 0 1',
    '6k1/1pq2p2/6p1/7p/P1P1Q3/1P3PP1/5PK1/8 w - - 0 1',
    '6k1/1pq2p2/p3p1p1/7p/P2PQ2P/1P4P1/2P2PK1/8 w - - 0 1',
    '6k1/1r4pp/8/8/8/8/R5PP/6K1 w - - 0 1',
    '6k1/2q2p2/4p1p1/4p2p/7P/1P3QP1/P4PK1/8 w - - 0 1',
    '6k1/2r4p/5pp1/1R6/4P2P/5PK1/6P1/8 w - - 0 1',
    '6k1/5p2/5p2/2pR3p/7P/4P1P1/q4P2/2R3K1 w - - 0 1',
    '6k1/5ppp/pr6/8/1P6/P7/5PPP/1R4K1 w - - 0 1',
    '6k1/6p1/6Bp/3K3P/8/8/8/8 w - - 0 1',
    '6k1/pp3pp1/4pn1p/8/2P5/5N1P/PP3PP1/6K1 w - - 0 1',
    '6r1/8/p3p1k1/P1p1Bp1p/2P1pP1P/1r1bP3/6PK/Q7 w - - 0 1',
    '6rk/p5p1/1pQ1Np1p/8/3B3P/4P1P1/5PK1/1q6 w - - 0 1',
    '7K/2k4B/6P1/8/2b5/8/8/8 w - - 0 1',
    '7K/3Q4/8/7p/4k3/8/4q3/8 w - - 0 1',
    '7K/4Q3/8/5k2/p3qp2/8/8/8 w - - 0 1',
    '7k/1p3K1n/8/P7/8/8/5N2/8 w - - 0 1',
    '7k/6b1/3q3p/1p4p1/8/4N1PP/2Q2P2/6K1 w - - 0 1',
    '7k/6p1/4Q2p/5P1K/5qPP/8/8/8 w - - 0 1',
    '8/1n2k3/8/P7/8/8/8/6K1 w - - 0 1',
    '8/1p6/p1n3pp/2P1k3/PPKp4/5BP1/7P/8 w - - 0 1',
    '8/1p6/p1p2kp1/2P1p2p/1P2PP1P/P4K2/8/8 w - - 0 1',
    '8/1pn1k3/8/P5p1/6P1/1P2N1KP/8/8 w - - 0 1',
    '8/2k3pp/p3p3/1pK1Pp2/1p6/8/P1P2PPP/8 w - - 0 1',
    '8/2k5/2n3p1/2pb4/6PP/2P1P3/1P5K/6R1 w - - 0 1',
    '8/2q5/8/4P2Q/5PK1/8/1k6/8 w - - 0 1',
    '8/3K2Q1/8/1p6/2p5/4p3/3k4/8 w - - 0 1',
    '8/3K2Q1/8/8/8/8/4p3/4k3 w - - 0 1',
    '8/3b3p/8/1P2P3/8/2K5/5k2/8 w - - 0 1',
    '8/4b1k1/8/6p1/7p/p6P/4BKP1/8 w - - 0 1',
    '8/4k3/4p3/1p2Ppp1/1Pb5/4KP2/2R3P1/8 w - - 0 1',
    '8/4k3/5p2/4p3/4P3/8/5K2/8 w - - 0 1',
    '8/5k2/4p3/4P1K1/8/8/8/8 w - - 0 1',
    '8/5k2/4q3/2Q5/2KP4/8/8/8 w - - 0 1',
    '8/5k2/6p1/3K2p1/6B1/7P/8/8 w - - 0 1',
    '8/5kpp/5n2/8/8/8/6PP/4R1K1 w - - 0 1',
    '8/5p2/5Np1/4k1P1/8/8/4K3/8 w - - 0 1',
    '8/5p2/p1p5/4kp1p/PPP1p2P/4K1P1/8/8 w - - 0 1',
    '8/5pk1/r5pp/P7/3R3P/6P1/5PK1/8 w - - 0 1',
    '8/5ppp/8/5PPP/1p6/2k5/5K2/8 w - - 0 1',
    '8/5ppp/8/5PPP/8/2k5/8/1K6 w - - 0 1',
    '8/6k1/4K1p1/6Pp/8/8/8/8 w - - 0 1',
    '8/6k1/R7/7P/6PK/8/p7/r7 w - - 0 1',
    '8/6p1/2P1n3/KPk1p2P/3pP2P/3P1P2/2P5/8 w - - 0 1',
    '8/6pp/5p2/3k1PP1/5K1P/8/8/8 w - - 0 1',
    '8/7Q/8/7K/2p2p2/3p1p2/4k3/8 w - - 0 1',
    '8/7k/6p1/4pQ2/3q2PK/7P/5P2/8 w - - 0 1',
    '8/7k/8/5pKp/8/6pr/2R5/8 w - - 0 1',
    '8/7p/5K2/5N2/6k1/6P1/8/8 w - - 0 1',
    '8/7r/1P1K4/3P4/8/5k2/8/8 w - - 0 1',
    '8/7r/1P6/2P2k2/3K4/8/8/8 w - - 0 1',
    '8/8/1k6/1p6/8/7R/1K5p/7r w - - 0 1',
    '8/8/1p1k4/5pp1/PPK1p2p/6P1/5PP1/8 w - - 0 1',
    '8/8/2k5/8/8/6Q1/4K3/8 w - - 0 1',
    '8/8/2p5/B5kP/p3n3/PP6/K7/8 w - - 0 1',
    '8/8/4b1p1/2k2p2/p1p1pP2/PpP1P1PK/1P1N4/8 w - - 0 1',
    '8/8/4k2p/8/pP1pp3/P5P1/3K3P/8 w - - 0 1',
    '8/8/4ppk1/3pP3/1P1RpPP1/8/1r6/6K1 w - - 0 1',
    '8/8/5k2/1pr5/5PK1/8/8/1R6 w - - 0 1',
    '8/8/5p2/3nk2K/6P1/5R2/8/8 w - - 0 1',
    '8/8/5pkp/5Rp1/q5P1/3R1P1P/4P1K1/8 w - - 0 1',
    '8/8/6p1/3k1pBp/7P/4K3/8/8 w - - 0 1',
    '8/8/7R/8/3pk3/8/1r6/3K4 w - - 0 1',
    '8/8/7p/6p1/8/7P/4k1K1/8 w - - 0 1',
    '8/8/8/2k1K2p/6bP/8/3R4/8 w - - 0 1',
    '8/8/8/4p3/4P3/3k1K2/8/8 w - - 0 1',
    '8/8/8/6p1/3R4/7k/3K4/8 w - - 0 1',
    '8/8/8/8/1K6/8/2p3Q1/1k6 w - - 0 1',
    '8/8/8/8/2R5/6pk/1r6/6K1 w - - 0 1',
    '8/8/8/8/5K2/8/R7/5bk1 w - - 0 1',
    '8/8/8/8/6K1/8/R7/6kn w - - 0 1',
    '8/8/8/8/8/4N2p/5K2/7k w - - 0 1',
    '8/8/8/8/8/6Q1/1p2K3/1k6 w - - 0 1',
    '8/8/8/p6p/P4k1P/8/3K4/8 w - - 0 1',
    '8/8/P7/1PK5/8/8/8/r3k3 w - - 0 1',
    '8/8/PK1n3p/7P/1k3p2/5Np1/6P1/8 w - - 0 ',
    '8/8/p1P1k3/B5pp/5p2/5K2/8/8 w - - 0 1',
    '8/8/p7/P3kpp1/2p5/2P1PPK1/5P2/8 w - - 0 1',
    '8/BK6/6p1/b2k4/P5P1/8/8/8 w - - 0 1',
    '8/PK3B2/1n6/2k5/8/8/8/8 w - - 0 1',
    '8/R4pk1/4b1pp/1p6/8/4K2P/5PP1/8 w - - 0 1',
    '8/p1p3k1/5p2/8/8/P7/4BKP1/2n5 w - - 0 1',
    '8/p4k1p/1p2bpp1/8/8/2P5/PP3PPP/1B3K2 w - - 0 1',
    '8/p4p2/1p1k1pbp/3p4/3P1KBP/8/PP3PP1/8 w - - 0 1',
    '8/p7/1p1k2p1/6P1/P1K5/8/1P6/8 w - - 0 1',
    '8/p7/3k4/3P4/3K1Ppp/8/P6P/8 w - - 0 1',
    '8/p7/8/1p1k3p/8/7P/6P1/B5K1 w - - 0 1',
    '8/ppp1kppp/8/8/3KP3/P7/1P3PPP/8 w - - 0 1',
    'K7/2Q5/8/8/3q3p/3p4/3P1k2/8 w - - 0 1',
    'K7/8/2P5/8/3q4/8/5k2/8 w - - 0 1',
    'R7/P5k1/8/8/5P2/8/r7/6K1 w - - 0 1',
    'b5k1/6pR/p1nB2P1/1p1npPP1/3p4/8/PPP5/2K5 w - - 0 1',
    'r2rk3/8/5p2/PPPPp1p1/2K4p/4NP1P/6P1/8 w - - 0 1',
    'r4r2/1b2bp2/pp5k/2ppp3/5PQ1/1P2P3/P1PP2PP/R5K1 w - - 0 1',
    'r5k1/5p2/2p1r3/2P5/1Q5P/1P2P1P1/5P2/6K1 w - - 0 1',
    'r5k1/6pp/6q1/3pBp2/3N4/5P2/3Q1KP1/8 w - - 0 1',
];

const FEN_POSITIONS = [
    // Add your FEN positions here
    'rnbqkb1r/pppppppp/5n2/8/8/5N2/PPPPPPPP/RNBQKB1R w KQkq - 1 2',
    'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
    'rnbqkbnr/ppp1pppp/3p4/8/3PP3/8/PPP2PPP/RNBQKBNR b KQkq - 0 2',
    'rnbqkb1r/ppp1pppp/3p1n2/8/3PP3/2N5/PPP2PPP/R1BQKBNR b KQkq - 2 3',
    // Add more positions as needed
];