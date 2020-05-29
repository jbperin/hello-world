
#include <cc65.h>
#include <conio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>


/*
 *  SCREEN MEMORY //BB80
 */
#define ADR_BASE_LORES_SCREEN 48040  
#define SCREEN_WIDTH 40 
#define SCREEN_HEIGHT 26
#define DOLLAR 36

extern void glProject (char *tabpoint2D, char *tabpoint3D, unsigned char nbPoints, unsigned char opts);
extern void AdvancedPrint(unsigned char Xpos,unsigned char Ypos, char *message);
extern void project ();

extern int CamPosX, CamPosY, CamPosZ;
extern signed char CamRotZ, CamRotX;

//  __                            
// / _\     ___   ___  _ __    ___
// \ \     / __| / _ \| '_ \  / _ \
// _\ \   | (__ |  __/| | | ||  __/
// \__/    \___| \___||_| |_| \___|

extern unsigned char nbSegments;
extern unsigned char nbFaces;
extern unsigned char nbParticules;

extern unsigned char segmentsPt1[];
extern unsigned char segmentsPt2[];
extern unsigned char segmentsChar[];

extern unsigned char particulesPt[];
extern unsigned char particulesChar[];

extern unsigned char facesPt1[];
extern unsigned char facesPt2[];
extern unsigned char facesPt3[];
extern unsigned char facesChar[];


//    ___                 _              _    _               
//   / _ \ _ __   ___    (_)  ___   ___ | |_ (_)  ___   _ __  
//  / /_)/| '__| / _ \   | | / _ \ / __|| __|| | / _ \ | '_ \ 
// / ___/ | |   | (_) |  | ||  __/| (__ | |_ | || (_) || | | |
// \/     |_|    \___/  _/ | \___| \___| \__||_| \___/ |_| |_|
//                     |__/                                   

extern unsigned char projOptions;
extern unsigned char nbPoints;

extern unsigned char points3dX[];
extern unsigned char points3dY[];
extern unsigned char points3dZ[];

extern unsigned char points2aH[];
extern unsigned char points2aV[];
extern unsigned char points2dH[];
extern unsigned char points2dL[];



extern unsigned char zbuffer[];  // z-depth buffer SCREEN_WIDTH * SCREEN_HEIGHT
extern char          fbuffer[];  // frame buffer SCREEN_WIDTH * SCREEN_HEIGHT

#define TEXTURE_1 ','
#define TEXTURE_2 '.'
#define TEXTURE_3 'u'
#define TEXTURE_4 '*'
#define TEXTURE_5 'o'
#define TEXTURE_6 '+'
#define TEXTURE_7 'x'

signed char geomHouse []= {
/* Nb Coords = */ 10,
/* Nb Faces = */ 11,
/* Nb Segments = */ 14,
/* Nb Particules = */ 0,
// Coord List : X, Y, Z, unused
 1, 1, 0, 0, 
-1, 1, 0, 0,
-1,-1, 0, 0,
 1,-1, 0, 0,
 1, 1, 2, 0, 
-1, 1, 2, 0,
-1,-1, 2, 0,
 1,-1, 2, 0,
 1, 0, 3, 0,
-1, 0, 3, 0,
// Face List : idxPoint1, idxPoint2, idxPoint3, character 
 0, 1, 5, TEXTURE_6,
 0, 4, 5, TEXTURE_6,
 3, 2, 6, TEXTURE_6,
 6, 3, 7, TEXTURE_6,
 1, 2, 6, TEXTURE_5,
 1, 6, 5, TEXTURE_5,
 5, 6, 9, TEXTURE_5,
 4, 5, 9, TEXTURE_3,
 4, 9, 8, TEXTURE_3,
 7, 6, 9, TEXTURE_3,
 7, 9, 8, TEXTURE_3,
// Segment List : idxPoint1, idxPoint2, character , unused
0, 1, '-', 0,
1, 2, '-', 0,
2, 3, '-', 0,
4, 5, '-', 0,
6, 7, '-', 0,
0, 4,'|', 0,
1, 5,'|', 0,
2, 6,'|', 0,
3, 7,'|', 0,
4, 8,'/', 0,
7, 8,'/', 0,
5, 9,'/', 0,
6, 9,'/', 0,
9, 8,'-', 0,

// Particule List : idxPoint1, character 
};

