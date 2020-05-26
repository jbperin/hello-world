// #include "stdio.h"


extern void glProject (char *tabpoint2D, char *tabpoint3D, unsigned char nbPoints, unsigned char opts);
extern void AdvancedPrint(unsigned char Xpos,unsigned char Ypos, char *message);

extern int CamPosX, CamPosY, CamPosZ;
extern char CamRotZ, CamRotX;

char chaine[]="coucou";

void main (){

    unsigned char i = 12;

    i = i+1;
    AdvancedPrint(  10,10,chaine);
}