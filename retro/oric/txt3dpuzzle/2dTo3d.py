import math
import random
SCREEN_WIDTH = 40
SCREEN_HEIGHT= 26

CamPosX=-80
CamPosY=0
CamPosZ=0

CamRotZ=0
CamRotX=0

def unproject(x, y, distance):
    APH = SCREEN_WIDTH - x*2
    APV = SCREEN_HEIGHT -y*2
    print (APV, APH)
    AH = APH+CamRotZ
    AV = APV+CamRotX
    print (AH, AV)
    deltaZ = math.tan(AV*math.pi/128)*distance
    Z = CamPosZ + deltaZ
    print (deltaZ, Z)
    deltaYOverDeltaX = math.tan(AH*math.pi/128)
    DeltaX = math.sqrt((distance*distance) / (1 + deltaYOverDeltaX*deltaYOverDeltaX))
    DeltaY = deltaYOverDeltaX * DeltaX
    print (deltaZ, Z)
    X = CamPosX + DeltaX
    Y = CamPosY + DeltaY
    return map(round, [X, Y, Z] )


lparticule = [
    [ 2, 1, 'O', 60], 
    [ 3, 1, 'R', 40], 
    [ 4, 1, 'I', 75], 
    [ 5, 1, 'C', 90], 
    [ 7, 1, 'E', 30], 
    [ 8, 1, 'X', 40], 
    [ 9, 1, 'T', 20], 
    [10, 1, 'E', 10], 
    [11, 1, 'N', 60], 
    [12, 1, 'D', 40], 
    [13, 1, 'E', 70], 
    [14, 1, 'D', 50], 
    [16, 1, 'B', 30], 
    [17, 1, 'A', 90], 
    [18, 1, 'S', 90], 
    [19, 1, 'I', 90], 
    [20, 1, 'C', 90], 
    [22, 1, 'V', 90], 
    [23, 1, '1', 90], 
    [24, 1, '.', 90], 
    [25, 1, '1', 90], 

    [ 2, 2, 96 , 90], 

    [ 4, 2, '1', 90], 
    [ 5, 2, '9', 90], 
    [ 6, 2, '8', 90], 
    [ 7, 2, '3', 90], 

    [ 9, 2, 'T', 90], 
    [10, 2, 'A', 90], 
    [11, 2, 'N', 90], 
    [12, 2, 'G', 90], 
    [13, 2, 'E', 90], 
    [14, 2, 'R', 90], 
    [15, 2, 'I', 90], 
    [16, 2, 'N', 90], 
    [17, 2, 'E', 90], 


    [ 3, 5, '3', 90],
	[ 4, 5, '7', 90],
	[ 5, 5, '6', 90],
	[ 6, 5, '3', 90],
	[ 7, 5, '1', 90],

	[ 9, 5, 'B', 90],
	[10, 5, 'Y', 90],
	[11, 5, 'T', 90],
	[12, 5, 'E', 90],
	[13, 5, 'S', 90],

	[15, 5, 'F', 90],
	[16, 5, 'R', 90],
	[17, 5, 'E', 90],
	[18, 5, 'E', 90],

	[ 2, 7, 'R', 90],
	[ 3, 7, 'e', 90],
	[ 4, 7, 'a', 90],
	[ 5, 7, 'd', 90],
	[ 6, 7, 'y', 90],

	[ 2, 8, 'C', 90],
	[ 3, 8, 'L', 90],
	[ 4, 8, 'O', 90],
	[ 5, 8, 'A', 90],
	[ 6, 8, 'D', 90],
	[ 7, 8, '"', 90],
	[ 8, 8, '"', 90],


]

def encode (character):
    if isinstance(character, str) :
        return "'%s'"%character
    else:
        return character

def main ():
    strcoords = """
#define CAM_POS_INIT_X %d
#define CAM_POS_INIT_Y %d
#define CAM_POS_INIT_Z %d
#define CAM_ROT_INIT_Z %d
#define CAM_ROT_INIT_X %d

signed char geomParticules []= {
            
/* Nb Coords = */ %d,       
/* Nb Faces = */ 0,        
/* Nb Segments = */ 0,     
/* Nb Particles = */ %d,  

// Coord List : X, Y, Z, unused      
"""%(CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX, len(lparticule), len(lparticule))
    strparticules = """
// Face List : idxPoint1, idxPoint2, idxPoint3, character 
// Segment List : idxPoint1, idxPoint2, character , unused
// Particle List : idxPoint1, character 
"""    
    first = True
    index = 0
    for [c,l,character,dist] in lparticule:
        dist = random.randint(40, 120)
        [X, Y, Z] = unproject (c,l,dist)
        strparticules += "\t,%d,\t %s\n"%(index, encode(character))
        if first:
            strcoords += "\t %d,\t%d,\t%d,\t0\n"%(X, Y, Z)
            first = False
        else:
            strcoords += "\t,%d,\t%d,\t%d,\t0\n"%(X, Y, Z)
        index += 1

    res = strcoords + strparticules + '};\n'
    print (res)
    with open("tabpart.c", "w") as f:
        f.write(res)

if __name__ == "__main__":
	main()
