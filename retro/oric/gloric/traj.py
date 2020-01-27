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
RADIUS = 8

def main():
    for ii in range (0,NB_POINTS_TRAJ):
        angle = ii * (2*math.pi)/NB_POINTS_TRAJ;
        x, y = int(RADIUS* math.cos (angle)), int(RADIUS * math.sin(angle))
        rotZ = -round((math.pi-angle)*(128/math.pi))

        print (",%d, %d, %d"%(x, y , rotZ))

if __name__ == '__main__':
    main()
