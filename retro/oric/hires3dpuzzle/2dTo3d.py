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
    [ 120, 60, 64], 
    [  80, 140, 64], 
    [ 160, 140, 64], 
]

def main ():
    strcoords = """
#define CAM_POS_INIT_X %d
#define CAM_POS_INIT_Y %d
#define CAM_POS_INIT_Z %d

#define CAM_ROT_INIT_Z %d
#define CAM_ROT_INIT_X %d

char tabPoints3D []= {
"""%(CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX)
    first = True
    index = 0
    for [c,l,dist] in lparticule:
        #dist = random.randint(40, 120)
        [X, Y, Z] = unproject (c,l,dist)
        
        if first:
            strcoords += "\t %d,\t%d,\t%d,\t0\n"%(X, Y, Z)
            first = False
        else:
            strcoords += "\t,%d,\t%d,\t%d,\t0\n"%(X, Y, Z)
        index += 1

    res = strcoords + '};\n'
    print (res)
    with open("tabpoints.c", "w") as f:
        f.write(res)

if __name__ == "__main__":
	main()
