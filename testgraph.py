#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     19/12/2019
# Copyright:   (c) tbpk7658 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------

import math
from operator import itemgetter, attrgetter, methodcaller

import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits import mplot3d


tabmult_sqrt2 = [round (  i*(math.sqrt(2))) for i in range (128) ]

tabmult_sqrt2_m1 = [round (  i*(math.sqrt(2)-1)) for i in range (128) ]

tabmult_sqrt5_div2 = [round (  i*(math.sqrt(5)/2)) for i in range (128) ]

tabmult_sqrt5_m_sqrt2 = [round (  i*(math.sqrt(5)-math.sqrt(2))) for i in range (128) ]

tabmult_2sqrt2_m_sqrt5 = [round (  i*(2*math.sqrt(2)-math.sqrt(5))) for i in range (128) ]

tabmult_sqrt5_div2_m1 = [round ( i*(  (math.sqrt(5)-2.0))  ) for i in range (128) ]


def fixTable ():
    tabmult_sqrt5_m_sqrt2 [3]=3
    #tabmult_sqrt5_m_sqrt2 [7] = 5
    #tabmult_sqrt5_m_sqrt2[6] = 4
    tabmult_sqrt5_m_sqrt2 [8] = 6
    #tabmult_sqrt5_m_sqrt2 [15]=13
    #tabmult_sqrt5_m_sqrt2 [20] = 17
    tabmult_sqrt5_m_sqrt2 [78]=63


    #tabmult_2sqrt2_m_sqrt5 [6] = 4
    #tabmult_2sqrt2_m_sqrt5 [16] = 10
    #tabmult_sqrt5_div2_m1 []=
    #tabmult_sqrt5_m_sqrt2 [] =

    #tabmult_2sqrt2_m_sqrt5 [] =
    tabmult_2sqrt2_m_sqrt5[4] = 2
    #tabmult_2sqrt2_m_sqrt5[7] = 5
    tabmult_2sqrt2_m_sqrt5[11] = 6
    #tabmult_2sqrt2_m_sqrt5[6] = 3
    #tabmult_2sqrt2_m_sqrt5[6] = 3
    tabmult_2sqrt2_m_sqrt5[50] = 29
    tabmult_2sqrt2_m_sqrt5[51] = 30
    tabmult_2sqrt2_m_sqrt5[52] = 30
    tabmult_2sqrt2_m_sqrt5[53] = 31
    tabmult_2sqrt2_m_sqrt5[54] = 31
    tabmult_2sqrt2_m_sqrt5[55] = 32
    tabmult_2sqrt2_m_sqrt5[56] = 32
    tabmult_2sqrt2_m_sqrt5[57] = 33
    tabmult_2sqrt2_m_sqrt5[58] = 33
    tabmult_2sqrt2_m_sqrt5[59] = 34
    tabmult_2sqrt2_m_sqrt5[60] = 34
    tabmult_2sqrt2_m_sqrt5[61] = 35
    tabmult_2sqrt2_m_sqrt5[62] = 36
    tabmult_2sqrt2_m_sqrt5[63] = 36
    tabmult_2sqrt2_m_sqrt5[64] = 37
    tabmult_2sqrt2_m_sqrt5[65] = 37
    tabmult_2sqrt2_m_sqrt5[66] = 38
    tabmult_2sqrt2_m_sqrt5[67] = 38
    tabmult_2sqrt2_m_sqrt5[68] = 39
    tabmult_2sqrt2_m_sqrt5[69] = 40
    tabmult_2sqrt2_m_sqrt5[70] = 41
    tabmult_2sqrt2_m_sqrt5[71] = 41
    tabmult_2sqrt2_m_sqrt5[72] = 42
    tabmult_2sqrt2_m_sqrt5[73] = 42
    tabmult_2sqrt2_m_sqrt5[74] = 43
    tabmult_2sqrt2_m_sqrt5[75] = 43
    tabmult_2sqrt2_m_sqrt5[76] = 44
    tabmult_2sqrt2_m_sqrt5[77] = 44
    tabmult_2sqrt2_m_sqrt5[78] = 45
    tabmult_2sqrt2_m_sqrt5[79] = 45
    tabmult_2sqrt2_m_sqrt5[80] = 46
    tabmult_2sqrt2_m_sqrt5[81] = 47
    tabmult_2sqrt2_m_sqrt5[82] = 47
    tabmult_2sqrt2_m_sqrt5[83] = 48
    tabmult_2sqrt2_m_sqrt5[84] = 48
    tabmult_2sqrt2_m_sqrt5[85] = 49
    tabmult_2sqrt2_m_sqrt5[86] = 49
    tabmult_2sqrt2_m_sqrt5[87] = 50
    tabmult_2sqrt2_m_sqrt5[88] = 51
    tabmult_2sqrt2_m_sqrt5[89] = 51
    tabmult_2sqrt2_m_sqrt5[90] = 52
    tabmult_2sqrt2_m_sqrt5[91] = 53
    tabmult_2sqrt2_m_sqrt5[92] = 53
    tabmult_2sqrt2_m_sqrt5[93] = 54
    tabmult_2sqrt2_m_sqrt5[94] = 54
    tabmult_2sqrt2_m_sqrt5[95] = 55
    tabmult_2sqrt2_m_sqrt5[96] = 55
    tabmult_2sqrt2_m_sqrt5[97] = 56
    tabmult_2sqrt2_m_sqrt5[98] = 57
    tabmult_2sqrt2_m_sqrt5[99] = 57
    tabmult_2sqrt2_m_sqrt5[100] = 58
    tabmult_2sqrt2_m_sqrt5[101] = 59
    tabmult_2sqrt2_m_sqrt5[102] = 59
    tabmult_2sqrt2_m_sqrt5[103] = 60
    tabmult_2sqrt2_m_sqrt5[104] = 60
    tabmult_2sqrt2_m_sqrt5[105] = 61
    tabmult_2sqrt2_m_sqrt5[106] = 61
    tabmult_2sqrt2_m_sqrt5[107] = 62
    tabmult_2sqrt2_m_sqrt5[108] = 63
    tabmult_2sqrt2_m_sqrt5[109] = 64
    tabmult_2sqrt2_m_sqrt5[110] = 64
    tabmult_2sqrt2_m_sqrt5[111] = 64
    tabmult_2sqrt2_m_sqrt5[112] = 66
    tabmult_2sqrt2_m_sqrt5[113] = 66
    tabmult_2sqrt2_m_sqrt5[114] = 66
    #tabmult_sqrt5_div2_m1 [3]=1
    #tabmult_sqrt5_div2_m1 [4]=1
    #tabmult_sqrt5_div2_m1 [7]=2
    #tabmult_sqrt5_div2_m1 [8]=2
    #tabmult_sqrt5_div2_m1 [9]=2
    #tabmult_sqrt5_div2_m1 [10]=3
    #tabmult_sqrt5_div2_m1 [11]=3
    #tabmult_sqrt5_div2_m1 [12]=2
    #tabmult_sqrt5_div2_m1 [15] =3
    tabmult_sqrt5_div2_m1 [11] =2
    tabmult_sqrt5_div2_m1 [12] =2
    tabmult_sqrt5_div2_m1 [13] =2
    tabmult_sqrt5_div2_m1 [14] =2
    tabmult_sqrt5_div2_m1 [15] =2
    tabmult_sqrt5_div2_m1 [16] =2
    tabmult_sqrt5_div2_m1 [17] =3
    tabmult_sqrt5_div2_m1 [18] =3
    tabmult_sqrt5_div2_m1 [19] =3
    tabmult_sqrt5_div2_m1 [20]=3
    tabmult_sqrt5_div2_m1 [21]=3
    tabmult_sqrt5_div2_m1 [22]=3
    tabmult_sqrt5_div2_m1 [23]=3
    tabmult_sqrt5_div2_m1 [24]=4
    tabmult_sqrt5_div2_m1 [25]=4
    tabmult_sqrt5_div2_m1 [26]=4
    tabmult_sqrt5_div2_m1 [27]=4
    tabmult_sqrt5_div2_m1 [28]=4
    tabmult_sqrt5_div2_m1 [29]=5
    tabmult_sqrt5_div2_m1 [30]=5
    tabmult_sqrt5_div2_m1 [31]=5
    tabmult_sqrt5_div2_m1 [32]=5
    tabmult_sqrt5_div2_m1 [33]=6
    tabmult_sqrt5_div2_m1 [34]=6
    tabmult_sqrt5_div2_m1 [35]=6
    tabmult_sqrt5_div2_m1 [36]=6
    tabmult_sqrt5_div2_m1 [37]=7
    tabmult_sqrt5_div2_m1 [38]=7
    tabmult_sqrt5_div2_m1 [39]=7
    tabmult_sqrt5_div2_m1 [40]=8
    tabmult_sqrt5_div2_m1 [41] = 8
    tabmult_sqrt5_div2_m1 [42] = 8
    tabmult_sqrt5_div2_m1 [43] = 8
    tabmult_sqrt5_div2_m1 [44] = 9
    tabmult_sqrt5_div2_m1 [45] = 9
    tabmult_sqrt5_div2_m1 [46] = 9
    tabmult_sqrt5_div2_m1 [47] = 10
    tabmult_sqrt5_div2_m1 [48] = 10
    tabmult_sqrt5_div2_m1 [49] = 10
    tabmult_sqrt5_div2_m1 [50] = 10
    tabmult_sqrt5_div2_m1 [51] = 11
    tabmult_sqrt5_div2_m1 [52] = 11
    tabmult_sqrt5_div2_m1 [53] = 11
    tabmult_sqrt5_div2_m1 [54] = 11
    pass


