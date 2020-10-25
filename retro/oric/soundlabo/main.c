//
// TEST_3
//
// This is a "HELLO WORLD" sample using
// an assembly code routine to display
// the message
//
#include "lib.h"
#include "labels.h"

extern unsigned char mesure;
extern unsigned char temps;
extern unsigned char fraction;

// Declare the assembly code function
void AdvancedPrint(char x_pos,char y_pos,const char *ptr_message);


// void write2AyChip (unsigned char regnumber, unsigned char regvalue);

int jb_play(int soundchanels,int noisechanels,int envelop,int volume){
	play(soundchanels, noisechanels, envelop, volume);

}
int jb_music(int chanel,int octave,int key,int volume){
	music(chanel, octave, key, volume);
}
int jb_sound(int chanel,int period,int volume){
	sound( chanel, period, volume);
}

#define SLOW_DOWN_DURATION 7000
#define music_tempo_delay 60  // delay to temporize the music
int           music_index;       // music in for music array indexing
int           music_tempo;       // music temporisation 
char          volume;		     // game sound volume
int tt;
char strinfo [40];

void dispinfo () {
	sprintf (strinfo, "%d %d %d           ", mesure, temps, fraction);
	AdvancedPrint(2,0,strinfo);
}

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
3,3,2,5,5,2,0,0,  1,7,9,4,0,0,0,0, 2,7,0,0,5,2,0,0,  2,7,0,0,5,2,0,0, 2,7,0,0,5,2,0,0

};

void play_music()
{
	unsigned char p1,p2,n1,o1,n2,o2,n3,o3;

	p1=game_music[music_index]; 
	p2=game_music[music_index+1]; 
	n1=game_music[music_index+2]; 
	o1=game_music[music_index+3]; 
	n2=game_music[music_index+4]; 
	o2=game_music[music_index+5]; 
	n3=game_music[music_index+6]; 
	o3=game_music[music_index+7]; 
	
	jbPlay(p2,0,0,0);
	//printf("p1=%d p2=%d o1=%dn1=%d o2=%d n2=%d o3=%d\n",p1,p2,o1,n2,o2,n3,o3);
	
	if (n1>0) 
		jbMusic(1,o1,n1,volume);
	if (n2>0) 
		jbMusic(2,o2,n2,volume);
	if (n3>0) 
		jbMusic(3,o3,n3,volume);		
	
	music_index+=8;
	if (music_index>=(sizeof(game_music)-9))
		music_index=0;

}


void main()
{
	// char valeur[220];
	int val ;
	
	int soundchanels, noisechanels, envelop;
	int chanel, octave, period, key;


	music_index=0;
	music_tempo = 8;
	volume=7;

	get();
	kernelInit();
// 1,7,12,4,0,0,0,0
	// jbPlay(7, 0, 0, 0);
	// jbMusic(1,4,12,volume);
	// if (n2>0) 
	// 	jb_music(2,o2,n2,volume);
	// if (n3>0) 
	// 	jb_music(3,o3,n3,volume);		
	
	do {
		// for(tt=0;tt<SLOW_DOWN_DURATION;tt++);
		dispinfo ();
		music_tempo--;
		// play_music();
		if (music_tempo==0)
		{
			play_music();
			music_tempo=music_tempo_delay;
		}
	} while (1==1);

	// soundchanels = ; noisechanels = ; envelop = ; volume = ;
	// play(soundchanels,noisechanels,envelop, volume);
	// music_tempo--;
	


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


	// get();
	// explode();
	// for (val =0; val< 6500; val++);
	// music( 1, 2, 5, 5);
	// for (val =0; val< 6500; val++);
	// play (0, 0, 0, 0);
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
