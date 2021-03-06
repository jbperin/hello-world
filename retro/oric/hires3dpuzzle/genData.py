import math
import random
import os
from structSpacer import spaceStruct

SCREEN_WIDTH = 240
SCREEN_HEIGHT= 200

NB_STEP_AZIMTUH = 16
NB_STEP_INCLINATION = 5

TRAJ_RADIUS = 80

SHAPE_RADIUS            = round(TRAJ_RADIUS * math.sin(31*math.pi/128))

STEP_INCLINATION        = round(180/(NB_STEP_INCLINATION+1))
STEP_AZIMUTH            = round (360/(NB_STEP_AZIMTUH))

MIN_DISTANCE = TRAJ_RADIUS - SHAPE_RADIUS//2
MAX_DISTANCE = TRAJ_RADIUS + SHAPE_RADIUS//2


models = {

    "boat1":{
        "points":[[110, 32, 0], [111, 121, 0], [150, 109, 0], [156, 26, 0], [157, 113, 0], [203, 96, 0], [110, 136, 0], [156, 135, 0], [102, 44, 0], [50, 127, 0], [97, 85, 0], [106, 75, 0], [100, 104, 0], [57, 128, 0], [200, 128, 0], [81, 132, 0], [96, 156, 0], [142, 162, 0], [182, 156, 0], [184, 135, 0], [80, 132, 0], [96, 155, 0], [110, 138, 0]], 
        "segments":[[0, 6], [3, 7], [9, 6], [6, 7], [14, 7]], 
        "faces":[[8, 9, 10, 0], [11, 13, 12, 0], [1, 2, 0, 0], [3, 4, 5, 0], [20, 21, 6, 1], [6, 16, 17, 1], [17, 6, 7, 1], [7, 17, 18, 1], [18, 7, 19, 1], [19, 14, 7, 1]],  
        "soluce" : [-80, 6, 0, -3, 0]},

    # "boat":{
    #     "points":[[89, 17, 0], [92, 161, 0], [93, 138, 0], [145, 121, 0], [154, 10, 0], [154, 158, 0], [156, 127, 0], [221, 103, 0], [18, 138, 0], [81, 29, 0], [81, 87, 0], [19, 149, 0], [78, 115, 0], [51, 155, 0], [71, 189, 0], [138, 195, 0], [189, 187, 0], [192, 162, 0], [214, 149, 0], [185, 150, 0]], 
    #     "segments":[[0, 1], [4, 5], [11, 13]],
    #     "faces":[[0, 2, 3, 0], [4, 6, 7, 0], [9, 8, 10, 0], [11, 10, 12, 0], [13, 14, 1, 0], [14, 1, 15, 0], [1, 5, 15, 0], [5, 15, 16, 0], [5, 17, 16, 0], [5, 19, 17, 0], [19, 17, 18, 0]],
    #     "soluce" : [-80, 6, 0, -3, 0]
    # },

    "square": { 
        "points" :  [ 
            [  80, 60, 50], 
            [ 160, 60, 64], 
            [  80, 140, 80], 
            [ 160, 140, 72], 
        ], 
        "segments" : [ # 
            [0, 1], 
            [1, 3], 
            [3, 2],
            [2, 0]
        ], 
        "faces" : [ # faces
            [0, 1, 2, 2],
            [1, 2, 3, 1]
        ], 
        "soluce" : [-80, 6, 0, -3, 0] #initvectors=
    }
    ,"board": { 
        "points" :  [ 
            [  80, 60, 50], #0
            [ 120, 60, 64], #1
            [ 120,100, 64], #2
            [  80,100, 80], #3

            [ 120, 60, 72], #4
            [ 160, 60, 72], #5
            [ 160,100, 72], #6
            [ 120,100, 64], #7

            [ 120,100, 64], #8
            [ 160,100, 64], #9
            [ 160,140, 64], #10
            [ 120,140, 64], #11

            [  80,100, 64], #12
            [ 120,100, 64], #13
            [ 120,140, 64], #14
            [ 80,140, 64],  #15
        ], 
        "segments" : [ # 
            [0, 5], 
            [5,10], 
            [10,15],
            [15, 0]
        ], 
        "faces" : [ # faces
            [0, 1, 3, 0],
            [1, 3, 2, 0],

            [4, 5, 7, 1],
            [5, 7, 6, 1],

            [8, 9,11, 2],
            [9,11,10, 2],

            [12,13,15, 3],
            [13,15,14, 3],
        ], 
        "soluce" : [-80, 6, 0, -3, 0] #initvectors=
    }
}




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
            X = round(TRAJ_RADIUS * math.sin (inclination_radian) * math.cos (azimuth_radian))
            Y = round(TRAJ_RADIUS * math.sin (inclination_radian) * math.sin (azimuth_radian))
            Z = round(TRAJ_RADIUS * math.cos (inclination_radian))
            # Rotation in fixed point representation
            RotX = round((ii - 90)*128/180)
            RotZ = round((jj - 180)*128/180)
            # if (RotX == -128): RotX = 0
            # if (RotZ == -128): RotZ = 0
            vals = [X, Y, Z, RotZ, RotX]
            # vals = list([X, Y, Z])
            tab_pos["%d"%(ii)].append(vals)
    return tab_pos
    # print (tab_pos)

