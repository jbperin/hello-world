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

extern char DeltaXSquare;
extern char DeltaYSquare;

extern int Quotient;
extern int Remainder;

extern int square;
extern int thesqrt;

extern char Numberl;
extern char Numberh;

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


void test_atan2() {
	        
//#include "output.txt"                 
             
}

void main()
{

	char * adrN;
    //cls();
	text();

/*
    // TEST OF PROJECT

	CamPosX = 0;
	CamPosY = 0;
	CamPosZ = 1;
	CamRotZ = 0;
	CamRotX = 0;
	PointX = 2;
	PointY = 6;
	PointZ = 0;


	printf("PointX %d - %d CamX\n", PointX, CamPosX);
	printf("PointY %d - %d CamY\n", PointY, CamPosY);


	project();
	printf("DeltaX = %d, %d =DeltaY\n", DeltaX, DeltaY);
	printf("Quotient = %d, %d =Rem\n", Quotient, Remainder);

    // TEST OF SQUARE 24

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


    // TEST OF DIV 32 BYT 16
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

    // TEST OF ATAN
    ArcTang = 10;
    Angle = 0;
    atan();
    printf(" %d, index = %d,  angle =  %d\n", ArcTang, Index, Angle);
*/
    // TEST OF ATAN2
    TanX = 0x0000; TanY = 0x0000; Arctan8 = 1; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=0) printf("ERR atan2 (%d, %d) = %d\n", TanX, TanY, Arctan8);

    TanX = 1; TanY = 0; Arctan8 = 1; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=0) printf("ERR atan2 (%d, %d) = %d\n", TanX, TanY, Arctan8);

    TanX = -1; TanY = 0; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=-128) printf("ERR atan2 (%d, %d) = %02d\n", TanX, TanY, Arctan8);

    TanX = 0; TanY = 1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=64) printf("ERR atan2 (%d, %d) = %d\n", TanX, TanY, Arctan8);

    TanX = 0; TanY = -1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=-64) printf("ERR atan2 (%d, %d) = %d\n", TanX, TanY, Arctan8);

	TanX = 0x00FF; TanY = 0; Arctan8 = 1; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=0) printf("ERR atan2 (%d, %d) = %d\n", TanX, TanY, Arctan8);

	// python code to generate expected value:
	// print (round(math.atan2(TanY,TanX)*(128.0/math.pi)))
	TanX = 2; TanY = 1; Arctan8 = 2; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=19) printf("ERR atan2 (%d, %d) = %d tmpY=%d\n", TanX, TanY, Arctan8, TmpY);

	TanX = 2; TanY = -1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=-19) printf("ERR atan2 (%d, %d) = %d exp %d\n", TanX, TanY, Arctan8, -19);

	TanX = 2; TanY = -4; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=-45) printf("ERR atan2 (%d, %d) = %d tmpY=%d\n", TanX, TanY, Arctan8, TmpY);

	TanX = -2; TanY = 4; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=83) printf("ERR atan2 (%d, %d) = %d tmpX=%d\n", TanX, TanY, Arctan8, TmpX);

	TanX = -2; TanY = 1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=109) printf("ERR atan2 (%d, %d) = %d Octant = %d ArcTang=%d angle=%d\n", TanX, TanY, Arctan8,Octant, ArcTang, Angle);

	TanX = -2; TanY = -1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=-109) printf("ERR atan2 (%d, %d) = %d tmpX=%d tmpY=%d\n", TanX, TanY, Arctan8, TmpX, TmpY);

	TanX = -2; TanY = -4; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=-83) printf("ERR atan2 (%d, %d) = %d tmpX=%d tmpY=%d\n", TanX, TanY, Arctan8, TmpX, TmpY);

	TanX = 1; TanY = 1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=32) printf("ERR atan2 (%d, %d) = %d exp = 32 \n", TanX, TanY, Arctan8);

	TanX = 1; TanY = -1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=-32) printf("ERR atan2 (%d, %d) = %d exp = -32 \n", TanX, TanY, Arctan8);

	TanX = -1; TanY = -1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=-96) printf("ERR atan2 (%d, %d) = %d exp = -32 \n", TanX, TanY, Arctan8);

	TanX = -1; TanY = 1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=96) printf("ERR atan2 (%d, %d) = %d exp = -32 \n", TanX, TanY, Arctan8);

	TanX = 123; TanY = 124; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    if (Arctan8!=32) printf("ERR atan2 (%d, %d) = %d exp = -32 \n", TanX, TanY, Arctan8);

	/*TanX = 6; TanY = 1; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    printf("ERR atan2 (%d, %d) = %d Angle = %d, ArcTang = %d, Index = %d, Ration = %d\n", TanX, TanY, Arctan8, Angle, ArcTang, Index, Ratio);

	TanX = 5; TanY = 2; Arctan8 = 0; TmpX = 0; TmpY = 0;
    atan2 ();
    printf("ERR atan2 (%d, %d) = %d Angle = %d, ArcTang = %d, Index = %d, Ration = %d\n", TanX, TanY, Arctan8, Angle, ArcTang, Index, Ratio);*/

	test_atan2 ();
}
