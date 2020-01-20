#include "lib.h"

#include "config.h"
#include "glOric.h"

#include "externs.c"
#include "alphabet.c"
#include "traj.c"

//
// ===== Display.s =====
//
extern unsigned char CurrentPixelX;             // Coordinate X of edited pixel/byte
extern unsigned char CurrentPixelY;             // Coordinate Y of edited pixel/byte

extern unsigned char OtherPixelX;               // Coordinate X of other edited pixel/byte
extern unsigned char OtherPixelY;               // Coordinate Y of other edited pixel/byte


//
// ====== Filler.s ==========

unsigned int	CurrentPattern=0;
extern	unsigned char	X0;
extern	unsigned char	Y0;
extern	unsigned char	X1;
extern	unsigned char	Y1;


 // Camera Position
extern int CamPosX;
extern int CamPosY;
extern int CamPosZ;

 // Camera Orientation
extern char CamRotZ;			// -128 -> -127 unit : 2PI/(2^8 - 1)
extern char CamRotX;


 // GEOMETRY BUFFERS
//extern char points3d[];
char points3d[NB_MAX_POINTS*SIZEOF_3DPOINT];
//extern unsigned char nbPts;
unsigned char nbPts=0;

extern char segments[];
extern unsigned char nbSegments;


//extern char points2d[];
char points2d [NB_MAX_POINTS*SIZEOF_2DPOINT];

#ifdef TEXTMODE
char faces[NB_MAX_FACES*SIZEOF_FACES];
unsigned char nbFaces=0;
//unsigned char distFaces[NB_MAX_FACES];

// TEXT SCREEN TEMPORARY BUFFERS
// z-depth buffer
unsigned char zbuffer [SCREEN_WIDTH*SCREEN_HEIGHT];
// frame buffer
char fbuffer [SCREEN_WIDTH*SCREEN_HEIGHT];

void initScreenBuffers(){
	memset (zbuffer, 0xFF, SCREEN_WIDTH*SCREEN_HEIGHT);
	memset (fbuffer, 0x20, SCREEN_WIDTH*SCREEN_HEIGHT); // Space
}


void addCube3(char X, char Y, char Z){
	unsigned char ii, jj;
	for (jj=0; jj < NB_POINTS_CUBE; jj++){
		points3d[(nbPts+jj)* SIZEOF_3DPOINT + 0] = ptsCube[jj*SIZEOF_3DPOINT + 0] + X;  				// X coord
		points3d[(nbPts+jj)* SIZEOF_3DPOINT + 1] = ptsCube[jj*SIZEOF_3DPOINT + 1] + Y;                // Y coord
		points3d[(nbPts+jj)* SIZEOF_3DPOINT + 2] = ptsCube[jj*SIZEOF_3DPOINT + 2] + Z;                // Z coord
	}
	for (jj=0; jj < NB_SEGMENTS_CUBE; jj++){
		segments[(nbSegments+jj)* SIZEOF_SEGMENT + 0] = segCube[jj*SIZEOF_SEGMENT + 0]+nbPts; // Index Point 1
		segments[(nbSegments+jj)* SIZEOF_SEGMENT + 1] = segCube[jj*SIZEOF_SEGMENT + 1]+nbPts; // Index Point 2
		segments[(nbSegments+jj)* SIZEOF_SEGMENT + 2] = segCube[jj*SIZEOF_SEGMENT + 2]; // Character
	}
   	for (jj=0; jj < NB_FACES_CUBE; jj++){
		faces[(nbFaces+jj)* SIZEOF_FACES + 0] = facCube[jj*SIZEOF_FACES + 0]+nbPts; // Index Point 1
		faces[(nbFaces+jj)* SIZEOF_FACES + 1] = facCube[jj*SIZEOF_FACES + 1]+nbPts; // Index Point 2
		faces[(nbFaces+jj)* SIZEOF_FACES + 2] = facCube[jj*SIZEOF_FACES + 2]+nbPts; // Index Point 3
		faces[(nbFaces+jj)* SIZEOF_FACES + 3] = facCube[jj*SIZEOF_FACES + 3]; // Character
	}

	nbPts += NB_POINTS_CUBE;
	nbSegments += NB_SEGMENTS_CUBE;
	nbFaces += NB_FACES_CUBE;
}

