#include "config.h"
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

#define NB_POINTS_SKEL 14
#define NB_SEGMENTS_SKEL 13


#include "WALK_02_01_c.c"


unsigned char segmentsSkel[]={
	0, 1,
	1, 2,
	2, 3,
	2, 4,
	2, 5,
	4, 6,
	5, 7,
    0, 8,
    0, 9,
	8, 10,
	9, 11,
	10, 12,
	11, 13,
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

void main()
{
    unsigned char ii;
    int k;

    char *ptr_dataskel;
    unsigned char nb_frameskel;

    hires ();

    GenerateTables();  // for line8

    glCamPosX = -64;
    glCamPosY = 0;
    glCamPosZ = 0;

    glCamRotZ = 0;  // -128 -> -127 unit : 2PI/(2^8 - 1)
    glCamRotX = 0;

    glNbVertices      = 0;
    glNbSegments = 0;

    ptr_dataskel = points3D_WALK_02_01;
    nb_frameskel = NB_FRAME_WALK_02_01;

    while ((k = key()) != 81) {

        ptr_dataskel = points3D_WALK_02_01;
        nb_frameskel = NB_FRAME_WALK_02_01;


        for (ii = 0; ii < nb_frameskel ; ii ++) {

            glProject(points2Dskel, ptr_dataskel, NB_POINTS_SKEL, 0);

            HiresClear();

            drawSegments (segmentsSkel, points2Dskel, NB_SEGMENTS_SKEL );

            ScreenCopyHires();

            ptr_dataskel += NB_POINTS_SKEL*SIZEOF_3DPOINT;
        }
    }

}

