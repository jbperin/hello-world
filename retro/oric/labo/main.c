//
// TEST_4
//
// This is a "HELLO WORLD" sample using
// an assembly code routine to display
// the message
//

#include "const.h"




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
	ptr = (char *)(LORES_SCREEN_ADDRESS+LORES_SCREEN_WIDTH*lin+col);
	*ptr = ch2disp;
}

char statusString [26];


void task_100Hz (){
	sprintf (statusString, "%d", deek(0x276));
	
	AdvancedPrint(3,2,statusString);
}

/* Initialization of ISR */
extern void InitISR();

/* Virtual keyboard matrix                   */
/* Organized as follows:                     */
/* byte is row number (selected through AY)  */
/* bit in byte indicates the row (selected   */
/* through the VIA port B) numbered 76543210 */
/* For mapping actual keys see:              */
/* http://wiki.defence-force.org/doku.php?id=oric:hardware:oric_keyboard */

extern char KeyBank[8];
extern char oldKeyBank[8];

unsigned char stop = 0;
/* Function to dump the matrix into screen */
void dump_matrix();

void main()
{
	unsigned char line, column;

	unsigned char ii;
	// AdvancedPrint(2,1,"Hello World !");
	cls();

	AdvancedPrint(3,2,"Hello World !");

	// kernelInit();

	InitISR();

	while (stop !=1 )
	{
        dump_matrix();
	}

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

	//affiche_intro();

	//               CYAN, YELL, MAGE, BLUE, GREEN, RED, CYAN, YELL
	// change_char('c', 0x7F, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x7F, 0x00);
	// change_char('y', 0x00, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7F);
	// change_char('m', 0x00, 0x00, 0x7F, 0x00, 0x00, 0x7F, 0x00, 0x00);
	// change_char('r', 0x00, 0x55, 0x7F, 0x00, 0x55, 0x7F, 0x00, 0x00);
	// change_char('g', 0x55, 0xAA, 0x00, 0x00, 0x7F, 0x00, 0x55, 0xAA);
	// change_char('b', 0xAA, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x55, 0x00);



    // for (line = 0; line < LORES_SCREEN_HEIGHT/2; line++) {
    //     for (column = 2; column < LORES_SCREEN_WIDTH; column++) {
	// 		put_char(line, column, 'b');
    //     // put_char(line, 1, PAPER_BLUE);
	// 	}
    // }
    // for (line = LORES_SCREEN_HEIGHT/2; line < LORES_SCREEN_HEIGHT; line++) {
    //     for (column = 2; column < LORES_SCREEN_WIDTH; column++) {
    //         put_char(line, column, 'g');
    //         // put_char(ii, 1, PAPER_GREEN);
    //     }
    // }

	// put_char(6, 11, 'c');
	// put_char(6, 12, 'c');
	// put_char(6, 13, 'c');
	// put_char(6, 14, 'y');
	// put_char(6, 15, 'y');
	// put_char(6, 16, 'y');
	// put_char(6, 17, 'm');
	// put_char(6, 18, 'm');
	// put_char(6, 19, 'm');
	// put_char(6, 20, 'r');
	// put_char(6, 21, 'r');
	// put_char(6, 22, 'r');
	// put_char(6, 23, 'g');
	// put_char(6, 24, 'g');
	// put_char(6, 25, 'g');

	
/*
    for (ii = 0; ii < LORES_SCREEN_HEIGHT/2; ii++) {
        put_char(ii, 0, INK_BLACK);
        put_char(ii, 1, PAPER_BLUE);
    }
    for (ii = LORES_SCREEN_HEIGHT/2; ii < LORES_SCREEN_HEIGHT; ii++) {
        put_char(ii, 0, INK_BLACK);
        put_char(ii, 1, PAPER_GREEN);
    }

	put_char(6, 10, INK_RED );
	put_char(6, 11, 'c');
	put_char(6, 12, 'c');
	put_char(6, 13, 'c');
*/


}
char num_line = 1;

void keyPressed (char dif, char v){

	sprintf (statusString, "key pressed: %d %d   ", dif, v);
	// printf (statusString);
	AdvancedPrint(3,num_line ++ ,statusString);
	num_line = num_line % 10;
}
void keyReleased (char dif, char v){

	sprintf (statusString, "   key released: %d %d    ", dif, v);
	// printf (statusString);
	AdvancedPrint(3, num_line ++,statusString);
	num_line = num_line % 10;
}
void dump_matrix()
{
    char * start;
    char i,j;
    char mask=1;
	char diff;
     
    start=(char *)(0xbfe0-350);
    for (j=0;j<8;j++)
    {
		if ((diff = (oldKeyBank[j] ^ KeyBank [j])) != 0){
			// printf ("diff = %d\n");
			if ((KeyBank [j] & diff) == 0) {
				keyReleased (diff, j);
			} else {
				keyPressed (diff, j);
			}
		}
		oldKeyBank[j] = KeyBank [j];
	}
    // for (j=0;j<8;j++)
    // {
    //     for(i=0;i<8;i++)
    //         {
    //             *start = (KeyBank[j] & mask ? '1' : '0');
    //             start--;
    //             mask=mask<<1;
    //         }
    //     mask=1;
    //     start+=(48);
    // }
}
// Fait a la main en gros lores0 c'est: effacer toute la zone de 0xbb80 a + 40*27 en y mettant 32 (espace)
//  et poker en BFDF l'attribut "mode texte", attendre une VBL, et remetter un espace
//  lores1 c'est pareil, mais en mettant en colonne zero un attribut "charactères alternés"
//  TEXT c'est pareil, mais en mettant en colonne zero un attribuyt papier, et en colonne un un attribut encre
//  S'abolir de toutes ces fonctions, ca permet de faire des transitions qui flashent pas, mélanger les modes graphiques et texte, maitrise a 100% des tables de caractères, et la possibilité d'utiliser de $C000 a $FFFF pour toi
//  plus toute la page2, et toute la page zero
//  Et ca permet de faire du code qui est 100% compatible Oric 1, Atmos, Telestrat

// Y'a aussi ca: http://www.osdk.org/index.php?page=articles&ref=ART8 et ca: http://www.osdk.org/index.php?page=articles&ref=ART9

