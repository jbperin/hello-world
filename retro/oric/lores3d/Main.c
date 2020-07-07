#include "lib.h"
#include "glOric.h"

/*
 * VISIBILITY LIMITS
 */
#define ANGLE_MAX 0xC0
#define ANGLE_VIEW 0xE0

// GEOMETRY BUFFERS

/*
extern char points3d[];
extern char points3d[];

extern signed char glVerticesX[];
extern signed char glVerticesY[];
extern signed char glVerticesZ[];

extern unsigned char glSegmentsPt1[];
extern unsigned char glSegmentsPt2[];
extern unsigned char glSegmentsChar[];

extern unsigned char faces[];
extern unsigned char glNbVertices;
extern unsigned char glNbFaces;
extern unsigned char glNbSegments;
extern unsigned char glNbParticles;
*/

char status_string[50];

#define abs(x)                 (((x)<0)?-(x):(x))

signed char geomHouse []= {        //              /  \          
                                   //             /    \    
/* Nb Coords = */ 10,              //            /      \   
/* Nb Faces = */ 11,               //           /        \   
/* Nb Segments = */ 14,            //          5         4  
/* Nb Particles = */ 0,           //         /.        /|  
                                   //        8 .       / |  
// Coord List : X, Y, Z, unused    //       / \.      /  |  
 1, 1, 0, 0,                       //      /   \     /   |                            
-1, 1, 0, 1,                       //     /    1\.. /. . 0                           
-1,-1, 0, 2,                       //    /     / \ /    /                            
 1,-1, 0, 3,                       //   6     /   7    /                             
 1, 1, 2, 4,                       //   |    /    |   /                               
-1, 1, 2, 5,                       //   |   /     |  /                               
-1,-1, 2, 6,                       //   |  /      | /                                
 1,-1, 2, 7,                       //   | /       |/                                 
 1, 0, 3, 8,                       //   |/________|                                  
-1, 0, 3, 9,                       //   2         3
// Face List : idxPoint1, idxPoint2, idxPoint3, character 
 0, 1, 5, 'r',      // side
 0, 4, 5, 'r',
 3, 2, 6, 'r',
 6, 3, 7, 'r',
 1, 2, 6, 'm', // back
 1, 6, 5, 'm',
 5, 6, 9, 'm',
 4, 5, 9, 'y',  // roof
 4, 9, 8, 'y',
 7, 6, 9, 'y',
 7, 9, 8, 'y',
// Segment List : idxPoint1, idxPoint2, character , unused
0, 1, '-', 0,
1, 2, '-', 0,
2, 3, '-', 0,
4, 5, '-', 0,
6, 7, '-', 0,
0, 4, '|', 0,
1, 5, '|', 0,
2, 6, '|', 0,
3, 7, '|', 0,
4, 8, '/', 0,
7, 8, '/', 0,
5, 9, '/', 0,
6, 9, '/', 0,
9, 8, '-', 0,
}; 


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

void testProjection() {

    int ii, jj;
    signed char aH, aV;
    signed char aH1, aV1, aH2, aV2;
    unsigned char idxPt1, idxPt2;
    signed char   tmpH, tmpV;
    unsigned char m1, m2;
    unsigned char v1, v2;
    unsigned char isSegment2BeDrawn;


    cls();

    // Change DOLLAR ($) sign into BACKSLASH (\) to draw oblic lines 
    change_char(36, 0x80, 0x40, 020, 0x10, 0x08, 0x04, 0x02, 0x01);

    glNbVertices        =0;
    glNbFaces           =0;
    glNbSegments        =0;
    glNbParticles       =0;

    addGeom(0, 0, 0, 12, 8, 4, 0, geomHouse);

    glCamPosX = 24;
    glCamPosY = 0;
    glCamPosZ = 6;

    // Camera Orientation
    glCamRotZ = 128;  // -128 -> 127 unit : 2PI/(2^8 - 1)
    glCamRotX = 0;

    glProjectArrays();
    glInitScreenBuffers();

    glDrawFaces();
    glDrawSegments();
    glDrawParticles();

    glBuffer2Screen();

    printf ("coucou\n");

    get();
}

void main()
{

    lores0 ();
    testProjection ();

}

