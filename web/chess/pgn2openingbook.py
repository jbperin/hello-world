import json
import chess.pgn

Account="Petrov"
DEPTH_HALF_MOVE = 24

#  cat games_Short.pgn games_Botvinnik.pgn games_Korchnoi.pgn > french_players.pgn
# pgn = open(f"C:\\Users\\tbpk7658\\Documents\\repos\\hello-world\\web\\chess\\french_players.pgn", encoding="ansi")

#  cat games_Karpov.pgn games_Botvinnik.pgn games_Petrosian.pgn > caro_players.pgn
# pgn = open(f"C:\\Users\\tbpk7658\\Documents\\repos\\hello-world\\web\\chess\\caro_players.pgn", encoding="ansi")

#  cat games_Caruana.pgn games_Nepomniachtchi.pgn games_Kramnik.pgn > petrov_players.pgn
pgn = open(f"C:\\Users\\tbpk7658\\Documents\\repos\\hello-world\\web\\chess\\petrov_players.pgn", encoding="ansi")

theGame = chess.pgn.read_game(pgn)
gamesAsWhite = []
gamesAsBlack = []
while theGame:
    # print (theGame.headers)
    # Petrov
    if "ECO" in theGame.headers and theGame.headers["ECO"] in ["C42", "C43"]:

    # Caro Kaan
    # if "ECO" in theGame.headers and theGame.headers["ECO"] in ["B10", "B11", "B12", "B13", "B14", "B15", "B16", "B17", "B18", "B19"]:

    # French
    # if "ECO" in theGame.headers and theGame.headers["ECO"] in ["C00", "C01", "C02", "C03", "C04", "C05", "C06", "C07", "C08", "C09",
    #                               "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17", "C18", "C19"]:
        gamesAsWhite.append(theGame)
        gamesAsBlack.append(theGame)

    # if theGame.headers["ECO"] in ["B10", "B11", "B12", "B13", "B14", "B15", "B16", "B17", "B18", "B19"]:
    #     print ("caro kahn")
    #     if theGame.headers["White"].startswith(Account):
    #         gamesAsWhite.append(theGame)
    #     elif theGame.headers["Black"].startswith(Account):   
    #         gamesAsBlack.append(theGame)
    #     else:
    #         print (f"not a game with {Account}")
    #         continue
    theGame = chess.pgn.read_game(pgn)



print (f"{len(gamesAsWhite)} parties avec les blancs, {len(gamesAsBlack)} parties avec les noirs," )

whiteGameTree = chess.pgn.Game()    
whiteGameTree.headers["White"] = "Various"
whiteGameTree.headers["Black"] = "Various"
current_variation = whiteGameTree
nbGamesAsWhite= len(list(gamesAsWhite))
for wgam in gamesAsWhite:
    theBoard = chess.Board(chess.STARTING_FEN)
    current_variation = whiteGameTree
    current_variation.comment = f'{{"nb_occ":{nbGamesAsWhite}}}'
    # print (wgam)
    game_moves = list(wgam.mainline_moves())
    for move in game_moves[0:min(len(game_moves), DEPTH_HALF_MOVE)]:
        try:
            theBoard.push(move)
        except:
            print ("Unexpected move")
            break
        if not current_variation.has_variation(move):
            current_variation = current_variation.add_variation(move)
            current_variation.comment ='{"nb_occ":1}'
        else:
            current_variation = current_variation.variation(move)
            comment = current_variation.comment 
            # print (comment)
            dcomment = json.loads(comment)
            dcomment['nb_occ'] = dcomment['nb_occ'] + 1
            current_variation.comment = json.dumps(dcomment)

