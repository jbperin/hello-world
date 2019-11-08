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

LE = 40
HE = 27
EAH = math.radians(60)
EAV = math.radians(40)
LV = LE / 2
HV = HE / 2

nbfaces = 2
nbpoints = 4
faces = [[1, 2, 3, 0], [3, 4, 1, 0]]
points = [[1, 1, 0], [1, 1, 1], [2, 1, 1], [2, 1, 0]]
campos=[0, 0, 1]
camori=[0, 0]

def main():
    for p in points:
        ang1 = math.atan2((p[1]-campos[1]),(p[0]-campos[0]))
        dist = math.sqrt ((p[1]-campos[1])**2+(p[0]-campos[0])**2)
        ang2 = math.atan2((p[2]-campos[2]),dist)
        print (str (p), ang1, dist, ang2)
        
        X = ((ang1 * LV) / EAH) + LV
        Y = ((-ang2 * HV) / EAV) + HV
        print (X, Y)
    pass

if __name__ == '__main__':
    main()
