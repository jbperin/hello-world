import math
import random


SCREEN_WIDTH = 240
SCREEN_HEIGHT= 200

CamPosX=-64
CamPosY=0
CamPosZ=0

CamRotZ=0
CamRotX=0

def unproject(x, y, distance):
    APH = (x-(SCREEN_WIDTH/2))/4
    APV = ((SCREEN_HEIGHT/2)-y)/4

    AH = APH+CamRotZ
    AV = APV+CamRotX

    deltaZ = math.tan(AV*math.pi/128)*distance
    Z = CamPosZ + deltaZ

    deltaYOverDeltaX = math.tan(AH*math.pi/128)
    DeltaX = math.sqrt((distance*distance) / (1 + deltaYOverDeltaX*deltaYOverDeltaX))
    DeltaY = deltaYOverDeltaX * DeltaX

    X = CamPosX + DeltaX
    Y = CamPosY + DeltaY
    return map(round, [X, Y, Z] )


lparticule = [
    [ 120, 60, 64], 
    [  80, 140, 64], 
    [ 160, 140, 64], 
]

def exportModel (name, points, segments, faces, initvectors):

    global CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX

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
        #dist = random.randint(40, 120)
        [X, Y, Z] = unproject (c,l,dist)
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
    return res


dict_models = {
    "triangle": { 
        "points" :  [ 
            [ 120, 60, 64], 
            [  80, 140, 64], 
            [ 160, 140, 64], 
        ], 
        "segments" : [ # 
            [0, 1], 
            [1, 2], 
            [2, 0]
        ], 
        "faces" : [ # faces
            [0, 1, 2, 2]
        ], 
        "soluce" : [-80, 0, 0, 0, 0] #initvectors=
        
    }
    ,"square": { 
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

}

def main ():
    code_source = f"#define NB_MODELS {len(dict_models)}\n"
    code_source += f"#define NB_MAX_POINT {max([len(values['points']) for values in dict_models.values()])}\n"
    for key, values in dict_models.items ():
        code_source += exportModel (name = key, points = values["points"], segments = values ["segments"], faces = values["faces"], initvectors = values["soluce"])

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

    with open("tabpoints.c", "w") as f:
        f.write(code_source)
   

if __name__ == "__main__":
	main()