blackGameTree = chess.pgn.Game()    
blackGameTree.headers["White"] = "Various"
blackGameTree.headers["Black"] = "Various"
current_variation = blackGameTree
nbGamesAsBlack= len(list(gamesAsBlack))
for wgam in gamesAsBlack:
    theBoard = chess.Board(chess.STARTING_FEN)
    current_variation = blackGameTree
    current_variation.comment = f'{{"nb_occ":{nbGamesAsBlack}}}'
    # print (wgam)
    game_moves = list(wgam.mainline_moves())
    for move in game_moves[0:min(len(game_moves), DEPTH_HALF_MOVE)]:
        try:
            theBoard.push(move)
        except:
            print ("Unexpected move")
            break
        if not current_variation.has_variation(move):
            current_variation = current_variation.add_variation(move)
            current_variation.comment ='{"nb_occ":1}'
        else:
            current_variation = current_variation.variation(move)
            comment = current_variation.comment 
            # print (comment)
            dcomment = json.loads(comment)
            dcomment['nb_occ'] = dcomment['nb_occ'] + 1
            current_variation.comment = json.dumps(dcomment)


def explore (gameNode, depth):
    if depth != 0:
        nb_tot_occ = int(json.loads(gameNode.comment)['nb_occ'])
        for var in gameNode.variations:
            dcomment = json.loads(var.comment)
            # print (dcomment['nb_occ'], " sur ", nb_tot_occ)
            dcomment ["prob"]=int(dcomment['nb_occ'])/nb_tot_occ
            var.comment = json.dumps(dcomment)
        for var in gameNode.variations:
            # print (depth, gameNode.board().fen(), gameNode.comment)
            explore (var, depth-1)
        
        # print (depth, gameNode.board().fen(), gameNode.comment)
    else:
        nb_tot_occ = int(json.loads(gameNode.comment)['nb_occ'])
        for var in gameNode.variations:
            dcomment = json.loads(var.comment)
            # print (dcomment['nb_occ'], " sur ", nb_tot_occ)
            dcomment ["prob"]=int(dcomment['nb_occ'])/nb_tot_occ
            var.comment = json.dumps(dcomment)
        # print (depth, gameNode.board().fen(), gameNode.comment)


nb_tot_occ = int(json.loads(whiteGameTree.comment)['nb_occ'])
for var in whiteGameTree.variations:
    dcomment = json.loads(var.comment)
    # print (dcomment['nb_occ'], " sur ", nb_tot_occ)
    dcomment ["prob"]=int(dcomment['nb_occ'])/nb_tot_occ
    var.comment = json.dumps(dcomment)
    explore (var, DEPTH_HALF_MOVE)


nb_tot_occ = int(json.loads(blackGameTree.comment)['nb_occ'])
for var in blackGameTree.variations:
    dcomment = json.loads(var.comment)
    # print (dcomment['nb_occ'], " sur ", nb_tot_occ)
    dcomment ["prob"]=int(dcomment['nb_occ'])/nb_tot_occ
    var.comment = json.dumps(dcomment)
    explore (var, DEPTH_HALF_MOVE)


print ("=================")

print ("=================")


# print (whiteGameTree.variations[0])    
# print (blackGameTree.variations[0])

new_pgn = open(f"{Account}_as_White.pgn", "w", encoding="utf-8")
exporter = chess.pgn.FileExporter(new_pgn)
whiteGameTree.accept(exporter)

new_pgn = open(f"{Account}_as_Black.pgn", "w", encoding="utf-8")
exporter = chess.pgn.FileExporter(new_pgn)
blackGameTree.accept(exporter)


def expose (gameNode, depth):
    muvstack = gameNode.board().move_stack
    prob = float(json.loads(gameNode.comment)['prob'])
    indent_string = ''.join(['\t']*(len(muvstack)-1))
    print (indent_string, muvstack[-1], prob*100)
    if depth != 0:
        for var in gameNode.variations:
            expose (var, depth-1)
    # if depth != 0:
    #     nb_tot_occ = int(json.loads(gameNode.comment)['nb_occ'])
    #     for var in gameNode.variations:
    #         dcomment = json.loads(var.comment)
    #         # print (dcomment['nb_occ'], " sur ", nb_tot_occ)
    #         dcomment ["prob"]=int(dcomment['nb_occ'])/nb_tot_occ
    #         var.comment = json.dumps(dcomment)
    #     for var in gameNode.variations:
    #         # print (depth, gameNode.board().fen(), gameNode.comment)
    #         explore (var, depth-1)
        
    #     print (depth, gameNode.board().fen(), gameNode.comment)
    # else:
    #     nb_tot_occ = int(json.loads(gameNode.comment)['nb_occ'])
    #     for var in gameNode.variations:
    #         dcomment = json.loads(var.comment)
    #         # print (dcomment['nb_occ'], " sur ", nb_tot_occ)
    #         dcomment ["prob"]=int(dcomment['nb_occ'])/nb_tot_occ
    #         var.comment = json.dumps(dcomment)
    #     print (depth, gameNode.board().fen(), gameNode.comment)