def genTrajectorySourceCode (tab_pos):
    pretext = f"#define NB_TRAJ_TABLE {len(tab_pos)}\n"
    pretext += f"#define FIRST_TRAJ_TABLE {round((len(tab_pos)-1)/2)}\n"
    pretext += f"#define NB_POINT_TRAJ {NB_STEP_AZIMTUH}\n"
    pretext += f"#define SIZE_POINT_TRAJ 5\n"
    # print (pretext)
    txt = ""
    for key, value in tab_pos.items():
        txt += table2text (key, value)
        # print (txt)
    txt2 = tableOfTable(tab_pos)
    # print (txt2)
    res = pretext + txt + txt2
    return res


CamPosX=-64
CamPosY=0
CamPosZ=0

CamRotZ=0
CamRotX=0

def unproject(x, y, distance):
    global CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX
    # print (CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX)
    dist = math.sqrt(CamPosX**2 + CamPosY**2)
    APH = (x-(SCREEN_WIDTH/2))/4
    APV = ((SCREEN_HEIGHT/2)-y)/4
    # print (APH, APV)
    AH = APH+CamRotZ
    AV = APV+CamRotX
    # print ("AH, AV : ", AH, AV, AV*180/128)
    DeltaZ = math.tan(AV*math.pi/128)*dist 
    Z = CamPosZ + DeltaZ
    # print ("DeltaZ, Z: ", DeltaZ, Z)

    sign_dx=-1
    sign_dy=-1
    deltaYOverDeltaX = math.tan(AH*math.pi/128)
    if (deltaYOverDeltaX > 0):
        if (AH < 0):
            pass
        else:
            sign_dx=1
            sign_dy=1
    else:
        if (AH > 0):
            sign_dy=1
        else:
            sign_dx=1

    # print ("deltaYOverDeltaX", deltaYOverDeltaX)
    DeltaX = math.copysign (math.sqrt((dist*dist) / (1 + deltaYOverDeltaX*deltaYOverDeltaX)), sign_dx)
    DeltaY = math.copysign (deltaYOverDeltaX * DeltaX, sign_dy)
    # print ("DeltaX, DeltaY: ", DeltaX, DeltaY)
    X = CamPosX + DeltaX
    Y = CamPosY + DeltaY
    effective_distance = math.sqrt(DeltaX**2 + DeltaY**2 + DeltaZ**2)
    ratio = distance/effective_distance
    # print (effective_distance, ratio)
    wantedDeltaX = DeltaX*ratio
    wantedDeltaY = DeltaY*ratio
    wantedDeltaZ = DeltaZ*ratio
    finalX = CamPosX + wantedDeltaX
    finalY = CamPosY + wantedDeltaY
    finalZ = CamPosZ + wantedDeltaZ
    # print (list(map(round, [X, Y, Z] )))
    return list(map(round, [finalX, finalY, finalZ] ))


def exportModel (name, points, segments, faces, initvectors):

    global CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX

    filename = f"model_{name}_c.c"

    if os.path.isfile(filename):
        return f'#include "{filename}"\n'

    str_init = f"signed char tab_init_{name}[] = {{ {initvectors[0]}, {initvectors[1]}, {initvectors[2]}, {initvectors[3]}, {initvectors[4]} }};\n";

    CamPosX=initvectors[0]
    CamPosY=initvectors[1]
    CamPosZ=initvectors[2]
    CamRotZ=initvectors[3]
    CamRotX=initvectors[4]

    str_points = f"char tab_point_{name}[] = {{\n"
    first = True
    index = 0

    for [c,l,dist] in points:
        nbattempt = 1
        dist = random.randint(MIN_DISTANCE, MAX_DISTANCE)
        # print (c, l, dist)
        while (nbattempt < 1000):
            [X, Y, Z] = unproject (c,l,dist)
            distance2center = math.sqrt(X**2+ Y**2+ Z**2)
            nbattempt += 1
            if (distance2center < SHAPE_RADIUS):
                break
        if (nbattempt < 1000):
            print ([X, Y, Z], distance2center)
        else:
            print (f"unable to find solution for point {c}, {l} of shape {name}")
            raise Exception(f"unable to find solution for point {c}, {l} of shape {name}", 'eggs')
        if first:
            h = ""
            first = False
        else:
            h = ","
        str_points += f"\t{h}{X},\t{Y},\t{Z},\t{index}\n"
        index += 1
    str_points += f"}};\n"

    str_segments = f"unsigned char tab_segment_{name}[] = {{\n"
    first = True
    for [idxP1, idxP2] in segments:
        if first:
            h = ""
            first = False
        else:
            h = ","
        str_segments += f"\t{h}{idxP1},\t{idxP2}\n"
    str_segments += f"}};\n"

    str_faces = f"unsigned char tab_face_{name}[] = {{\n"
    first = True
    for [idxP1, idxP2, idxP3, motif] in faces:
        if first:
            h = ""
            first = False
        else:
            h = ","
        str_faces += f"\t{h}{idxP1},\t{idxP2},\t{idxP3},\t{motif}\n"
    str_faces += f"}};\n"
    res = str_init  + str_points + str_segments + str_faces
    
    with open (filename,'w') as fic:
        fic.write(res)
    return '#include "{filename}"\n'