void addPlan(){
	unsigned char ii, jj;
    points3d[nbPts* SIZEOF_3DPOINT + 0] = -4;
    points3d[nbPts* SIZEOF_3DPOINT + 1] = -4;
    points3d[nbPts* SIZEOF_3DPOINT + 2] = 4;
    nbPts ++;
    points3d[nbPts* SIZEOF_3DPOINT + 0] = -4;
    points3d[nbPts* SIZEOF_3DPOINT + 1] = -4;
    points3d[nbPts* SIZEOF_3DPOINT + 2] = -4;
    nbPts ++;
    points3d[nbPts* SIZEOF_3DPOINT + 0] = -4;
    points3d[nbPts* SIZEOF_3DPOINT + 1] = 4;
    points3d[nbPts* SIZEOF_3DPOINT + 2] = -4;
    nbPts ++;
    points3d[nbPts* SIZEOF_3DPOINT + 0] = -4;
    points3d[nbPts* SIZEOF_3DPOINT + 1] = 4;
    points3d[nbPts* SIZEOF_3DPOINT + 2] = 4;
    nbPts ++;
    faces[nbFaces* SIZEOF_FACES + 0] = nbPts-4; // Index Point 1
    faces[nbFaces* SIZEOF_FACES + 1] = nbPts-3; // Index Point 2
    faces[nbFaces* SIZEOF_FACES + 2] = nbPts-2; // Index Point 3
    faces[nbFaces* SIZEOF_FACES + 3] = 77; // Index Point 3
    nbFaces ++;
    faces[nbFaces* SIZEOF_FACES + 0] = nbPts-4; // Index Point 1
    faces[nbFaces* SIZEOF_FACES + 1] = nbPts-2; // Index Point 2
    faces[nbFaces* SIZEOF_FACES + 2] = nbPts-1; // Index Point 3
    faces[nbFaces* SIZEOF_FACES + 3] = 77; // Index Point 3
    nbFaces ++;
}



#endif
void test_atan2() {

tx=0; ty=0; res=0; atan2_8();if (res!=0) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
tx=0; ty=1; res=0; atan2_8();if (res!=64) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
tx=0; ty=-1; res=0; atan2_8();if (res!=-64) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
tx=1; ty=0; res=0; atan2_8();if (res!=0) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
tx=-1; ty=0; res=0; atan2_8();if (res!=-128) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
tx=1; ty=1; res=0; atan2_8();if (res!=32) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
tx=-1; ty=1; res=0; atan2_8();if (res!=96) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
tx=1; ty=-1; res=0; atan2_8();if (res!=-32) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
tx=-1; ty=-1; res=0; atan2_8();if (res!=-96) printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
//#include "output.txt"

}
/*
void doProjection(){
	unsigned char ii = 0;
	for (ii = 0; ii< nbPts; ii++){
		PointX = points3d[ii*SIZEOF_3DPOINT + 0];
		PointY = points3d[ii*SIZEOF_3DPOINT + 1];
		PointZ = points3d[ii*SIZEOF_3DPOINT + 2];
		project();
		points2d[ii*SIZEOF_2DPOINT + 0] = ResX;
		points2d[ii*SIZEOF_2DPOINT + 1] = ResY;
	}
}
*/
/*
void drawSegments(){
	unsigned char ii = 0;
	unsigned char idxPt1, idxPt2;
	for (ii = 0; ii< nbSegments; ii++){

		idxPt1 =            segments[ii*SIZEOF_SEGMENT + 0];
		idxPt2 =            segments[ii*SIZEOF_SEGMENT + 1];
		char2Display =      segments[ii*SIZEOF_SEGMENT + 2];

		Point1X = points2d[idxPt1*SIZEOF_2DPOINT + 0];
		Point1Y = points2d[idxPt1*SIZEOF_2DPOINT + 1];
		Point2X = points2d[idxPt2*SIZEOF_2DPOINT + 0];
		Point2Y = points2d[idxPt2*SIZEOF_2DPOINT + 1];

		drawLine ();
	}
}
*/
char status_string[50];

void dispInfo(){
#ifdef TEXTMODE
	sprintf(status_string,"(x=%d y=%d z=%d) [%d %d]", CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX);
	AdvancedPrint(2,1,status_string);
#else
	printf("\nMike 8bit: ");
	printf ("(x=%d y=%d z=%d) [%d %d]", CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX);
#endif
}

#ifdef TEXTMODE
#include "txtDemo.c"
#else
#include "hrsDemo.c"
#endif

