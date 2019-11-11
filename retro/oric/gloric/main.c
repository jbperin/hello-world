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

void main()
{
    //cls();
	text();

	CamPosX = 34;
	printf("%d\n", CamPosX);
	
	project();
	printf("%d\n", CamPosX);

}