def genModelSourceCode(tab_pos, current_model):


    # Choose the position from which the model has to be seen
    # traj_number = random.randint(0,NB_STEP_INCLINATION-1)
    # step_number = random.randint(0,NB_STEP_AZIMTUH)
    # # print (tab_pos.keys())
    # soluce = tab_pos[list(tab_pos.keys())[traj_number]][step_number]

    # print (nb_traj)
    dict_models = spaceStruct(current_model)

    code_source = f"#define NB_MODELS {len(dict_models)}\n"
    code_source += f"#define NB_MAX_POINT {max([len(values['points']) for values in dict_models.values()])}\n"
    for key, values in dict_models.items ():
        traj_number = random.randint(0,NB_STEP_INCLINATION-1)
        step_number = random.randint(0,NB_STEP_AZIMTUH)
        # print (tab_pos.keys())
        soluce = tab_pos[list(tab_pos.keys())[traj_number]][step_number]
        print (soluce)
        # soluce = [-64,	4,	0,	-3,	0]
        code_source += exportModel (name = key, points = values["points"], segments = values ["segments"], faces = values["faces"], initvectors = soluce) #values["soluce"])

    code_source += f"char *ltab_points[]={{\n"
    first = True
    for name in dict_models:
        if first:
            h=''
            first = False
        else:
            h=','
        
        code_source += f"\t{h}tab_point_{name}\n"
    code_source += f"}};\n"

    code_source += f"unsigned char ltab_nbpoints[]={{\n"
    first = True
    for name, values in dict_models.items():
        if first:
            h=''
            first = False
        else:
            h=','
        code_source += f"\t{h}{len(values['points'])} // {name}\n"
    code_source += f"}};\n"

    code_source += f"unsigned char *ltab_segments[]={{\n"
    first = True
    for name in dict_models:
        if first:
            h=''
            first = False
        else:
            h=','
        
        code_source += f"\t{h}tab_segment_{name}\n"
    code_source += f"}};\n"

    code_source += f"unsigned char ltab_nbsegments[]={{\n"
    first = True
    for name, values in dict_models.items():
        if first:
            h=''
            first = False
        else:
            h=','
        code_source += f"\t{h}{len(values['segments'])} // {name}\n"
    code_source += f"}};\n"


    code_source += f"unsigned char *ltab_faces[]={{\n"
    first = True
    for name in dict_models:
        if first:
            h=''
            first = False
        else:
            h=','
        
        code_source += f"\t{h}tab_face_{name}\n"
    code_source += f"}};\n"

    code_source += f"unsigned char ltab_nbfaces[]={{\n"
    first = True
    for name, values in dict_models.items():
        if first:
            h=''
            first = False
        else:
            h=','
        code_source += f"\t{h}{len(values['faces'])} // {name}\n"
    code_source += f"}};\n"

    code_source += f"signed char *ltab_soluces[]={{\n"
    first = True
    for name in dict_models:
        if first:
            h=''
            first = False
        else:
            h=','
        
        code_source += f"\t{h}tab_init_{name}\n"
    code_source += f"}};\n"

    return code_source

def main ():

    tabPos = genTraj()
    source_code = genTrajectorySourceCode (tabPos)
    with open ("traj_c.c",'w') as fic:
        fic.write(source_code)
    
    with open("tabpoints.c", "w") as f:
        f.write(genModelSourceCode(tabPos, models))

def checkRotDis (CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX):
    distance2center = math.sqrt(CamPosX**2 + CamPosY**2 + CamPosZ**2)
    rotZ = math.degrees(math.atan2(-CamPosY, -CamPosX))*128/180
    rotX = math.degrees(math.atan2(-CamPosZ, math.sqrt(CamPosX**2 + CamPosY**2)))*128/180
    print (distance2center, rotZ, rotX)

if __name__ == '__main__':
    main()
    # CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX = 46, 44, 0, -97, 0 
    # print (unproject(120, 100, 64))
    # CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX = -26, -49, -32, 44, 21 
    # print (unproject(120, 100, 64))
    # CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX = 15, -53, -32, 75, 21 
    # print (unproject(120, 100, 64))
    # CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX = -30, -10, 55, 13, -43 
    # print (unproject(120, 100, 64))
    # CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX = 20, -25, -55, 91, 43
    # print (unproject(120, 100, 64)) 
    # CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX = -29,	14,	-55,	-18,	43 # 

    # # print (CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX)
    # # checkRotDis (CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX)

    # print (unproject(120, 100, 64))
    # # print (unproject(120, 60, 64)) 
    # # print (unproject(80, 140, 64)) 
    # # print (unproject(160, 140, 64)) 

