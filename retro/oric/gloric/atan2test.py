import math
N=8

with open('output.txt', 'w') as file:  # Use file to refer to the file object


    for X in range (-N,N+1):
        for Y in range (-N,N+1):
            exp = round(math.atan2(Y,X)*(128.0/math.pi))
            if (exp == 128):  exp = -128
            file.write("""\tTanX = %d; TanY = %d; Arctan8 = 0;
\tatan2 ();
\tif (Arctan8!=%d) printf("ERR atan2 (%%d, %%d) = %%d exp=%d\\n", TanX, TanY, Arctan8);
            \n"""%(X, Y
            , exp
            , exp
            ))
            #print (tmplt)

