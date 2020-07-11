
#include "glOric.h"
#include "params.h"
/*
 * VISIBILITY LIMITS
 */
#define ANGLE_MAX 0xC0
#define ANGLE_VIEW 0xE0

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


#include "tabpoints.c"

char points2D [NB_MAX_POINT	* SIZEOF_2DPOINT];

#include "traj_c.c"

signed char * current_traj;
unsigned char index_in_traj;
unsigned char traj_index;
unsigned char model_index;



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
    AddTriangle(x0, y0, x1, y1, x2, y2, (pattern & 3));
}

void hrDrawFaces() {
    hrDrawFace(points2D, 0, 1, 2, 2);
}

void updateCamera() {
    glCamPosX = current_traj [index_in_traj + 0];
    glCamPosY = current_traj [index_in_traj + 1];
    glCamPosZ = current_traj [index_in_traj + 2];
    glCamRotZ = current_traj [index_in_traj + 3];  // -128 -> -127 unit : 2PI/(2^8 - 1)
    glCamRotX = current_traj [index_in_traj + 4];
    printf ("[%d, %d, %d] (%d, %d)\n", glCamPosX, glCamPosY, glCamPosZ, glCamRotZ, glCamRotX);
}

void main()
{
    unsigned char inGame = 1;
    int kk=0;                     // keyboard entry

    hires ();

    GenerateTables();  // for line8

    ComputeDivMod();   // for filler
    InitTables();      //for filler

    traj_index = FIRST_TRAJ_TABLE;
    current_traj = tab_traj[traj_index];
    index_in_traj = (NB_POINT_TRAJ/2)*SIZE_POINT_TRAJ;

    model_index = 0;

    glCamPosX = current_traj [index_in_traj + 0]; //-64;
    glCamPosY = current_traj [index_in_traj + 1];
    glCamPosZ = current_traj [index_in_traj + 2];

    glCamRotZ = current_traj [index_in_traj + 3];  // -128 -> -127 unit : 2PI/(2^8 - 1)
    glCamRotX = current_traj [index_in_traj + 4];

    while (inGame) {

        glProject(points2D, ltab_points[model_index], ltab_nbpoints[model_index], 0);

        HiresClear();
        drawSegments (ltab_segments[model_index], points2D, ltab_nbsegments[model_index] );
        hrDrawFaces();
        ScreenCopyHires();

        kk = get();
        if (kk != 0) {
            switch (kk) {
                case 8:  // gauche => tourne gauche
                    index_in_traj = (index_in_traj + SIZE_POINT_TRAJ) % (NB_POINT_TRAJ*SIZE_POINT_TRAJ);
                    break;
                case 9:  // droite => tourne droite
                    if (index_in_traj == 0)
                        index_in_traj = NB_POINT_TRAJ*SIZE_POINT_TRAJ - SIZE_POINT_TRAJ;
                    index_in_traj = (index_in_traj - SIZE_POINT_TRAJ);
                    break;
                case 10: // bas
                    if (traj_index < NB_TRAJ_TABLE - 1)
                        traj_index = traj_index + 1;
                    current_traj = tab_traj[traj_index];
                    break;
                case 11: // haut
                    if (traj_index > 0)
                        traj_index = traj_index - 1;
                    current_traj = tab_traj[traj_index];
                    break;
                case 68: // 'D'
                case 72: // 'H'
                case 73: // 'I'
                case 74: // 'J'
                case 75: // 'K'
                    break;
                case 65: // 'A'
                case 81: // 'Q'
                    inGame = 0;
                    break;
                case 82: // 'R'
                case 90: // 'W'
                    break;
                default:
                    printf ("you pressed %d\n", kk);
            }
            updateCamera();
        }
    }
}

