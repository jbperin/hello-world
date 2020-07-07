#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      TBPK7658
#
# Created:     27/01/2020
# Copyright:   (c) TBPK7658 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import math

NB_POINTS_TRAJ = 64
RADIUS = 80

def genTraj():
    res = """
#define NB_POINTS_TRAJ %d
#define SIZE_POINTS_TRAJ 3
signed char traj[] = {
"""%(NB_POINTS_TRAJ)
    first = True
    for ii in range (0,NB_POINTS_TRAJ):
        angle = ii * (2*math.pi)/NB_POINTS_TRAJ;
        x, y = int(RADIUS* math.cos (angle)), int(RADIUS * math.sin(angle))
        rotZ = -round((math.pi-angle)*(128/math.pi))
        if first:
            res += "\t%d, %d, %d\n"%(x, y , rotZ)
            first = False
        else:
            res += "\t,%d, %d, %d\n"%(x, y , rotZ)
    res += "\n};"
    return res

def main():
    with open ("traj_c.c",'w') as fic:
        fic.write(genTraj())

if __name__ == '__main__':
    main()
