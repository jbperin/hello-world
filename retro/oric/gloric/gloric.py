
import math

# parametres configuration
LE = 40   # largeur ecran
HE = 26   # hauteur ecran
EAH = 60  # demi-excursion angulaire Horizontale en degre
EAV = 40  # demi-excursion angulaire Verticale en degre

# donnees entree
nbfaces = 2
nbpoints = 4
faces = [[0, 1, 2, 0], [2, 3, 0, 0]]
points = [[1, 1, 0], [1, 1, 1], [2, 1, 1], [2, 1, 0]]
campos=[0, 0, 1]
camori=[0, 0] # rotation Z puis X en degre

#system
screen = [[' ' for i in range(LE+1)] for j in range(HE+1)]

#Variables intermédiaires
points2 = []

# from https://en.wikipedia.org/wiki/Bresenham's_line_algorithm#All_cases
def drawLine( x0,  y0,  x1,  y1):
    points2d = []

    dx =  abs(x1-x0);
    #sx = x0<x1 ? 1 : -1;
    if (x0<x1):
        sx = 1
    else:
        sx = -1

    dy = -abs(y1-y0);
    #sy = y0<y1 ? 1 : -1;
    if (y0<y1):
        sy = 1
    else:
        sy = -1

    err = dx+dy;  # error value e_xy */
    while (True):   # loop */
        points2d.append([x0 , y0])
        if ((x0==x1) and (y0==y1)): break
        e2 = 2*err;
        if (e2 >= dy):
            err += dy; # e_xy+e_x > 0 */
            x0 += sx;
        if (e2 <= dx): # e_xy+e_y < 0 */
            err += dx;
            y0 += sy;

    for [ptx, pty] in points2d:
        if ((pty >= 0) and (pty <= HE) and (ptx >= 0) and (ptx <= LE)): screen [pty][ptx] = '*'


def drawFace( xA,  yA,  xB,  yB, xC, yC):

    drawLine( xA,  yA,  xB,  yB)
    drawLine( xB,  yB,  xC,  yC)
    drawLine( xC,  yC,  xA,  yA)



def project ():
    global points2
    LV = LE / 2
    HV = HE / 2

    points2 = []
    for p in points:
        ang1 = math.atan2((p[1]-campos[1]),(p[0]-campos[0])) - math.radians(camori[0])
        dist = math.sqrt ((p[1]-campos[1])**2+(p[0]-campos[0])**2)
        ang2 = math.atan2((p[2]-campos[2]),dist) - math.radians(camori[1])

        X = ((ang1 * LV) / math.radians(EAH)) + LV
        Y = ((-ang2 * HV) / math.radians(EAV)) + HV
        p2d = [int(round(X)), int(round(Y))]
        print (str (p), str(p2d), ang1, dist, ang2)
        points2.append (p2d)

def initScreen (): screen = [[' ' for i in range(LE)] for j in range(HE)]

def printScreen ():
    st = ""
    for li in screen:
        st += '|' + ''.join(li) + '|\n'
    print (st)

def main():

    initScreen ()
    project ()

    for [pA, pB, pC, fst] in faces:
        print ("face",pA, pB, pC, points2[pA], points2[pB], points2[pC])
        drawFace( points2[pA][0],  points2[pA][1],  points2[pB][0],  points2[pB][1],  points2[pC][0],  points2[pC][1])
    printScreen ()

if __name__ == '__main__':
    main()
