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


// redefined 35 characters for graphics and sprites game
unsigned char redefchar[]={

01,01,01,01,02,03,06,06, // 91
63,63,63,63,63,30,00,30, // 92
32,32,32,32,16,48,24,24, // 93
06,06,06,06,07,03,01,00, // 94
63,45,63,51,30,45,63,63, // 95
24,24,24,24,56,48,32,00, // 96
30,63,45,63,51,45,63,30, // 97  // ungry head   - ancien blanc coté gauche du ventre, peut etre recyclé
63,63,63,00,63,63,63,51, // 98
00,30,47,63,63,63,30,00, // 99 - ice boulder
00,00,00,00,00,00,01,01, // 100
51,51,51,00,30,30,63,63, // 101
00,00,00,00,00,00,32,32, // 102
01,01,01,00,01,01,07,07, // 103
51,51,51,00,33,33,33,33, // 104
32,32,32,00,32,32,56,56, // 105
63,63,63,51,30,45,63,63, // 106
0x08,0x08,28,28,62,62,46,28,  // 107   goutte à rattraper 1/2   - bug with 8 value ? must be hex 0x08
00,00,00,00,00,00,00,00, // 108  goutte à rattraper 2/2
00,00,04,04,14,14,10,04, // 109
00,00,00,00,00,00,00,00, // 110
30,63,45,63,63,45,51,30, // 111 head of life number
04,28,31,15,03,03,02,06, // 112 right cat  // bug a cette position dans la memoire verifier si addresse utilsiée ailleurs
01,01,62,60,60,12,38,42, // 113 right cat
16,16,15,07,07,06,12,10, // 114 left cat
04,07,63,62,56,24,40,44, // 115 left cat
00,00,00,00,06,06,07,07, // 116
00,00,00,00,00,03,47,47, // 117
00,00,00,00,00,48,61,61, // 118
00,00,00,00,24,24,56,56, // 119
04,35,0x9,07,07,0x9,35,04, // 120  fire boulder left 04,34,0x09,07,07,0x09,34,04
0x08,17,36,56,56,36,17,0x08, // 121  fire boulder right
62,62,62,62,62,62,62,28, // 122 tile
03,06,12,31,00,00,00,01, // 123 lightning left
00,00,00,60,12,24,48,32, // 124 lightning right
03,02,04,0x08,16,32,00,00// 125 lightning head character redefine
// 126, 127 allready used in them native graphics
}; 


color_inverse_menu()
{		
	asm("lda #$BB;"
		"sta read_menu+2;"
		"sta write_menu+2;"
		"lda #$D1;"
		"sta read_menu+1;"
		"sta write_menu+1;"

		"ldy #25;"	// page height	
		"suite_y:"
			"clc;"
			"ldx #38;"
			"suite_x:"
			    "clc;"
				"read_menu:"
				"lda $1234,x;"
				"cmp #33;"   // if (a == 33) =='!'
				"bne saut_33;"
					"lda #32;"   // put space char
					"ora #128;"  // inverse color
				"saut_33:"
				"cpy #10;"
				"bcc sauty;"
				"cmp #32;"   // if (a == 32)
				"bne saut_32;"
					"lda #122;"  // put bric
					"ora #128;"  // inverse color
				"saut_32:"
			    "sauty:"
				"write_menu;"
				"sta $1234,x;"
				"dex;"
			"bne suite_x;"
			"clc;"
			"lda read_menu+1;"  // load low address
			"adc #40;"			// a=a+40
			"bcc saut_menu;"    // si pas de retenue on saute à saut_menu
				"inc read_menu+2;"  // ajout de la retenue
				"inc write_menu+2;"
			"saut_menu;"	
			"sta read_menu+1;"
			"sta write_menu+1;"
			
			"dey;"				
		"bne suite_y;");
}


// redefine characters
void redefine_char()
{
	int j, i;
   // 0xB400 - 46080 beginning of charset
   // 46808 = char no 86
  
   char startchar;
   j=0;
   for (i=46808;i<46808+sizeof(redefchar)-1;i++)
	  *(unsigned char*)i=redefchar[j++];
}



