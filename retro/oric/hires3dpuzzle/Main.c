
#include "glOric.h"
#include "params.h"
/*
 * VISIBILITY LIMITS
 */
#define ANGLE_MAX 0xC0
#define ANGLE_VIEW 0xE0

extern char                 points3d[]; // NB_MAX_VERTICES * SIZEOF_3DPOINT
unsigned char        nbPts = 0;
extern char                 points2d[]; // NB_MAX_VERTICES * SIZEOF_2DPOINT
extern char          faces[];
extern unsigned char glNbFaces;
extern unsigned char segments[];
extern unsigned char glNbSegments;
extern unsigned char particles[];
extern unsigned char glNbParticles;

//
// ====== Filler.s ==========

extern unsigned char X0;
extern unsigned char Y0;
extern unsigned char X1;
extern unsigned char Y1;
extern unsigned int CurrentPattern;

//
// ===== screen.s =====
//
extern void ScreenCopyHires();
extern void HiresClear();


#define abs(x)                 (((x)<0)?-(x):(x))

extern int LargeX0;
extern int LargeY0;
extern int LargeX1;
extern int LargeY1;
extern void DrawClippedLine();

#define NB_POINTS_SKEL 8
#define NB_SEGMENTS_SKEL 12
#define CUBE_SIZE 16

char points3Dskel[]={
	 -CUBE_SIZE, -CUBE_SIZE, CUBE_SIZE, 0// +CUBE_SIZE, 0 // P0
	,-CUBE_SIZE, -CUBE_SIZE,  -CUBE_SIZE, 0// -CUBE_SIZE, 0 // P1
	,+CUBE_SIZE, -CUBE_SIZE,  -CUBE_SIZE, 0// -CUBE_SIZE, 0 // P2
	,+CUBE_SIZE, -CUBE_SIZE, CUBE_SIZE, 0// +CUBE_SIZE, 0 // P3
	,-CUBE_SIZE, +CUBE_SIZE, CUBE_SIZE, 0// +CUBE_SIZE, 0 // P4
	,-CUBE_SIZE, +CUBE_SIZE,   -CUBE_SIZE, 0// -CUBE_SIZE, 0 // P5
	,+CUBE_SIZE, +CUBE_SIZE,  -CUBE_SIZE, 0// -CUBE_SIZE, 0 // P6
	,+CUBE_SIZE, +CUBE_SIZE, CUBE_SIZE, 0// +CUBE_SIZE, 0 // P7
};

unsigned char segmentsSkel[]={
	0, 1,
	1, 2,
	2, 3,
	3, 0,
	4, 5,
	5, 6,
	6, 7,
	7, 4,
	0, 4,
	1, 5,
	2, 6,
	3, 7,
};

char points2Dskel [NB_POINTS_SKEL	* SIZEOF_2DPOINT];


void drawSegments (unsigned char segments[], char pts2d[], unsigned char nbSeg ) {
	unsigned char ii;
    signed char aH1, aV1, aH2, aV2;
    unsigned char idxPt1, idxPt2;
    signed char   tmpH, tmpV;
    unsigned char m1, m2;
    unsigned char v1, v2;
    unsigned char isSegment2BeDrawn;

	for (ii=0; ii< nbSeg; ii++) {
		idxPt1 = segments[(ii<<1)+0];
        idxPt2 = segments[(ii<<1)+1];

        aH1=pts2d[(idxPt1<<2)+0];
        aV1=pts2d[(idxPt1<<2)+1];
        aH2=pts2d[(idxPt2<<2)+0];
        aV2=pts2d[(idxPt2<<2)+1];


        if (abs(aH2) < abs(aH1)) {
            tmpH = aH1;
            tmpV = aV1;
            aH1 = aH2;
            aV1 = aV2;
            aH2 = tmpH;
            aV2 = tmpV;
        }

        m1 = aH1 & ANGLE_MAX;
        m2 = aH2 & ANGLE_MAX;
        v1 = aH1 & ANGLE_VIEW;
        v2 = aH2 & ANGLE_VIEW;

        isSegment2BeDrawn = 0;
        if ((m1 == 0x00) || (m1 == ANGLE_MAX)) {
            if ((v1 == 0x00) || (v1 == ANGLE_VIEW)) {
                if((aH1 & 0x80) != (aH2 & 0x80)) {
                    if ((abs(aH2) < 127 - abs(aH1))) {
                        isSegment2BeDrawn = 1;
                    }
                }else {
                    isSegment2BeDrawn = 1;
                }
            }else{
                // P1 FRONT
                if ((m2 == 0x00) || (m2 == ANGLE_MAX)) {
                    // P2 FRONT
                    isSegment2BeDrawn = 1;
                } else {
                    // P2 BACK
                    if ((aH1 & 0x80) != (aH2 & 0x80)) {
                        if (abs(aH2) < 127 - abs(aH1)) {
                            isSegment2BeDrawn=1;
                        }
                    }
                }

            }
        }

		if (isSegment2BeDrawn) {
			LargeX0= 120  + ((int)(aH1)<<2);
			LargeY0= 100 - ((int)(aV1)<<2);
			LargeX1= 120  + ((int)(aH2)<<2);
			LargeY1= 100 - ((int)(aV2)<<2);
			DrawClippedLine();
		}
	}
}


