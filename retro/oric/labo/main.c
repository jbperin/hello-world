//
// TEST_4
//
// This is a "HELLO WORLD" sample using
// an assembly code routine to display
// the message
//

#include "const.h"


#define INK_BLACK	0
#define INK_RED		1
#define INK_GREEN	2
#define INK_YELLOW	3
#define INK_BLUE	4
#define INK_MAGENTA	5
#define INK_CYAN	6
#define INK_WHITE	7

// Character Set modifier	
// 8		Use Standard Charset	
// 9		Use Alternate Charset	
// 10		Use Double Size Standard Charset	
// 11		Use Double Size Alternate Charset	
// 12		Use Blinking Standard Charset	
// 13		Use Blinking Alternate Charset	
// 14		Use Double Size Blinking Standard Charset	
// 15		Use Double Size Blinking Alternate Charset	
// Change Paper (background) color	
#define PAPER_BLACK	16
#define PAPER_RED	17
#define PAPER_GREEN	18
#define PAPER_YELLOW	19
#define PAPER_BLUE	20
#define PAPER_MAGENTA	21
#define PAPER_CYAN	22
#define PAPER_WHITE	23
// Video control attributes	
#define TEXT_60Hz	24
#define TEXT_50Hz	26
#define HIRES_60Hz	28
#define HIRES_50Hz	30


// Declare the assembly code function
void AdvancedPrint(char x_pos,char y_pos,const char *ptr_message);

void change_char(char c, unsigned char patt01, unsigned char patt02, unsigned char patt03, unsigned char patt04, unsigned char patt05, unsigned char patt06, unsigned char patt07, unsigned char patt08) {
    unsigned char* adr;
    adr      = (unsigned char*)(0xB400 + c * 8);
    *(adr++) = patt01;
    *(adr++) = patt02;
    *(adr++) = patt03;
    *(adr++) = patt04;
    *(adr++) = patt05;
    *(adr++) = patt06;
    *(adr++) = patt07;
    *(adr++) = patt08;
}
void put_char (unsigned char lin, unsigned char col, char ch2disp){
	char *ptr;
	ptr = (char *)(SCREEN_ADRESS+SCREEN_WIDTH*lin+col);
	*ptr = ch2disp;
}
void main()
{
	unsigned char line, column;
	
	// AdvancedPrint(2,1,"Hello World !");
	// AdvancedPrint(3,2,"Hello World !");
	// AdvancedPrint(4,3,"Hello World !");
	// line = 10;
	// column = 10;
	// change_char('a', 0x80, 0x40, 020, 0x10, 0x08, 0x04, 0x02, 0x01);
	// get();
	put_char (1, 1, INK_GREEN );
	put_char (1, 0, PAPER_BLUE);

	put_char (1, 5, INK_MAGENTA );
	put_char (1, 6, PAPER_GREEN);

}


// Fait a la main en gros lores0 c'est: effacer toute la zone de 0xbb80 a + 40*27 en y mettant 32 (espace)
//  et poker en BFDF l'attribut "mode texte", attendre une VBL, et remetter un espace
//  lores1 c'est pareil, mais en mettant en colonne zero un attribut "charactères alternés"
//  TEXT c'est pareil, mais en mettant en colonne zero un attribuyt papier, et en colonne un un attribut encre
//  S'abolir de toutes ces fonctions, ca permet de faire des transitions qui flashent pas, mélanger les modes graphiques et texte, maitrise a 100% des tables de caractères, et la possibilité d'utiliser de $C000 a $FFFF pour toi
//  plus toute la page2, et toute la page zero
//  Et ca permet de faire du code qui est 100% compatible Oric 1, Atmos, Telestrat

// Y'a aussi ca: http://www.osdk.org/index.php?page=articles&ref=ART8 et ca: http://www.osdk.org/index.php?page=articles&ref=ART9

