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


// Music : Rainy Day , by LADYWASKY
char game_music[] = {
1,7,12,4,0,0,0,0, 1,7,12,4,0,0,0,0, 1,7,11,4,0,0,0,0, 1,7,11,4,0,0,0,0, 1,7,9,4,0,0,0,0, 3,3,9,4,8,2,0,0, 
//Intro,A2,,,,,,,
6,7,0,0,8,3,4,4,  3,3,9,4,8,2,0,0, 7,7,11,4,8,3,4,4, 2,3,0,0,7,2,0,0, 7,7,11,4,7,3,2,4, 2,3,0,0,7,2,0,0,
7,7,11,4,7,3,2,4, 2,3,0,0,5,2,0,0, 7,7,12,4,5,3,12,4,2,3,0,0,5,2,0,0, 7,7,12,4,5,3,12,4,3,3,12,4,5,2,0,0,
7,7,11,4,5,3,12,4,3,3,11,4,5,2,0,0,7,7,9,4,5,3,12,4, 3,3,9,4,8,2,0,0, 6,7,0,0,8,3,4,4,  3,3,12,4,8,2,0,0,
7,7,2,5,8,3,4,4,  2,3,0,0,7,2,0,0, 7,7,12,4,7,3,2,4, 3,3,11,4,7,2,0,0,7,7,9,4,7,3,2,4,  2,3,0,0,5,2,0,0,
6,7,0,0,5,3,12,4, 2,3,0,0,5,2,0,0, 7,7,12,4,5,3,12,4,1,7,12,4,0,0,0,0,3,3,12,4,5,2,0,0, 7,7,11,4,5,3,12,4,
3,3,11,4,5,2,0,0, 6,7,9,4,5,3,12,4,2,3,9,4,8,2,0,0,  6,7,0,0,8,3,4,4, 3,3,12,4,8,2,0,0, 6,7,0,0,8,3,4,4,
3,3,7,4,7,2,0,0,  6,7,0,0,7,3,2,4, 2,3,0,0,7,2,0,0, 7,7,12,4,7,3,2,4, 3,3,11,4,5,2,0,0, 7,7,9,4,5,3,12,4,
3,3,11,4,5,2,0,0,7,7,12,4,5,3,12,4,2,3,0,0,5,2,0,0, 6,7,0,0,5,3,12,4, 2,3,0,0,5,2,0,0,  6,7,0,0,5,3,12,4, 
3,3,12,4,8,2,0,0, 
//Boucle,A3,,,,,,,
6,7,0,0,8,3,4,4,  3,3,7,4,8,2,0,0, 7,7,7,4,8,3,4,4,  2,3,0,0,7,2,0,0, 7,7,4,4,7,3,2,4,  3,3,7,4,7,2,0,0,
7,7,7,4,7,3,2,4,  2,3,0,0,5,2,0,0, 6,7,0,0,5,3,12,4, 2,3,0,0,5,2,0,0, 7,7,12,4,5,3,12,4,3,3,12,4,5,2,0,0,
7,7,11,4,5,3,12,4,3,3,11,4,5,2,0,0,7,7,9,4,5,3,12,4, 3,3,9,4,8,2,0,0, 
//Boucle,A2,,,,,,,
6,7,0,0,8,3,4,4,  3,3,9,4,8,2,0,0, 7,7,11,4,8,3,4,4, 2,3,0,0,7,2,0,0, 7,7,11,4,7,3,2,4, 2,3,0,0,7,2,0,0,
7,7,11,4,7,3,2,4, 2,3,0,0,5,2,0,0, 7,7,12,4,5,3,12,4,2,3,0,0,5,2,0,0, 7,7,12,4,5,3,12,4,3,3,12,4,5,2,0,0,
7,7,11,4,5,3,12,4,3,3,11,4,5,2,0,0,7,7,9,4,5,3,12,4, 3,3,9,4,8,2,0,0, 6,7,0,0,8,3,4,4,  3,3,12,4,8,2,0,0,
7,7,2,5,8,3,4,4,  2,3,0,0,7,2,0,0, 7,7,12,4,7,3,2,4, 3,3,11,4,7,2,0,0,7,7,9,4,7,3,2,4,  2,3,0,0,5,2,0,0,
6,7,0,0,5,3,12,4, 2,3,0,0,5,2,0,0, 7,7,12,4,5,3,12,4,1,7,12,4,0,0,0,0,3,3,12,4,5,2,0,0, 7,7,11,4,5,3,12,4,
3,3,11,4,5,2,0,0, 6,7,9,4,5,3,12,4,2,3,9,4,8,2,0,0,  6,7,0,0,8,3,4,4, 3,3,12,4,8,2,0,0, 6,7,0,0,8,3,4,4,
3,3,7,4,7,2,0,0,  6,7,0,0,7,3,2,4, 2,3,0,0,7,2,0,0,  7,7,12,4,7,3,2,4,3,3,11,4,5,2,0,0, 7,7,9,4,5,3,12,4,
3,3,11,4,5,2,0,0, 7,7,12,4,5,3,12,4,2,3,0,0,5,2,0,0, 6,7,0,0,5,3,12,4,2,3,0,0,5,2,0,0, 6,7,0,0,5,3,12,4, 
//Fin,A4,,,,,,,
3,3,2,5,8,2,0,0,  6,7,0,0,8,3,4,4, 3,3,7,4,8,2,0,0,  7,7,7,4,8,3,4,4, 2,3,0,0,7,2,0,0,  7,7,4,4,7,3,2,4,
3,3,7,4,7,2,0,0,  7,7,7,4,7,3,2,4, 3,3,5,4,5,2,0,0,  6,7,0,0,5,3,12,4,3,3,4,5,5,2,0,0,  6,7,0,0,5,3,12,4,
3,3,2,5,5,2,0,0,  1,7,9,4,0,0,0,0, 2,7,0,0,5,2,0,0,  2,7,0,0,5,2,0,0, 2,7,0,0,5,2,0,0};


