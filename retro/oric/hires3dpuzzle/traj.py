#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      TBPK7658
#
# Created:     27/01/2020
# Copyright:   (c) TBPK7658 2020
# Licence:     <your licence>
#
# https://en.wikipedia.org/wiki/Spherical_coordinate_system
# inclination : Theta  [0, PI]
# azimuth     : Phi    [0, 2* PI]
# X = R * sin (Theta) * cos (Phi)
# Y = R * sin (Theta) * sin (Phi)
# Z = R * cos (Theta)
#-------------------------------------------------------------------------------
import math

NB_STEP_AZIMTUH = 8
NB_STEP_INCLINATION = 5
RADIUS = 64

STEP_INCLINATION = round(180/(NB_STEP_INCLINATION+1))
STEP_AZIMUTH = round (360/(NB_STEP_AZIMTUH))

def table2text(name, values):
    res = f"signed char tab_traj_{name} [] = {{\n"
    first = True
    for v in values:
        if first:
            first = False
            h=""
        else:
            h=","
        res += f"\t{h}{v[0]},\t{v[1]},\t{v[2]},\t{v[3]},\t{v[4]}\n"
    res += "};\n"
    return res

def tableOfTable(tables):
    res = f"void * tab_traj [] = {{\n"
    first = True
    for key in tables:
        if first:
            first = False
            h=""
        else:
            h=","
        res += f"\t{h}tab_traj_{key}\n"
    res += "};\n"
    return res

def genTraj():
    tab_pos = {}
    for ii in range (STEP_INCLINATION, 180, STEP_INCLINATION):
        # print ("inclination = %d \n"%(ii))
        tab_pos["%d"%(ii)] = []
        for jj in range (0, 360, STEP_AZIMUTH):
            # print ("\tazimuth = %d \n"%jj)
            azimuth_radian = math.radians(jj)
            inclination_radian = math.radians(ii)
            X = RADIUS * math.sin (inclination_radian) * math.cos (azimuth_radian)
            Y = RADIUS * math.sin (inclination_radian) * math.sin (azimuth_radian)
            Z = RADIUS * math.cos (inclination_radian)
            # Rotation in fixed point representation
            RotX = (ii - 90)*128/180
            RotZ = (jj - 180)*128/180
            vals = list(map(round,[X, Y, Z, RotZ, RotX]))
            # vals = list([X, Y, Z])
            tab_pos["%d"%(ii)].append(vals)
    # print (tab_pos)

    pretext = f"#define NB_TRAJ_TABLE {len(tab_pos)}\n"
    pretext += f"#define FIRST_TRAJ_TABLE {round((len(tab_pos)-1)/2)}\n"
    pretext += f"#define NB_POINT_TRAJ {NB_STEP_AZIMTUH}\n"
    pretext += f"#define SIZE_POINT_TRAJ 5\n"
    print (pretext)
    txt = ""
    for key, value in tab_pos.items():
        txt += table2text (key, value)
        print (txt)
    txt2 = tableOfTable(tab_pos)
    print (txt2)

    with open ("traj_c.c",'w') as fic:
        fic.write(pretext)
        fic.write(txt)
        fic.write(txt2)

#     res = """
# #define NB_POINTS_TRAJ %d
# #define SIZE_POINTS_TRAJ 3
# signed char traj_%02d[] = {
# """%(NB_POINTS_TRAJ)
#     first = True
#     for ii in range (0,NB_POINTS_TRAJ):
#         angle = ii * (2*math.pi)/NB_POINTS_TRAJ;
#         x, y = int(RADIUS* math.cos (angle)), int(RADIUS * math.sin(angle))
#         rotZ = -round((math.pi-angle)*(128/math.pi))
#         if first:
#             res += "\t%d, %d, %d\n"%(x, y , rotZ)
#             first = False
#         else:
#             res += "\t,%d, %d, %d\n"%(x, y , rotZ)
#     res += "\n};"
#     return res

def main():
    genTraj()
    # with open ("traj_c.c",'w') as fic:
    #     fic.write(genTraj())

if __name__ == '__main__':
    main()
