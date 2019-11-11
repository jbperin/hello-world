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

void main()
{
    //cls();
	text();

	CamPosX = 3;
	CamPosY = 0;
	CamPosY = 1;	
	CamRotZ = 0;
	CamRotX = 0;
	PointX = 1;
	PointY = 1;
	PointZ = 0;
	
	printf("PointX %d - %d CamX\n", PointX, CamPosX);
	
	project();
	printf("DeltaX = %d\n", DeltaX);

}