display_menu()
{
	int i;
	paper(6);ink(4);

	// scrolling hybrid graphics mode : Text & Hires
	poke(0xbb80+40,HIRES_50Hz); 
	for (i=8;i<16;i++)
		poke(0xA000+(40*i)+2,TEXT_50Hz);

	// Scrolling Text colors
	// *(unsigned char*)(0xA000+(40*8)+1)=1&7;
	// *(unsigned char*)(0xA000+(40*9)+1)=5&7;
	// *(unsigned char*)(0xA000+(40*10)+1)=3&7;
	// *(unsigned char*)(0xA000+(40*11)+1)=7&7;
	// *(unsigned char*)(0xA000+(40*12)+1)=3&7;
	// *(unsigned char*)(0xA000+(40*13)+1)=5&7;
	// *(unsigned char*)(0xA000+(40*14)+1)=1&7;
	// *(unsigned char*)(0xA000+(40*15)+1)=0&7;

	*(unsigned char*)(0xA000+(40*8)+1)=2&7;
	*(unsigned char*)(0xA000+(40*9)+1)=6&7;
	*(unsigned char*)(0xA000+(40*10)+1)=4&7;
	*(unsigned char*)(0xA000+(40*11)+1)=0&7;
	*(unsigned char*)(0xA000+(40*12)+1)=4&7;
	*(unsigned char*)(0xA000+(40*13)+1)=6&7;
	*(unsigned char*)(0xA000+(40*14)+1)=2&7;
	*(unsigned char*)(0xA000+(40*15)+1)=1&7;

    AdvancedPrint(0,0,"                                        ");
	AdvancedPrint(2,1,"                                      ");
	// clear background
	for (i=16;i<28;i++)
	{
		AdvancedPrint(2,i,"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
		poke(0xBB80+1+(i*40),4);
	}
	
	// screen of menu page
	AdvancedPrint(2,2,"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
	AdvancedPrint(2,3,"mmmmmmm     mmmm    mmm mm mmmm mmmmmm");
	AdvancedPrint(2,4,"mmmmmm! !!!! mm !!!! m!mm!  mm! mmmmmm");
	AdvancedPrint(2,5,"mmmmmm! mmm! m! mmm! mm m! ! m! mmmmmm");
	AdvancedPrint(2,6,"mmmmmm!     mm!      m! m! m! ! mmmmmm");
	AdvancedPrint(2,7,"mmmmmm! !!! mm! !!!! m! m! mm!  mmmmmm");
	AdvancedPrint(2,8,"mmmmmm! mm!! m! mmm! m! m! mmm! mmmmmm");
	AdvancedPrint(2,9,"mmmmmm!mmmm!mm!mmmm!mm!mm!mmmm!mmmmmmm");
	AdvancedPrint(2,10,"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
	AdvancedPrint(2,11, "mmm     mmmm    mmm mmmm mm mmm    mmm");
	AdvancedPrint(2,12,"mm! !!!! mm !!!! m!  mm! m!mmm !!!! mm");
	AdvancedPrint(2,13,"mm! mmm! m! mmm! m! ! m! mm m! mmm!mmm");
	AdvancedPrint(2,14,"mm!     mm!      m! m! ! m! m! mmmmmmm");
	AdvancedPrint(2,15,"mm! !!!mmm! !!!! m! mm!  m! m! mmmm mm");
	AdvancedPrint(2,16,"mm! mmmmmm! mmm! m! mmm! m! mm!    mmm");
	AdvancedPrint(2,17,"mm!mmmmmmm!mmmm!mm!mmmm!mm!mmmm!!!mmmm");
	AdvancedPrint(6,21,"\23\4DIRECTION : ARROWS KEY < > \4\26");
	AdvancedPrint(13,23,"\23\4SPACE TO JUMP\4\26");
	AdvancedPrint(10,25,"\23\4PRESS SPACE TO PLAY\4\26");
    // text color   // 12 = blink

	color_inverse_menu();
	
	poke(0xBB80+(25*40)+9,12);
	poke(0xBB80+(25*40)+31,8);
	 
	 
	// to debbug
	// gotoxy(20,0);printf("CODE=%d IDX=%d",rain[index_raindrop],index_raindrop);
}



void main()
{
	unsigned char line, column;
	unsigned char ii;
	// AdvancedPrint(2,1,"Hello World !");
	// AdvancedPrint(3,2,"Hello World !");
	// AdvancedPrint(4,3,"Hello World !");
	// line = 10;
	// column = 10;
	// change_char('a', 0x80, 0x40, 020, 0x10, 0x08, 0x04, 0x02, 0x01);
	// get();
	// put_char (1, 1, INK_GREEN );
	// put_char (1, 0, PAPER_BLUE);

	// put_char (1, 5, INK_MAGENTA );
	// put_char (1, 6, PAPER_GREEN);

	// put_char (2, 1, INK_MAGENTA );
	// put_char (2, 10, HIRES_50Hz);
	// put_char (3, 20, TEXT_50Hz);

	// redefine_char();
	// display_menu();

	// FOR Y=0 TO 40
	for (ii = 0; ii<40 ; ii++){

	// : POKE #BB80+(Y*40)+0,30   ' Switch to HIRES
		poke (0xBB80+(ii*40)+0,HIRES_50Hz);
	// NEXT Y
	}
	for (ii = 0; ii<199 ; ii++){
	// FOR Y=0 TO 199
	// : POKE #A000+(Y*40)+1,Y AND 7   ' Change INK color
		poke (0xA000+(ii*40)+1, ii & 0x07);
	// : POKE #A000+(Y*40)+2,26        ' Switch to TEXT
		poke (0xA000+(ii*40)+2, TEXT_50Hz);
	// NEXT Y
	}

}


// Fait a la main en gros lores0 c'est: effacer toute la zone de 0xbb80 a + 40*27 en y mettant 32 (espace)
//  et poker en BFDF l'attribut "mode texte", attendre une VBL, et remetter un espace
//  lores1 c'est pareil, mais en mettant en colonne zero un attribut "charactères alternés"
//  TEXT c'est pareil, mais en mettant en colonne zero un attribuyt papier, et en colonne un un attribut encre
//  S'abolir de toutes ces fonctions, ca permet de faire des transitions qui flashent pas, mélanger les modes graphiques et texte, maitrise a 100% des tables de caractères, et la possibilité d'utiliser de $C000 a $FFFF pour toi
//  plus toute la page2, et toute la page zero
//  Et ca permet de faire du code qui est 100% compatible Oric 1, Atmos, Telestrat

// Y'a aussi ca: http://www.osdk.org/index.php?page=articles&ref=ART8 et ca: http://www.osdk.org/index.php?page=articles&ref=ART9

