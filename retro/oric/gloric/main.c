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

char faces[NB_MAX_FACES*SIZEOF_FACES];
unsigned char nbFaces=0;
unsigned char distFaces[NB_MAX_FACES];

//extern char points2d[];
char points2d [NB_MAX_POINTS*SIZEOF_2DPOINT];

// TEXT SCREEN TEMPORARY BUFFERS

char zbuffer [SCREEN_WIDTH*SCREEN_HEIGHT];

char fbuffer [SCREEN_WIDTH*SCREEN_HEIGHT];


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

#include "txtDemo.c"

#include "hrsDemo.c"

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

#define abs(x) (((x)<0)?-(x):(x))

#include "fill8.c"

void main()
{
    int ii=0;
    int d1, d2, d3;
    int dmoy;
    unsigned char idxPt1, idxPt2, idxPt3;
    
    nbPts =0 ;
	nbSegments =0 ;
    nbFaces =0 ;
	//addCube(-4, -4, 2);
    addCube3(0, 0, 0);
    printf ("nbPoints = %d, nbSegments = %d, nbFaces = %d\n",nbPts, nbSegments, nbFaces);
    
    CamPosX = -24;
	CamPosY = 0;
	CamPosZ = 3;

 	CamRotZ = 64 ;
	CamRotX = 2;

    glProject (points2d, points3d, nbPts);
    
    
    printf ("points2d[0] = %d, %d, %d, %d\n",points2d[0],points2d[1],points2d[2],points2d[3]);
    printf ("dist = %d\n", d1);
    for (ii=0; ii< nbFaces; ii++) {
        idxPt1 = faces[ii*SIZEOF_FACES+0];
        idxPt2 = faces[ii*SIZEOF_FACES+1];
        idxPt3 = faces[ii*SIZEOF_FACES+2];
        d1 = points2d [idxPt1*SIZEOF_2DPOINT+3]*256 + points2d [idxPt1*SIZEOF_2DPOINT+2];
        d2 = points2d [idxPt2*SIZEOF_2DPOINT+3]*256 + points2d [idxPt2*SIZEOF_2DPOINT+2];
        d3 = points2d [idxPt3*SIZEOF_2DPOINT+3]*256 + points2d [idxPt3*SIZEOF_2DPOINT+2];
        dmoy = (d1+d2+d3)/3;
        if (dmoy >= 256) {
            distFaces[ii] = 256;
        } else {
            distFaces[ii] = dmoy;
        }
        printf ("face %d: %d, %d, %d => %d\n", ii, faces[ii*SIZEOF_FACES+0], faces[ii*SIZEOF_FACES+1], faces[ii*SIZEOF_FACES+2], distFaces[ii]);
        
        fill8(points2d [idxPt1*SIZEOF_2DPOINT+0], points2d [idxPt1*SIZEOF_2DPOINT+1], 
            points2d [idxPt2*SIZEOF_2DPOINT+0], points2d [idxPt2*SIZEOF_2DPOINT+1], 
            points2d [idxPt3*SIZEOF_2DPOINT+0], points2d [idxPt3*SIZEOF_2DPOINT+1],
            distFaces[ii], faces[ii*SIZEOF_FACES+3]);
    }

  //  debugHiresIntro();
	/*Point1X = 4;
	Point1Y = 10;
	Point2X = 18;
	Point2Y = 10;
	char2Display = 42;
	get();

	drawLine ();*/
	/*fill8(7,3,3,1,1,5);*/
    
		//printf ("----------\n");
		//fill8(1,5,6,5,5,1);
		//printf ("----------\n");
		//fill8(-1,3,2,-1,5,5);

/*	int i=0;

	CamPosX = -24;
	CamPosY = 0;
	CamPosZ = 3;

 	CamRotZ = 64 ;			// -128 -> -127 unit : 2PI/(2^8 - 1)
	CamRotX = 2;
	get();
	nbPts =0 ;
	nbSegments =0 ;
	addCube(-4, -4, 2);
	//addCube(4, 4, 10);
	glProject (points2d, points3d, nbPts);

	for (i=0; i< 12; i+=4) {
		printf ("%d %d %d %d =>",
			points3d[i+0],
			points3d[i+1],
			points3d[i+2],
			points3d[i+3]
		);
		printf ("%d %d %d %d\n",
			points2d[i+0],
			points2d[i+1],
			points2d[i+2],
			points2d[i+3]
		);
	}
*/
	/* printf("Value before	glProject: %d %d %d %d \n", points2d[1]<<8+points2d[0], points2d[3]<<8+points2d[2], points2d[5]<<8+points2d[4], points2d[7]<<8+points2d[6]);
	glProject (points2d, points3d, nbPts);
	printf("Value returned by glProject: %d %d %d %d \n", points2d[0], points2d[1], points2d[2], points2d[3]);
	printf("Value returned by glProject: %d %d %d %d \n", points2d[1]<<8+points2d[0], points2d[3]<<8+points2d[2], points2d[5]<<8+points2d[4], points2d[7]<<8+points2d[6]);
	*/
/*
#ifdef TEXTMODE
	textDemo();
#else
	hiresDemo();
#endif
*/
}
