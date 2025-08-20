//
// TEST_3
//
// This is a "HELLO WORLD" sample using
// an assembly code routine to display
// the message
//
#include "config.h"

// Declare the assembly code function
void SimplePrint(const char *ptr_message);

extern void uneFonction();
extern int function_input_0;
extern int function_input_1;
extern int function_output;

int myFunction (int val0, int val1) {
	function_input_0 = val0;
	function_input_1 = val1;
	uneFonction();
	return function_output;
}

void main()
{
	int input;
	int ouptput;

	SimplePrint("Hello World !");

	for (input = 0; input < (1<<NBITS_INPUT); input++) {
		lprintf("%d,%d\r", input , myFunction (input, 0));	
	}
}