void hrDrawSegments2(){
	unsigned char ii = 0;
	unsigned char idxPt1, idxPt2;
	int OtherPixelX, OtherPixelY, CurrentPixelX, CurrentPixelY;
	for (ii = 0; ii< nbSegments; ii++){

		idxPt1 =            segments[ii*SIZEOF_SEGMENT + 0];
		idxPt2 =            segments[ii*SIZEOF_SEGMENT + 1];

        //OtherPixelX= (int)points2d[idxPt1*SIZEOF_2DPOINT + 0];
		OtherPixelX=((int *)points2d)[idxPt1*2];
        //OtherPixelY= (int)points2d[idxPt1*SIZEOF_2DPOINT + 2];
		OtherPixelY=((int *)points2d)[idxPt1*2+1];

        //CurrentPixelX=(int)points2d[idxPt2*SIZEOF_2DPOINT + 0];
		CurrentPixelX=((int *)points2d)[idxPt2*2];
        //CurrentPixelY=(int)points2d[idxPt2*SIZEOF_2DPOINT + 2];
		CurrentPixelY=((int *)points2d)[idxPt2*2+1];
		printf("%d %d %d %d \n",
		OtherPixelX, OtherPixelY, CurrentPixelX, CurrentPixelY);
		//cgetc();
		//tgi_line(OtherPixelX,OtherPixelY,CurrentPixelX,CurrentPixelY);
	}
}


void debugHiresIntro (){
    int i;
    //hires();

	CamPosX = -24;
	CamPosY = 0;
	CamPosZ = 3;

 	CamRotZ = 64 ;
	CamRotX = 2;

    for (i=0;i<2;) {
		CamPosX = traj[i++];
		CamPosY = traj[i++];
		CamRotZ = traj[i++];
		i = i % (NB_POINTS_TRAJ*SIZE_POINTS_TRAJ);
        glProject (points2d, points3d, nbPts);
        //memset ( 0xa000, 64, 8000); // clear screen
		hrDrawSegments2();
		//hrDrawFaces();
    }

	//leaveSC();

}

#ifdef TEXTMODE

#define abs(x) (((x)<0)?-(x):(x))

#include "fill8.c"