# print ("===== White model")

# for var in whiteGameTree.variations:
#     expose (var, 6)

# print ("===== Black model")
# for var in blackGameTree.variations:
#     expose (var, 6)


print ("===== Opening Book")
dictWhitePos={}
dictBlackPos={}

def buildBook (gameNode, depth, color, dictPos):

    currPos = gameNode.board().fen()
    if gameNode.board().turn != color and currPos not in dictPos.keys():
        dictPos[currPos]=[]

    # # print (gameNode.board().fen(en_passant='fen'))
    # poss = [vari.board().move_stack[-1] for vari in gameNode.variations]
    # # print (poss)
    # muvstack = gameNode.board().move_stack
    # prob = float(json.loads(gameNode.comment)['prob'])
    # indent_string = ''.join(['\t']*(len(muvstack)-1))
    # print (indent_string, muvstack[-1], prob*100)
    if depth != 0:
        for var in gameNode.variations:
            if var.board().turn == color:
                # print (var.board().fen(), var.board().move_stack[-1], 
                #     float(json.loads(var.comment)['prob']))
                dictPos[currPos].append({
                    "move": var.board().move_stack[-1], 
                    "prob":float(json.loads(var.comment)['prob'])
                })
                # print ("add ", {
                #     "move": var.board().move_stack[-1], 
                #     "prob":float(json.loads(var.comment)['prob'])
                # }, "to", currPos)
            buildBook (var, depth-1, color, dictPos)



# print ("===== White Book")

# currPos = whiteGameTree.board().fen()
# dictWhitePos[currPos]=[]
# for var in whiteGameTree.variations:
#     if var.board().turn == chess.BLACK:
#         print (var.board().fen(), var.board().move_stack[-1], 
#             float(json.loads(var.comment)['prob']))
#         dictWhitePos[currPos].append({
#             "move": var.board().move_stack[-1], 
#             "prob":float(json.loads(var.comment)['prob'])
#         })
#         print ("add ", {
#             "move": var.board().move_stack[-1], 
#             "prob":float(json.loads(var.comment)['prob'])
#         }, "to", currPos)        
#     buildBook (var, 6, chess.BLACK, dictWhitePos)

def runThrough (gameNode, depth, dictOpening):
    muvstack = gameNode.board().move_stack
    listmuv = [muv.uci() for muv in muvstack]
    ptr = dictOpening
    for mv in listmuv[:-1]:
        ptr = [ent for ent in ptr if ent['mov'] == mv][0]['vars']
    ptr.append({
        "mov"   :muvstack[-1].uci(),
        'prob'  : float(json.loads(gameNode.comment)['prob']),
        'vars'  : []
    })
    if depth != 0:
        for var in gameNode.variations:
            runThrough (var, depth-1, dictOpening)

dictWhiteOpening = []
for var in whiteGameTree.variations:
    runThrough (var, DEPTH_HALF_MOVE, dictWhiteOpening)

with open(f"opening_wt_{Account}.js", "w") as ficout:
    ficout.write ("const openingBookWhite = "+json.dumps(dictWhiteOpening))
dictBlackOpening = []
for var in blackGameTree.variations:
    runThrough (var, DEPTH_HALF_MOVE, dictBlackOpening)

with open(f"opening_bk_{Account}.js", "w") as ficout:
    ficout.write ("const openingBookBlack = "+json.dumps(dictWhiteOpening))

