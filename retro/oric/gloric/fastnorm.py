import math

tabmult_sqrt2 = [round (  i*(math.sqrt(2))) for i in range (128) ]

tabmult_sqrt2_m1 = [round (  i*(math.sqrt(2)-1)) for i in range (128) ]

tabmult_sqrt5_div2 = [round (  i*(math.sqrt(5)/2)) for i in range (128) ]

tabmult_sqrt5_m_sqrt2 = [round (  i*(math.sqrt(5)-math.sqrt(2))) for i in range (128) ]

tabmult_2sqrt2_m_sqrt5 = [round (  i*(2*math.sqrt(2)-math.sqrt(5))) for i in range (128) ]

tabmult_sqrt5_div2_m1 = [round (  i*((math.sqrt(5)/2.0)-1)) for i in range (128) ]

def norm (x,y):
    return math.sqrt(x**2 + y**2)

def fakenorm1stOrder_int  (x,y):
    if x>y:
        return x+tabmult_sqrt2_m1[y]
    else:
        return y+tabmult_sqrt2_m1[x]

def fakenorm2ndOrder (px,py):
    ax, ay = abs(px), abs(py)
    if ax==ay:
       return math.sqrt(2) * ax
    elif ax > ay:
        x, y = ax, ay
    else:
        x, y = ay, ax
    if y == x/2:
        return x*(math.sqrt(5)/2)
    elif y > x/2 :
        N = (math.sqrt(5)-math.sqrt(2))*x + (2*math.sqrt(2) - math.sqrt(5))*y
    else:
        N = x+(math.sqrt(5)/2 - 1)*y
    return N

def fakenorm2ndOrder_int (px,py):
    ax, ay = abs(px), abs(py)
    if ax==ay:
       return tabmult_sqrt2[ax]
    elif ax >= ay:
        x, y = ax, ay
    else:
        x, y = ay, ax
    if y == x/2:
        return tabmult_sqrt5_div2[x] #x*(math.sqrt(5)/2)
    elif y > x/2 :
        # N = (math.sqrt(5)-math.sqrt(2))*x + (2*math.sqrt(2) - math.sqrt(5))*y
        N = tabmult_sqrt5_m_sqrt2 [x] + tabmult_2sqrt2_m_sqrt5[y]
    else:
        # N = x+(math.sqrt(5)/2 - 1)*y
        N = x + tabmult_sqrt5_div2_m1 [y]
    return N

nb_max = 127
tab_err = []
def exploreDomain():

    for x in range (0, nb_max+1):
        for y in range (0,x+1):

#    x,y = 127,64
            real_norm = norm(x,y)

            firstNorm = fakenorm1stOrder_int(x,y)

            secondNorm = fakenorm2ndOrder_int(x,y)

            err = norm(x,y) - fakenorm2ndOrder_int(x,y)
            if (err > 0.5) :
                #print ("%d %d norm = %f err = %f"%(x,y,real_norm, err))
                tab_err.append([x, y , err])
    #for i in range (0,len(tabmult),8):
    #        print (', '.join(tabmult[i:i+8]))
    #        if i%8 == 0 : print ("\n")
    print ("score = ", sum ([er for [x, y, er] in tab_err]))

def analyseErr (x, y):
    print ("--------------")
    print ("X = %d , Y = %d, n = %f, err = %f"%(x, y, norm(x,y), norm(x,y) - fakenorm2ndOrder_int(x,y)))
    if y > x/2 :
        print ("y > x/2")
        # N = (math.sqrt(5)-math.sqrt(2))*x + (2*math.sqrt(2) - math.sqrt(5))*y
        intN = tabmult_sqrt5_m_sqrt2 [x] + tabmult_2sqrt2_m_sqrt5[y]
        fltN = (math.sqrt(5)-math.sqrt(2))*x + (2*math.sqrt(2) - math.sqrt(5))*y
        print ("(sqrt5 - sqrt2)*x = %d ins of %f, (2sqrt2 - sqrt5)*y = %d ins of %f"%(tabmult_sqrt5_m_sqrt2 [x],(math.sqrt(5)-math.sqrt(2))*x , tabmult_2sqrt2_m_sqrt5[y], (2*math.sqrt(2) - math.sqrt(5))*y))
    else:
        print ("y <= x/2")
        # N = x+(math.sqrt(5)/2 - 1)*y
        intN = x + tabmult_sqrt5_div2_m1 [y]
        fltN = x+(math.sqrt(5)/2 - 1)*y
        print ("(sqrt5 / 2 - 1 )*y = %d ins of %f"%(tabmult_sqrt5_div2_m1 [y] , (math.sqrt(5)/2 - 1)*x))
    print ("intN = %d , fltN = %f"%(intN, fltN))

def fixTable ():
    tabmult_sqrt5_m_sqrt2 [3]=3
    tabmult_sqrt5_div2_m1 [3]=1
    tabmult_sqrt5_div2_m1 [4]=1
    tabmult_sqrt5_div2_m1 [7]=2
    tabmult_sqrt5_m_sqrt2 [15]=13
    tabmult_sqrt5_div2_m1 [8]=2
    #tabmult_sqrt5_div2_m1 [7] = 1

def main():
    fixTable ()
    exploreDomain()
    cur_err = tab_err [0]
    analyseErr (cur_err[0], cur_err[1])
if __name__ == '__main__':
    main()