def norm (x,y):
    return math.sqrt(x**2 + y**2)

def npnorm(x, y):
    return np.sqrt(x ** 2 + y ** 2)

def fakenorm2ndOrder_int (px,py):
    ax, ay = abs(px), abs(py)
    #if ax==ay:
    #   return tabmult_sqrt2[ax]
    #el
    if ax >= ay:
        x, y = ax, ay
    else:
        x, y = ay, ax
    #if y == x/2:
    #    return tabmult_sqrt5_div2[x] #x*(math.sqrt(5)/2)
    #el
    if y > x/2 :
        # N = (math.sqrt(5)-math.sqrt(2))*x + (2*math.sqrt(2) - math.sqrt(5))*y
        N = tabmult_sqrt5_m_sqrt2 [x] + tabmult_2sqrt2_m_sqrt5[y]
    else:
        # N = x+(math.sqrt(5)/2 - 1)*y
        N = x + tabmult_sqrt5_div2_m1 [y]
    return N


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
        N = x+(math.sqrt(5)-2)*y
    return N


def main ():

    fixTable()

    x = np.linspace(-127, 127, 255)
    y = np.linspace(-127, 127, 255)
    #x_data = np.asarray([er[0] for er in tab_err])
    #y_data = np.asarray([er[1] for er in tab_err])
    X, Y = np.meshgrid(x, y)
    Z = npnorm(X, Y)
    print (Z[0][0])
    for i in range (-127, 128):
        for j in range (-127, 128):
            res = fakenorm2ndOrder_int(i,j)
            nor = norm (i,j)
            Z[i+127][j+127] = res - nor
    print (fakenorm2ndOrder(i,j))
    fig = plt.figure()
    ax = plt.axes(projection='3d')

    #err_data = np.asarray([er[3] for er in tab_err])

    #ax.scatter3D(x_data, y_data, err_data,  cmap='binary');
    ax.contour3D(X, Y, Z, 50, cmap='binary')
    plt.show()


if __name__ == '__main__':
    main()

