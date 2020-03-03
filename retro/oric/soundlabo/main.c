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

void write2AyChip (unsigned char regnumber, unsigned char regvalue);

void main()
{
	// char valeur[220];
	// int val ;
	SimplePrint("Hello World !");


		write2AyChip (0, 0);
		write2AyChip (1, 0);
		write2AyChip (2, 0);
		write2AyChip (3, 0);
		write2AyChip (4, 0);
		write2AyChip (5, 0);
		write2AyChip (8, 0);
		write2AyChip (9, 0);
		write2AyChip (13, 0);

	// write2AyChip (0x0D, 0x08);
	while (1==1) {
		get();
		printf ("son \n");

		write2AyChip (6, 17);
		write2AyChip (7, 7);
		write2AyChip (10, 20);
		// write2AyChip (11, 20);
		// write2AyChip (12, 20);
		// write2AyChip (14, 20);
		// write2AyChip (15, 0);
	}

	// scanf ("%d", &val);

}
