#include "lib.h"

#include "config.h"
#include "glOric.h"

#include "externs.c"
#include "alphabet.c"

 // Camera Position
extern int CamPosX;
extern int CamPosY;
extern int CamPosZ;

 // Camera Orientation
extern char CamRotZ;			// -128 -> -127 unit : 2PI/(2^8 - 1)
extern char CamRotX;


 // GEOMETRY BUFFERS
extern char points3d[];
extern unsigned char nbPoints;

extern char segments[];
extern unsigned char nbSegments;

extern char points2d[];


const char sentence[] = "MERCI RENE";

void addData(const char *tPoint, unsigned char nPoint, const char *tSeg, unsigned char nSeg, char offsetPos){
	unsigned char jj;
	for (jj=0; jj < nPoint; jj++){
		points3d[(nbPoints+jj)* SIZEOF_3DPOINT + 0] = tPoint[jj*SIZEOF_3DPOINT + 0] + offsetPos*8;  // X coord
		points3d[(nbPoints+jj)* SIZEOF_3DPOINT + 1] = tPoint[jj*SIZEOF_3DPOINT + 1];                // Y coord
		points3d[(nbPoints+jj)* SIZEOF_3DPOINT + 2] = tPoint[jj*SIZEOF_3DPOINT + 2];                // Z coord
	}
	for (jj=0; jj < nSeg; jj++){
		segments[(nbSegments+jj)* SIZEOF_SEGMENT + 0] = tSeg[jj*SIZEOF_SEGMENT + 0]+nbPoints; // Index Point 1 
		segments[(nbSegments+jj)* SIZEOF_SEGMENT + 1] = tSeg[jj*SIZEOF_SEGMENT + 1]+nbPoints; // Index Point 2
		segments[(nbSegments+jj)* SIZEOF_SEGMENT + 2] = tSeg[jj*SIZEOF_SEGMENT + 2]; // Character
	}
	nbPoints += nPoint; 
	nbSegments += nSeg;

}

void initBuffers(){
	unsigned char ii, jj;
	char c;
	unsigned char nPoint, nSeg;
	const char *tPoint, *tSeg;
	while((c=sentence[ii]) != 0) {
		
		switch (c) {
			case 'M':addData(ptsM, NB_POINTS_M, segM, NB_SEGMENTS_M, ii);break;
			case 'C':addData(ptsC, NB_POINTS_C, segC, NB_SEGMENTS_C, ii);break;
			case 'I':addData(ptsI, NB_POINTS_I, segI, NB_SEGMENTS_I, ii);break;
			case 'R':addData(ptsR, NB_POINTS_R, segR, NB_SEGMENTS_R, ii);break;
			case 'E':addData(ptsE, NB_POINTS_E, segE, NB_SEGMENTS_E, ii);break;
			case 'N':addData(ptsN, NB_POINTS_N, segN, NB_SEGMENTS_N, ii);break;
			default:
				break;
		}

		ii++;
	}
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
	for (ii = 0; ii< nbPoints; ii++){
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
void gameLoop() {

	char key;
	key=get();
	doProjection();

    while (1==1) {
		cls(); //clearScreen();
		drawSegments();
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
			CamPosX--;
			break;

		case 11: // haut => avance
			CamPosX++;
			break;
		}
		doProjection();
	}
}
void intro (){
    int i;
    enterSC();
    for (i=0;i<80;i++,CamPosX++) {
        
        doFastProjection();             // 25  s => 20s         => 15s
        cls (); // clearScreen();   //  1.51 s => 23s (3s)
		drawSegments();             // 11.5 s  => 34s (11s)
   }
    
    for (i=0;i<80;i++,CamPosX--) {

        doFastProjection();
        cls() ; 
		drawSegments();
   }
    leaveSC();
}
void main()
{

	char * adrN, *adrSquare;
    int i, j;
    //cls();
	text();
    //kernelInit();
	initBuffers();

 // Camera Position
	CamPosX = -5;
	CamPosY = -5;
	CamPosZ = 2;

 // Camera Orientation
	CamRotZ = 24 ;			// -128 -> -127 unit : 2PI/(2^8 - 1)
	CamRotX = 16;
	get ();
    clearScreen();
    
    intro ();
   
 	//gameLoop();
    
	
    // TEST OF FAST ATAN2
	/*
	tx=-16; ty=-1; res=0; fastatan2(); printf("ERR atan(%d, %d)= %d\n",tx,ty,res);
*/
    // TEST OF DRAWLINE
    /*
	get();
	Point1X = -10;
    Point1Y = -10;
    Point2X = 30;
    Point2Y = 20;
    drawLine ();
    */
    // TEST OF PROJECT

	/* CamPosX = 0;
	CamPosY = 0;
	CamPosZ = 1;
	
	CamRotZ = 0;
	CamRotX = 0;
	
	PointX = 4;
	PointY = -2;
	PointZ = 0;


	printf("PointX %d - %d CamX\n", PointX, CamPosX);
	printf("PointY %d - %d CamY\n", PointY, CamPosY);
	printf("PointZ %d - %d CamZ\n", PointZ, CamPosZ);


	project();
	printf("DeltaX = %d, %d =DeltaY\n", DeltaX, DeltaY);
	printf(" AngleH = %d, Norm = %d, AngleV =%d\n", AngleH, Norm, AngleV);
	printf(" ResX = %d, ResY = %d\n", ResX, ResY);
    */
    
    
 /*   
    // TEST OF SQUARE 8
	Numberl = 0x04;
	Numberh = 0x00;

    Squarel = 0;
    Squareh = 0;

	Square8 ();
	printf("square of  = %d is %d \n", Numberh *256  + Numberl, Squareh*256 +Squarel);
    
    adrSquare = (char*)&square;
    
    *(adrSquare+0) = Squarel;
    *(adrSquare+1) = Squareh;
    sqrt_16 ();
    
	printf("root of  %d is %d \n", square, thesqrt);
*/


/*
    // TEST OF SQUARE ROOT 24

	square = 16;
	sqrt24();
	printf("square root of  = %d is %d \n", square, thesqrt);

    // TEST OF SQUARE 16
	Numberl = 4;
	Numberh = 2;

    Square1 = 0;
    Square2 = 0;
    Square3 = 0;
    Square4 = 0;

	Square16 ();
	printf("square of  = %d is %d  %d %d %d\n", Numberh *256  + Numberl, Square1, Square2, Square3, Square4);


    // TEST OF DIV 32 BY 16
	adrN = &N;
	*(adrN+0) = 4; // Divisor LO
	*(adrN+1) = 0; // Divisor HI
	*(adrN+2) = 1; // Dividend HIL ==> REMAINDER LO
	*(adrN+3) = 0; // Divisor HIH ==> REMAINDER HI
	*(adrN+4) = 0; // Divisor LOL ==> QUOTIENT LO
	*(adrN+5) = 0; // Divisor LOH ==> QUOTIENT HI
	printf("[%d, %d, %d, %d] divided by [%d,  %d]", *(adrN+3), *(adrN+2), *(adrN+5), *(adrN+4), *(adrN+1), *(adrN+0));
	div32by16();
	printf(" is [%d, %d] remaining [%d, %d]\n", *(adrN+5), *(adrN+4), *(adrN+3), *(adrN+2));

    */
}