#define NB_POINTS_TRAJ 64
#define SIZE_POINTS_TRAJ 3

char traj[] = {
    24, 0, 128,
    24, 2, -125,
    24, 5, -120,
    23, 7, -116,
    22, 9, -112,
    21, 11, -108,
    20, 13, -105,
    19, 15, -101,
    17, 17, -96,
    15, 19, -91,
    13, 20, -87,
    11, 21, -84,
    9, 22, -80,
    7, 23, -76,
    5, 24, -72,
    2, 24, -67,
    0, 24, -64,
    -2, 24, -61,
    -5, 24, -56,
    -7, 23, -52,
    -9, 22, -48,
    -11, 21, -44,
    -13, 20, -41,
    -15, 19, -37,
    -17, 17, -32,
    -19, 15, -27,
    -20, 13, -23,
    -21, 11, -20,
    -22, 9, -16,
    -23, 7, -12,
    -24, 5, -8,
    -24, 2, -3,
    -24, 0, 0,
    -24, -2, 3,
    -24, -5, 8,
    -23, -7, 12,
    -22, -9, 16,
    -21, -11, 20,
    -20, -13, 23,
    -19, -15, 27,
    -17, -17, 32,
    -15, -19, 37,
    -13, -20, 41,
    -11, -21, 44,
    -9, -22, 48,
    -7, -23, 52,
    -5, -24, 56,
    -2, -24, 61,
    0, -24, 64,
    2, -24, 67,
    5, -24, 72,
    7, -23, 76,
    9, -22, 80,
    11, -21, 84,
    13, -20, 87,
    15, -19, 91,
    17, -17, 96,
    19, -15, 101,
    20, -13, 105,
    21, -11, 108,
    22, -9, 112,
    23, -7, 116,
    24, -5, 120,
    24, -2, 125};

extern int PointX, PointY, PointZ;
extern signed char ResX, ResY;

char tampon[256];

void change_char(char c, unsigned char patt01, unsigned char patt02, unsigned char patt03, unsigned char patt04, unsigned char patt05, unsigned char patt06, unsigned char patt07, unsigned char patt08) {
    unsigned char* adr;
    adr      = (unsigned char*)(0xB400 + c * 8);
    *(adr++) = patt01;
    *(adr++) = patt02;
    *(adr++) = patt03;
    *(adr++) = patt04;
    *(adr++) = patt05;
    *(adr++) = patt06;
    *(adr++) = patt07;
    *(adr++) = patt08;
}

void addGeom2(
    signed char   X,
    signed char   Y,
    signed char   Z,
    unsigned char sizeX,
    unsigned char sizeY,
    unsigned char sizeZ,
    unsigned char orientation,
    signed char          geom[]) {

    int kk=0;
    int ii;
    int npt,nfa, nseg, npart;
    npt = geom[kk++];
    nfa = geom[kk++];
    nseg = geom[kk++];
    npart = geom[kk++];
    for (ii = 0; ii < npt; ii++){
        if (orientation == 0) {
            points3dX[nbPoints] = X + sizeX * geom[kk++];
            points3dY[nbPoints] = Y + sizeY * geom[kk++];
        } else {
            points3dY[nbPoints] = X + sizeY * geom[kk++];
            points3dX[nbPoints] = Y + sizeX * geom[kk++];
        }
        points3dZ[nbPoints] = Z + sizeZ * geom[kk++];
        nbPoints ++;
        kk++; // skip unused byte
    }
    for (ii = 0; ii < nfa; ii++){
        facesPt1[nbFaces] = nbPoints - (npt-geom[kk++]);  // Index Point 1
        facesPt2[nbFaces] = nbPoints - (npt-geom[kk++]);  // Index Point 2
        facesPt3[nbFaces] = nbPoints - (npt-geom[kk++]);  // Index Point 3
        facesChar[nbFaces] = geom[kk++];  // Character
        nbFaces++;
    }
    for (ii = 0; ii < nseg; ii++){
        segmentsPt1[nbSegments] = nbPoints - (npt-geom[kk++]);  // Index Point 1
        segmentsPt2[nbSegments] = nbPoints - (npt-geom[kk++]);  // Index Point 2
        segmentsChar[nbSegments] = geom[kk++]; // Character
        nbSegments++;
        kk++; // skip unused byte
    }
    for (ii = 0; ii < npart; ii++){
        particulesPt[nbParticules] = nbPoints - (npt-geom[kk++]);  // Index Point
        particulesChar[nbParticules] = geom[kk++]; // Character
        nbParticules++;        
    }
}    