void buffer2screen(){
	/*int ii, jj;*/
    memcpy((void*)0xBB80, fbuffer, SCREEN_HEIGHT* SCREEN_WIDTH);
	/* clearScreen(); 
	for (ii=0;ii<SCREEN_HEIGHT; ii++){
		for (jj=2; jj < SCREEN_WIDTH; jj++){
			PutChar(jj,ii,fbuffer[ii*SCREEN_WIDTH+jj]);
		}
	}*/
}
// extern void PutChar(char x_pos,char y_pos,char ch2disp);
void fillFaces() {

    unsigned char ii=0;
    unsigned char jj = 0;
    int d1, d2, d3;
    int dmoy;
    unsigned char idxPt1, idxPt2, idxPt3, distface;
    unsigned char offPt1, offPt2, offPt3;
    signed char P1X, P1Y, P2X, P2Y, P3X, P3Y;
#ifdef ANGLEONLY
	signed char P1AH, P1AV, P2AH, P2AV, P3AH, P3AV;
#endif
	for (ii=0; ii< nbFaces; ii++) {
        jj = ii << 2;
        /*idxPt1 = faces[ii*SIZEOF_FACES+0];
        idxPt2 = faces[ii*SIZEOF_FACES+1];
        idxPt3 = faces[ii*SIZEOF_FACES+2];*/
        
		/*idxPt1 = faces[jj++];
        idxPt2 = faces[jj++];
        idxPt3 = faces[jj++];*/
        
        offPt1 = faces[jj++] << 2;
        offPt2 = faces[jj++] << 2;
        offPt3 = faces[jj++] << 2;
        
        //d1 = points2d [idxPt1*SIZEOF_2DPOINT+3]*256 + points2d [idxPt1*SIZEOF_2DPOINT+2];
        //d1 = points2d [(idxPt1<<2)+3]*256 + points2d [(idxPt1<<2)+2];
        //d1 = points2d [(idxPt1<<2)+3];
        //d1 <<= 8;
        //d1 |= points2d [(idxPt1<<2)+2];
        d1 = *((int*)(points2d+offPt1+2));
        //d2 = points2d [idxPt2*SIZEOF_2DPOINT+3]*256 + points2d [idxPt2*SIZEOF_2DPOINT+2];
        d2 = *((int*)(points2d+offPt2+2));
        //d3 = points2d [idxPt3*SIZEOF_2DPOINT+3]*256 + points2d [idxPt3*SIZEOF_2DPOINT+2];
        d3 = *((int*)(points2d+offPt3+2));
        

        //dmoy = (d1+d2+d3)/3;
        dmoy = (d1+d2+d3)>>2;
        if (dmoy >= 256) {
            //distFaces[ii] = 256;
            dmoy = 256;
        }/* else {			
            distFaces[ii] = dmoy;
        }*/
        distface = (unsigned char)(dmoy & 0x00FF);
#ifndef ANGLEONLY
        P1X=points2d [offPt1+0];
        P1Y=points2d [offPt1+1];
        P2X=points2d [offPt2+0];
        P2Y=points2d [offPt2+1];
        P3X=points2d [offPt3+0];
        P3Y=points2d [offPt3+1];
#else
	
		P1AH =  points2d [offPt1+0]/2;
        P1X  = -P1AH+(SCREEN_WIDTH/2);
		P1AV =  points2d [offPt1+1]/2;
        P1Y  = -P1AV+(SCREEN_HEIGHT/2);
		P2AH =  points2d [offPt2+0]/2;
        P2X  = -P2AH+(SCREEN_WIDTH/2);
		P2AV =  points2d [offPt2+1]/2;
        P2Y  = -P2AV+(SCREEN_HEIGHT/2);
		P3AH =  points2d [offPt3+0]/2;
        P3X  = -P3AH+(SCREEN_WIDTH/2);
		P3AV =  points2d [offPt3+1]/2;
        P3Y  = -P3AV+(SCREEN_HEIGHT/2);
   
#endif
        //printf ("[%d, %d], [%d, %d], [%d, %d]\n", P1X, P1Y, P2X, P2Y, P3X, P3Y);
        //get();
        fill8(P1X, P1Y, 
            P2X, P2Y, 
            P3X, P3Y,
            distface, faces[jj]);
    }

}
void faceIntro() {
    int i;
    get();
    enterSC();

	CamPosX = -24;
	CamPosY = 0;
	CamPosZ = 0;

 	CamRotZ = 64 ;			// -128 -> -127 unit : 2PI/(2^8 - 1)
	CamRotX = 2;

    for (i=0;i<120;) {
		CamPosX = traj[i++];
		CamPosY = traj[i++];
		CamRotZ = traj[i++];
		i = i % (NB_POINTS_TRAJ*SIZE_POINTS_TRAJ);
        glProject (points2d, points3d, nbPts);
        initScreenBuffers();
        fillFaces();
        buffer2screen();
    }

	CamPosX = -8;
	CamPosY = 8;
	CamPosZ = 1;

 	CamRotZ = -32 ;
	CamRotX = 0;
	for (i= 0; i< 8; i++) {
		forward();
        glProject (points2d, points3d, nbPts);
        initScreenBuffers();
        fillFaces();
        buffer2screen();
	}
	leaveSC();

}
void txtGameLoop2() {

	char key;
    unsigned char ii;    
	key=get();
	glProject (points2d, points3d, nbPts);
    
    printf ("(x=%d y=%d z=%d) [%d %d]\n", CamPosX, CamPosY, CamPosZ, CamRotZ, CamRotX);
        for (ii=0; ii< nbPts; ii++){
            printf ("[%d %d %d] => [%d %d] %d \n"
            , points3d [ii*SIZEOF_3DPOINT+0], points3d[ii*SIZEOF_3DPOINT+1], points3d[ii*SIZEOF_3DPOINT+2]
            , points2d [ii*SIZEOF_2DPOINT+0], points2d [ii*SIZEOF_2DPOINT+1], points2d[ii*SIZEOF_2DPOINT+2]
            );
        }
        get();
    
	initScreenBuffers();
	fillFaces();
    while (1==1) {
		//clearScreen();
		//drawSegments();
		buffer2screen();
		dispInfo();
		key=get();
		switch (key)	// key
		{
		case 8:	// gauche => tourne gauche
			CamRotZ += 4;
			break;
		case 9:	// droite => tourne droite
			CamRotZ -= 4;
			break;
		case 10: // bas => recule
			backward();
			break;
		case 11: // haut => avance
			forward();
			break;
		case 80: // P
			CamPosZ += 1;
			break;
		case 59: // ;
			CamPosZ -= 1;
			break;
		case 81: // Q
			CamRotX += 2;
			break;
		case 65: // A
			CamRotX -= 2;
			break;
		case 90: // Z
			shiftLeft();
			break;
		case 88: // X
			shiftRight();
			break;
		}
		glProject (points2d, points3d, nbPts);
		initScreenBuffers();
		fillFaces();
	}
}

void faceDemo(){
	nbPts =0 ;
	nbSegments =0 ;
    nbFaces =0 ;
	//addCube(-4, -4, 2);
    //addCube3(0, 0, 0);
    addPlan();
    //printf ("nbPoints = %d, nbSegments = %d, nbFaces = %d\n",nbPts, nbSegments, nbFaces);
	lores0();
	//faceIntro();

    CamPosX = -8;
	CamPosY = 0;
	CamPosZ = 1;

 	CamRotZ = 0;
	CamRotX = 0;


	txtGameLoop2();

}
#endif

void main()
{
    
	//faceDemo();
// THINK OF ANGLEONLY !!!!     
#ifdef TEXTMODE
	textDemo();
#else
	hiresDemo();
#endif
 
}