void AddTriangle(unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned char pattern) {
    X0 = x0;
    Y0 = y0;
    X1 = x1;
    Y1 = y1;
    AddLineASM();
    X0 = x0;
    Y0 = y0;
    X1 = x2;
    Y1 = y2;
    AddLineASM();
    X0 = x2;
    Y0 = y2;
    X1 = x1;
    Y1 = y1;
    AddLineASM();

    CurrentPattern = pattern << 3;
    FillTablesASM();
}

void hrDrawFace(char p2d[], unsigned char idxPt1, unsigned char idxPt2, unsigned char idxPt3, unsigned char pattern) {
   			unsigned char x0= 120 + ((p2d[idxPt1 * SIZEOF_2DPOINT + 0])<<2);
			unsigned char y0= 100 - ((p2d[idxPt1 * SIZEOF_2DPOINT + 1])<<2);
			unsigned char x1= 120  + ((p2d[idxPt2 * SIZEOF_2DPOINT + 0])<<2);
			unsigned char y1= 100 - ((p2d[idxPt2 * SIZEOF_2DPOINT + 1])<<2);
			unsigned char x2= 120  + ((p2d[idxPt3 * SIZEOF_2DPOINT + 0])<<2);
			unsigned char y2= 100 - ((p2d[idxPt3 * SIZEOF_2DPOINT + 1])<<2);
    // AddTriangle(
    //     p2d[idxPt1 * SIZEOF_2DPOINT + 0], p2d[idxPt1 * SIZEOF_2DPOINT + 1],
    //     p2d[idxPt2 * SIZEOF_2DPOINT + 0], p2d[idxPt2 * SIZEOF_2DPOINT + 1],
    //     p2d[idxPt3 * SIZEOF_2DPOINT + 0], p2d[idxPt3 * SIZEOF_2DPOINT + 1],
    //     (pattern & 3));
    AddTriangle(x0, y0, x1, y1, x2, y2, (pattern & 3));
}

void hrDrawFaces() {
    hrDrawFace(points2Dskel, 0, 1, 2, 2);
    hrDrawFace(points2Dskel, 0, 2, 3, 2);
    //hrDrawFace(points2d, 0, 1, 5, 1);
    //hrDrawFace(points2d, 0, 5, 4, 1);
    hrDrawFace(points2Dskel, 4, 5, 6, 0);
    hrDrawFace(points2Dskel, 4, 6, 7, 0);
}

void main()
{


    hires ();

    GenerateTables();  // for line8
    // GenerateTables();  // for line8
    ComputeDivMod();   // for filler
    InitTables();      //for filler

    glCamPosX = -64;
    glCamPosY = 0;
    glCamPosZ = 0;

    glCamRotZ = 0;  // -128 -> -127 unit : 2PI/(2^8 - 1)
    glCamRotX = 0;

    glNbVertices      = 0;
    glNbSegments = 0;
    get();
    // addGeom2(0, 0, 0, 4, 4, 4, 0, geomCube);

    // for (glCamRotZ = -32; glCamRotZ < 32 ; glCamRotZ ++) {

        glProject(points2Dskel, points3Dskel, NB_POINTS_SKEL, 0);
        // for (jj=0; jj< glNbVertices; jj++){
        //     printf ("%d %d %d => %d %d \n", points3d[jj*SIZEOF_3DPOINT], points3d[jj*SIZEOF_3DPOINT+1], points3d[jj*SIZEOF_3DPOINT+2], points2d[jj*SIZEOF_2DPOINT], points2d[jj*SIZEOF_2DPOINT+1]);get();
        // }

        HiresClear();

        drawSegments (segmentsSkel, points2Dskel, NB_SEGMENTS_SKEL );
        // memset(0xa000, 64, 8000);  // clear screen
        // hrDrawSegments(points2d, segments, glNbSegments);
        hrDrawFaces();
        // memcpy((void *) HIRES_SCREEN_ADDRESS,(void *)ADR_DRAWING,8000);
        ScreenCopyHires();
        printf ("%d\n",glCamRotZ);
    // }


}

