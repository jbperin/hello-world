#include "lib.h"
#include "glOric.h"

/*
 * VISIBILITY LIMITS
 */
#define ANGLE_MAX 0xC0
#define ANGLE_VIEW 0xE0

// GEOMETRY BUFFERS

char status_string[50];

#define abs(x)                 (((x)<0)?-(x):(x))

#include "tabpart.c"
#include "traj_c.c"

void addGeom(
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
            glVerticesX[glNbVertices] = X + sizeX * geom[kk++];
            glVerticesY[glNbVertices] = Y + sizeY * geom[kk++];
        } else {
            glVerticesY[glNbVertices] = X + sizeY * geom[kk++];
            glVerticesX[glNbVertices] = Y + sizeX * geom[kk++];
        }
        glVerticesZ[glNbVertices] = Z + sizeZ * geom[kk++];
        glNbVertices ++;
        kk++; // skip unused byte
    }
    for (ii = 0; ii < nfa; ii++){
        glFacesPt1[glNbFaces] = glNbVertices - (npt-geom[kk++]);  // Index Point 1
        glFacesPt2[glNbFaces] = glNbVertices - (npt-geom[kk++]);  // Index Point 2
        glFacesPt3[glNbFaces] = glNbVertices - (npt-geom[kk++]);  // Index Point 3
        glFacesChar[glNbFaces] = geom[kk++];  // Character
        glNbFaces++;
    }
    for (ii = 0; ii < nseg; ii++){
        glSegmentsPt1[glNbSegments] = glNbVertices - (npt-geom[kk++]);  // Index Point 1
        glSegmentsPt2[glNbSegments] = glNbVertices - (npt-geom[kk++]);  // Index Point 2
        glSegmentsChar[glNbSegments] = geom[kk++]; // Character
        glNbSegments++;
        kk++; // skip unused byte
    }
    for (ii = 0; ii < npart; ii++){
        glParticlesPt[glNbParticles] = glNbVertices - (npt-geom[kk++]);  // Index Point
        glParticlesChar[glNbParticles] = geom[kk++]; // Character
        glNbParticles++;        
    }
}     

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
extern void glLores();
void testProjection() {

    int ii, jj;
    signed char aH, aV;
    signed char aH1, aV1, aH2, aV2;
    unsigned char idxPt1, idxPt2;
    signed char   tmpH, tmpV;
    unsigned char m1, m2;
    unsigned char v1, v2;
    unsigned char isSegment2BeDrawn;


    // cls();

    // Change DOLLAR ($) sign into BACKSLASH (\) to draw oblic lines 
    change_char(36, 0x80, 0x40, 020, 0x10, 0x08, 0x04, 0x02, 0x01);

    glNbVertices        =0;
    glNbFaces           =0;
    glNbSegments        =0;
    glNbParticles       =0;

    // addGeom(0, 0, 0, 12, 8, 4, 0, geomHouse);
    addGeom(0, 0, 0, 1, 1, 1, 0, geomParticules);

    glCamPosX = CAM_POS_INIT_X;
    glCamPosY = CAM_POS_INIT_Y;
    glCamPosZ = CAM_POS_INIT_Z;

    // Camera Orientation
    glCamRotZ = CAM_ROT_INIT_Z;  // -128 -> 127 unit : 2PI/(2^8 - 1)
    glCamRotX = CAM_ROT_INIT_X;

    glProjectArrays();
    glInitScreenBuffers();

    glDrawFaces();
    glDrawSegments();
    glDrawParticles();

    glBuffer2Screen();
    glLores();

    printf ("coucou\n");

    get();
}

void main()
{
    unsigned char inGame = 1;
    unsigned char indexInTraj = 32*3;
    int kk=0;                     // keyboard entry

    // lores0 ();
    get();
    testProjection ();
    while (inGame) {

        kk = get();
        if (kk != 0) {
            switch (kk) {
                case 8:  // gauche => tourne gauche
                    indexInTraj = (indexInTraj + 3) % (NB_POINTS_TRAJ*SIZE_POINTS_TRAJ);
                    glCamPosX = traj[indexInTraj + 0];
                    glCamPosY = traj[indexInTraj + 1];
                    glCamRotZ = traj[indexInTraj + 2];
                    // printf("idx = %d, pX=%d pY=%d rZ=%d\n", indexInTraj, glCamPosX, glCamPosY, glCamRotZ);
                    break;
                case 9:  // droite => tourne droite
                    if (indexInTraj == 0)
                        indexInTraj = NB_POINTS_TRAJ*SIZE_POINTS_TRAJ - SIZE_POINTS_TRAJ;
                    indexInTraj = (indexInTraj - SIZE_POINTS_TRAJ);
                    glCamPosX = traj[indexInTraj + 0];
                    glCamPosY = traj[indexInTraj + 1];
                    glCamRotZ = traj[indexInTraj + 2];
                    // printf("idx = %d, pX=%d pY=%d rZ=%d\n", indexInTraj, glCamPosX, glCamPosY, glCamRotZ);
                    break;
                case 68: // 'D'
                    break;
                case 72: // 'H'
                    break;
                case 73: // 'I'
                    break;
                case 74: // 'J'
                    break;
                case 75: // 'K'
                    break;
                case 65: // 'A'
                case 81: // 'Q'
                    inGame = 0;
                    break;
                case 82: // 'R'
                    break;
                case 90: // 'W'
                    break;
                default:
                    printf ("you pressed %d\n", kk);
            }
        }

        glProjectArrays();
        glInitScreenBuffers();

        glDrawFaces();
        glDrawSegments();
        glDrawParticles();

        glBuffer2Screen();
        glLores();


    }
}

