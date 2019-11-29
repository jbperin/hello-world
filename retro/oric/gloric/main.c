#include    "lib.h"

 // Camera Position
extern int CamPosX;
extern int CamPosY;
extern int CamPosZ;

 // Camera Orientation
extern char CamRotZ;			// -128 -> -127 unit : 2PI/(2^8 - 1)
extern char CamRotX;

 // Point 3D Coordinates
extern int PointX;
extern int PointY;
extern int PointZ;

 // Point 2D Projected Coordinates
extern char ResX;			// -128 -> -127
extern char ResY;

 // Intermediary Computation
extern int DeltaX;
extern int DeltaY;


extern char Norm;
extern char AngleH;
extern char AngleV;


extern int square;
extern int thesqrt;

extern char Numberl;
extern char Numberh;

extern char Squarel;
extern char Squareh;

extern char Square1;
extern char Square2;
extern char Square3;
extern char Square4;

extern char N;

// ATAN on 1 octant
extern char ArcTang;
extern char Angle;
extern char Index;

// ATAN2
extern int TanX;
extern int TanY;
extern char Arctan8;
extern int TmpX;
extern int TmpY;
extern char Octant;
extern char NegIt;
extern char Ratio;

// ATAN2_8
extern char octant8;
extern char x1;
extern char x2;
extern char y1;
extern char y2;
extern char atanres;

// My ATAN2_8

extern char tx;
extern char ty;
extern char res;

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

void main()
{

	char * adrN, *adrSquare;
    int i;
    //cls();
	text();
    
    get();

    // TEST OF PROJECT

	CamPosX = 0;
	CamPosY = 0;
	CamPosZ = 1;
	CamRotZ = 0;
	CamRotX = 0;
	PointX = 1;
	PointY = 1;
	PointZ = 0;


	printf("PointX %d - %d CamX\n", PointX, CamPosX);
	printf("PointY %d - %d CamY\n", PointY, CamPosY);
	printf("PointZ %d - %d CamZ\n", PointZ, CamPosZ);


	project();
	printf("DeltaX = %d, %d =DeltaY\n", DeltaX, DeltaY);
	printf(" AngleH = %d, Norm = %d, AngleV =%d\n", AngleH, Norm, AngleV);

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