// int           music_index;       // music in for music array indexing
// char          volume;		     // game sound volume

// void play_music()
// {
// 	unsigned char p1,p2,n1,o1,n2,o2,n3,o3;

// 	p1=game_music[music_index]; 
// 	p2=game_music[music_index+1]; 
// 	n1=game_music[music_index+2]; 
// 	o1=game_music[music_index+3]; 
// 	n2=game_music[music_index+4]; 
// 	o2=game_music[music_index+5]; 
// 	n3=game_music[music_index+6]; 
// 	o3=game_music[music_index+7]; 
	
// 	//rv=game_music[music_index+8]; 
	
// 	//printf("p1=%d p2=%d o1=%dn1=%d o2=%d n2=%d o3=%d\n",p1,p2,o1,n2,o2,n3,o3);
	
// 	if (n1>0) 
// 		music(1,o1,n1,volume);
// 	if (n2>0) 
// 		music(2,o2,n2,volume);
// 	if (n3>0) 
// 		music(3,o3,n3,volume);		
	
// 	music_index+=8;
// 	if (music_index>=(sizeof(game_music)-9))
// 		music_index=0;
	
	
// 	//music(1,game_music[music_index],game_music[music_index+1],0);
// 	//play(1,0,8,(1110*game_music[music_index+2]));
// 	//music_index+=3;
// 	//if (music_index>=sizeof(game_music))
// 	//   music_index=0;
// }

// signed char rand (){
// 	return (1);
// }
extern unsigned int asmSeed;


void main()
{
	unsigned char line, column;

	unsigned char ii;
	unsigned char k=0;

	// AdvancedPrint(2,1,"Hello World !");
	cls();

	AdvancedPrint(3,2,"Hello World !");
	get();
	initRand(deek(0x276));
	while (k!=65){
		k=key();
		if (k!=0) {
			ii = getRand ();printf ("rnd =%d \n", ii);
		}
	}
	// ii = myRand ();printf ("rnd =%d \n", ii); get();
	// ii = myRand ();printf ("rnd =%d \n", ii); get();
	// ii = myRand ();printf ("rnd =%d \n", ii); get();
	// ii = myRand ();printf ("rnd =%d \n", ii); get();
	// ii = myRand ();printf ("rnd =%d \n", ii); get();
	// play(7,0,0,0);

	// music_index=0;
	// play_music();

	// while (k!=65){
	// 	k=key();
	// 	play_music();
	// 	//printf ("key = %d \n",k);
	// }
	// kernelInit();

	// InitISR();

	// while (stop !=1 )
	// {
    //     dump_matrix();
	// }

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

