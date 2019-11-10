10     LET ADRBASE = # 800
20     ' Je stocke mes donnees en memoire
30     FOR N=0TO5
40     : READ DTA: POKE ADRBASE+N,DTA
50     NEXT N
60     ' Je relis mes donnees depuis la memoire
70     LET OFFSET = 0
80     V1 = DEEK (ADRBASE + OFFSET): OFFSET = OFFSET + 2
90     V2 = DEEK (ADRBASE + OFFSET): OFFSET = OFFSET + 2
100     V3 = DEEK (ADRBASE + OFFSET): OFFSET = OFFSET + 2
110     PRINT "V1 = ";V1;", V2 = ";V2;", V3 = ";V3
120     ' Mes donnees
130     DATA 3, 0, #FE, 0, 2, 0
