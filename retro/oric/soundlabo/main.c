//
// TEST_3
//
// This is a "HELLO WORLD" sample using
// an assembly code routine to display
// the message
//
#include "lib.h"
#include "labels.h"

// Declare the assembly code function
void SimplePrint(const char *ptr_message);
// SimplePrint("Hello World !");

void write2AyChip (unsigned char regnumber, unsigned char regvalue);

// int play(int soundchanels,int noisechanels,int envelop,int volume);
// int music(int chanel,int octave,int key,int volume);
// int sound(int chanel,int period,int volume);

void main()
{
	// char valeur[220];
	int val ;
	
	int soundchanels, noisechanels, envelop, volume;
	int chanel, octave, period, key;

	// soundchanels = ; noisechanels = ; envelop = ; volume = ;
	// play(soundchanels,noisechanels,envelop, volume);

	// chanel= ; octave= ; key= ; volume=;
	// music( chanel, octave, key, volume);

	// sound(chanel, period, volume);
	// chanel  = 1;
	// volume = 5;
	// for (octave = 0 ; octave <= 6; octave ++) {
	// 	for (key = 1 ; key <= 12; key ++){
	// 		music( chanel, octave, key, volume);
	// 		for (val =0; val< 6500; val++);
	// 	}
	// }
	// play(12,0,0,0);

	music( 2, 2, 5, 5);
	for (val =0; val< 6500; val++);
	play (0, 0, 0, 0);
		// write2AyChip (0, 0);
		// write2AyChip (1, 0);
		// write2AyChip (2, 0);
		// write2AyChip (3, 0);
		// write2AyChip (4, 0);
		// write2AyChip (5, 0);
		// write2AyChip (8, 0);
		// write2AyChip (9, 0);
		// write2AyChip (13, 0);

	// write2AyChip (0x0D, 0x08);
	// while (1==1) {
	// 	get();
	// 	printf ("son \n");

	// 	// write2AyChip (6, 17);
	// 	// write2AyChip (7, 7);
	// 	// write2AyChip (10, 20);
	// 	// write2AyChip (11, 20);
	// 	// write2AyChip (12, 20);
	// 	// write2AyChip (14, 20);
	// 	// write2AyChip (15, 0);
	// }

	// scanf ("%d", &val);

}
