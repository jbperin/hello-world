#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      TBPK7658
#
# Created:     24/01/2020
# Copyright:   (c) TBPK7658 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------


import sympy
from sympy import symbols


def main():
    d1, d2, p1x, p1y, p2x, p2y,theta, beta, A, B, C, D = symbols ('d1, d2, p1x, p1y, p2x, p2y, theta, beta, A, B, C, D')

    p1x = d1 * cos (theta)
    p1y = d1 * sin (theta)

    p2x = d2 * cos (beta)
    p2y = d2 * sin (beta)


    pass

if __name__ == '__main__':
    main()
