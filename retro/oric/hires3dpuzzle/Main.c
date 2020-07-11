
#include "glOric.h"
#include "params.h"


/*
 * VISIBILITY LIMITS
 */
#define ANGLE_MAX 0xC0
#define ANGLE_VIEW 0xE0

#define LANG 2



#if defined LANG && LANG == 1
char help[]         ="Ht/Bs/Gch/Drt (S)uiv (P)rec (Q)uitter\n";
char format[]       ="Puzzle %d. %d/%d resolus.\n\n";
// S = Suivant
#define KEY_NEXT_MODEL          83
// P = Precedent
#define KEY_PREVIOUS_MODEL      80
// Q = Quitter
#define KEY_EXIT                81
#endif

#if defined LANG && LANG == 2
char help[]         ="Arrb/Abj/Izq/Drch (S)ig (P)rev Sa(L)ir\n";
char format[]       ="Rompecaberas %d. %d/%d resueltos.";
// S = Siguiente
#define KEY_NEXT_MODEL          83
// P = Previo
#define KEY_PREVIOUS_MODEL      80
// L = Salir
#define KEY_EXIT                76
#endif

#if ! defined LANG || LANG == 0
char help[]="Up/Dwn/Lft/Rght (N)ext (P)revious (Q)uit";
char format[]="Puzzle %d / %d. %d puzzles solved.";
// N
#define KEY_NEXT_MODEL          78
// P
#define KEY_PREVIOUS_MODEL      80
// Q = Quitter
#define KEY_EXIT                81
#endif

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

unsigned char solved [NB_MODELS];
unsigned char nbSolved = 0;
signed char * save_traj[NB_MODELS];
unsigned char save_index_in_traj[NB_MODELS];


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
    unsigned char ii;
    unsigned char *current_face_tab;
    unsigned char idx;
    current_face_tab = ltab_faces[model_index];
    for (ii=0; ii< ltab_nbfaces[model_index]; ii++){
        idx = ii << 2;
        hrDrawFace(points2D, current_face_tab[idx], current_face_tab[idx+1], current_face_tab[idx+2], current_face_tab[idx+3]);
    }
}

void updateModel(){
    current_traj = save_traj[model_index];
    index_in_traj = save_index_in_traj[model_index];
    updateStatus();
}

void saveModelContext(){
    save_traj[model_index] = current_traj; 
    save_index_in_traj[model_index] = index_in_traj;
}

void updateCamera() {
    unsigned int idx;
    glCamPosX = current_traj [index_in_traj + 0];
    glCamPosY = current_traj [index_in_traj + 1];
    glCamPosZ = current_traj [index_in_traj + 2];
    glCamRotZ = current_traj [index_in_traj + 3];  // -128 -> -127 unit : 2PI/(2^8 - 1)
    glCamRotX = current_traj [index_in_traj + 4];
    // printf ("[%d, %d, %d] (%d, %d)\n", glCamPosX, glCamPosY, glCamPosZ, glCamRotZ, glCamRotX);

}
void updateStatus() {
    cls();
    printf (help);
    printf (format, model_index, NB_MODELS, nbSolved);
}
void main()
{
    unsigned char inGame = 1;
    int kk=0;                     // keyboard entry
    unsigned char ii;
    unsigned int idx;
    hires ();

    GenerateTables();  // for line8

    ComputeDivMod();   // for filler
    InitTables();      //for filler

    traj_index = FIRST_TRAJ_TABLE;
    current_traj = tab_traj[traj_index];
    index_in_traj = (NB_POINT_TRAJ/2)*SIZE_POINT_TRAJ;

    model_index = 1;

    nbSolved = 0;

    updateStatus();

    for (ii = 0; ii < NB_MODELS; ii++) {
        solved[ii]= 0;
        save_traj[ii] = tab_traj[traj_index];
        save_index_in_traj[ii] = index_in_traj; 
    }

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
                // case 82: // 'R'
                // case 90: // 'W'
                // case 65: // 'A'
                // case 68: // 'D'
                // case 72: // 'H'
                // case 73: // 'I'
                // case 74: // 'J'
                // case 75: // 'K'
                // case 76: // 'L'
                // case 77: // 'M'
                // case 79: // 'O'
                //     break;
                case KEY_PREVIOUS_MODEL: // 'P'
                    if (model_index > 0){
                        saveModelContext();
                        model_index--;
                        updateModel();
                    }
                    break;
                case KEY_NEXT_MODEL: // 'N'
                    if (model_index < NB_MODELS-1) {
                        saveModelContext();
                        model_index++;
                        updateModel();
                    }
                    break;
                case KEY_EXIT: // 'Q'
                    inGame = 0;
                    break;
                default:
                    // printf ("you pressed %d\n", kk);
                    break;
            }
            updateCamera();
        }
    }
}

