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

extern char ArcTang;
extern char Angle;
extern char Index;

void main()
{

	char * adrN;
    //cls();
	text();

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
	square = 16;
	sqrt24();
	printf("square root of  = %d is %d \n", square, thesqrt);
	//multiply16();
	/*printf("root of  = %d is %d %d %d %d\n",
		DeltaX,
		((char *)&DeltaXSquare)[0],
		((char *)&DeltaXSquare)[1],
		((char *)&DeltaXSquare)[2],
		((char *)&DeltaXSquare)[3]
	);*/

	Numberl = 4;
	Numberh = 2;

    Square1 = 0;
    Square2 = 0;
    Square3 = 0;
    Square4 = 0;

	Square16 ();
	printf("square of  = %d is %d  %d %d %d\n", Numberh *256  + Numberl, Square1, Square2, Square3, Square4);
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

}