void init (){
 
    // printf ("coucou \n");

    
    nbPoints     = 0;
    nbSegments   = 0;
    nbFaces      = 0;
    nbParticules = 0;

    change_char(36, 0x80, 0x40, 020, 0x10, 0x08, 0x04, 0x02, 0x01);
    addGeom2(0, 0, 0, 12, 8, 4, 0, geomHouse);

}

void test () {
    PointX = 4;
    PointY = 4;
    PointZ = 2;

    project();

    snprintf(tampon, 256, "Pos = [%d, %d, %d], Rot = [%d, %d]"
            , CamPosX, CamPosY, CamPosZ
            , CamRotZ, CamRotX);
    AdvancedPrint(  0,0,tampon);

    snprintf(tampon, 256, "Point = [%d, %d, %d], Res = [%d, %d]"
            , PointX, PointY, PointZ
            , ResX, ResY);
    AdvancedPrint( 10, 10,tampon);


}


extern void glProjectArrays();

// void initScreenBuffers(){}
void initScreenBuffers() {

    memset(zbuffer, 0xFF, SCREEN_WIDTH * SCREEN_HEIGHT);
    
    memset(fbuffer, 0x20, SCREEN_WIDTH * SCREEN_HEIGHT);  // Space

}

void glDrawFaces(){}

extern unsigned char idxPt1, idxPt2, idxPt3;
extern signed char P1AH, P1AV, P2AH, P2AV, P3AH, P3AV;
extern signed char P1X, P1Y, P2X, P2Y, P3X, P3Y;
extern char        ch2disp;
extern int           dmoy; 
extern unsigned char distseg;


extern signed char A1X;
extern signed char A1Y;
extern signed char A1destX;
extern signed char A1destY;
extern signed char A1dX;
extern signed char A1dY;
extern signed char A1err;
extern signed char A1sX;
extern signed char A1sY;
extern char        A1arrived;

extern signed char A2X;
extern signed char A2Y;
extern signed char A2destX;
extern signed char A2destY;
extern signed char A2dX;
extern signed char A2dY;
extern signed char A2err;
extern signed char A2sX;
extern signed char A2sY;
extern char        A2arrived;
extern unsigned char A1Right;


void zplot(signed char X,
           signed char Y,
           unsigned char dist,
           char          char2disp) {
    int            offset;
    char*          ptrFbuf;
    unsigned char* ptrZbuf;

    if ((Y <= 0) || (Y >= SCREEN_HEIGHT) || (X <= 0) || (X >= SCREEN_WIDTH))
        return;

#ifdef USE_MULTI40
    offset = multi40[Y] + X;  // 
#else
    offset = Y*SCREEN_WIDTH+X; 
#endif

    ptrZbuf = zbuffer + offset;
    ptrFbuf = fbuffer + offset;

    // printf ("pl [%d %d] zbuff = %d , pointDist = %d\n", X, Y, *ptrZbuf, dist);
    if (dist < *ptrZbuf) {
        *ptrFbuf = char2disp;
        *ptrZbuf = dist;
    }
}


