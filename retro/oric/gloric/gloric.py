#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     08/11/2019
# Copyright:   (c) tbpk7658 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import math
nbfaces = 2
nbpoints = 4
faces = [[1, 2, 3, 0], [3, 4, 1, 0]]
points = [[1, 1, 0], [1, 1, 1], [2, 1, 1], [2, 1, 0]]
campos=[0, 0, 0]
camori=[0, 0]

def main():
    for p in points:
        ang = math.atan2((p[1]-campos[1]),(p[0]-campos[0]))
        dist = math.sqrt ((p[1]-campos[1])**2+(p[0]-campos[0])**2)
        print (str (p), ang, dist)
    pass

if __name__ == '__main__':
    main()
