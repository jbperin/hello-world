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

#include "traj_c.c"


#include "WALK_02_01_c.c"
#include "RUNJOG_02_03_c.c"
#include "JUMP_02_04_c.c"
#include "HELLO_141_16_c.c"
#include "KICK_86_03_c.c"
#include "IDLE_140_06_c.c"
#include "QUIT_113_08_c.c"
#include "DANCE_141_12_c.c"

char * listActions[] = {  points3D_WALK_02_01
    , points3D_RUNJOG_02_03
    , points3D_JUMP_02_04
    , points3D_HELLO_141_16
    , points3D_KICK_86_03
    , points3D_IDLE_140_06
    , points3D_QUIT_113_08
    , points3D_DANCE_141_12
};

unsigned char nbFramesActions[] = {  NB_FRAME_WALK_02_01
    , NB_FRAME_RUNJOG_02_03
    , NB_FRAME_JUMP_02_04
    , NB_FRAME_HELLO_141_16
    , NB_FRAME_KICK_86_03
    , NB_FRAME_IDLE_140_06
    , NB_FRAME_QUIT_113_08
    , NB_FRAME_DANCE_141_12
}; 

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

char points3D_GROUND[]={
		-16,	-32,	-32,	0 
	,	-16,	32,	-32,	1 
	,	16,	-32,	-32,	2 
	,	16,	32,	-32,	3 
};
unsigned char segmentsGround[]={
	0, 1,
	1, 3,
	3, 2,
	2, 0,
};
char points2Dground [4 * SIZEOF_2DPOINT];

 
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
    int kk=0;                     // keyboard entry
    unsigned char inGame = 1;

    unsigned char actionNumber = 5;
    unsigned char changeAction = 0;

    char *ptr_dataskel;
    unsigned char nb_frameskel;

    unsigned char indexInTraj = 16*3;

    hires ();
    printf ("Left/Right, (D)ance, (H)ello, (I)dle, (J)ump, (K)ick, (R)un, (W)alk, (Q)uit");
    memset(ADR_DRAWING, 64, 8000);

    GenerateTables();  // for line8

    glCamPosX = -64;
    glCamPosY = 0;
    glCamPosZ = 0;
 
    glCamRotZ = 0;  // -128 -> -127 unit : 2PI/(2^8 - 1)
    glCamRotX = 0;

    glNbVertices      = 0;
    glNbSegments = 0;

    ptr_dataskel = listActions[actionNumber];
    nb_frameskel = nbFramesActions[actionNumber];

    while (inGame) {

        ptr_dataskel = listActions[actionNumber];
        nb_frameskel = nbFramesActions[actionNumber];
        

        for (ii = 0; (ii < nb_frameskel) && inGame ; ii ++) {
            if ((actionNumber == 6) && (ii == nb_frameskel-1)){
                inGame = 0;
                break;
            }
            kk = key();
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
                        actionNumber = 7;changeAction = 1;
                        break;
                    case 72: // 'H'
                        actionNumber = 3;changeAction = 1;
                        break;
                    case 73: // 'I'
                        actionNumber = 5;changeAction = 1;
                        break;
                    case 74: // 'J'
                        actionNumber = 2;changeAction = 1;
                        break;
                    case 75: // 'K'
                        actionNumber = 4;changeAction = 1;
                        break;
                    case 65: // 'A'
                    case 81: // 'Q'
                        actionNumber = 6;changeAction = 1;
                        break;
                    case 82: // 'R'
                        actionNumber = 1;changeAction = 1;
                        break;
                    case 90: // 'W'
                        actionNumber = 0;changeAction = 1;
                        break;
                    default:
                        printf ("you pressed %d\n", kk);
                }
            }
            if (changeAction) {
                changeAction = 0;
                break;
            }
            glProject(points2Dskel, ptr_dataskel, NB_POINTS_SKEL, 0);
           glProject(points2Dground, points3D_GROUND, 4, 0);
            
            // memset(ADR_DRAWING, 64, 8000);
            HiresClear();

            drawSegments (segmentsSkel, points2Dskel, NB_SEGMENTS_SKEL );
            drawSegments (segmentsGround, points2Dground, 4 );


            // ScreenCopyHires();
            memcpy((void *) HIRES_SCREEN_ADDRESS,(void *)ADR_DRAWING,8000);

            ptr_dataskel += NB_POINTS_SKEL*SIZEOF_3DPOINT;
        }
    }

}