void lrDrawLine() {

    signed char e2;
    char        ch2dsp;

    A1X     = P1X;
    A1Y     = P1Y;
    A1destX = P2X;
    A1destY = P2Y;
    A1dX    = abs(P2X - P1X);
    A1dY    = -abs(P2Y - P1Y);
    A1sX    = P1X < P2X ? 1 : -1;
    A1sY    = P1Y < P2Y ? 1 : -1;
    A1err   = A1dX + A1dY;

    if ((A1err > 64) || (A1err < -63))
        return;

    if ((ch2disp == '/') && (A1sX == -1)) {
        ch2dsp = DOLLAR;
    } else {
        ch2dsp = ch2disp;
    }

    while (1) {  // loop
        // printf ("plot [%d, %d] %d %d\n", A1X, A1Y, distseg, ch2disp);waitkey ();          
        zplot(A1X, A1Y, distseg, ch2dsp);
        if ((A1X == A1destX) && (A1Y == A1destY))
            break;
        //e2 = 2*err;
        e2 = (A1err < 0) ? (
                ((A1err & 0x40) == 0) ? (
                                                0x80)
                                        : (
                                            A1err << 1))
            : (
                ((A1err & 0x40) != 0) ? (
                                                0x7F)
                                        : (
                                                A1err << 1));
        if (e2 >= A1dY) {
            A1err += A1dY;  // e_xy+e_x > 0
            A1X += A1sX;
        }
        if (e2 <= A1dX) {  // e_xy+e_y < 0
            A1err += A1dX;
            A1Y += A1sY;
        }
    }
}

void glDrawSegments(){
    unsigned char ii = 0;
 
    for (ii = 0; ii < nbSegments; ii++) {

        idxPt1    = segmentsPt1[ii];
        idxPt2    = segmentsPt2[ii];
        ch2disp = segmentsChar[ii];

        // dmoy = (d1+d2)/2;

        P1AH = points2aH[idxPt1];
        P1AV = points2aV[idxPt1];

        dmoy = points2dL[idxPt1];


        P2AH = points2aH[idxPt2];
        P2AV = points2aV[idxPt2];

        dmoy += points2dL[idxPt2];

        dmoy = dmoy >> 1;
        

        if ((dmoy & 0xFF00) != 0)
            continue;
        distseg = (unsigned char)((dmoy)&0x00FF);
        distseg--;  // FIXME

        P1X = (SCREEN_WIDTH - P1AH) >> 1;
        P1Y = (SCREEN_HEIGHT - P1AV) >> 1;
        P2X = (SCREEN_WIDTH - P2AH) >> 1;
        P2Y = (SCREEN_HEIGHT - P2AV) >> 1;

        // printf ("dl ([%d, %d] , [%d, %d] => %d c=%d\n", P1X, P1Y, P2X, P2Y, distseg, ch2disp); waitkey();
        lrDrawLine();
    }

}

void glDrawParticules(){};

// void buffer2screen(char * adr_screen){}

void buffer2screen(char destAdr[]) {
    memcpy(destAdr, fbuffer, SCREEN_HEIGHT* SCREEN_WIDTH);
}

void main (){

    int i, j;
    CamPosX = -20;
    CamPosY = 16;
    CamPosZ = 6;

    CamRotZ = -23;
    CamRotX = 0;

    init ();

    i = 0;
    for (j = 0; j < 64; j++) {
        CamPosX = traj[i++];
        CamPosY = traj[i++];
        CamRotZ = traj[i++];
        i       = i % (NB_POINTS_TRAJ * SIZE_POINTS_TRAJ);

//     snprintf(tampon, 256, "j = %d coord = [%d, %d, %d]"
//             , j, CamPosX, CamPosY, CamRotZ );

//     AdvancedPrint(j%26, 0 ,tampon);

        glProjectArrays();
        // // listPoints2D();

        initScreenBuffers();

        glDrawFaces();

        glDrawSegments();

        glDrawParticules();

        buffer2screen((char *)ADR_BASE_LORES_SCREEN);
    }
    printf ("Fin\n");


}