//
// TEST_3
//
// This is a "HELLO WORLD" sample using
// an assembly code routine to display
// the message
//


// Declare the assembly code function
void SimplePrint(const char *ptr_message);

extern void uneFonction();
extern int function_input;
extern int function_output;

int mysqrt (int val) {
	function_input = val;
	uneFonction();
	return function_output;
}

void main()
{
	int input;
	int ouptput;

	SimplePrint("Hello World !");
	input = 3;
	for (input = 0; input < (1<<11); input++) {
		lprintf("%d,%d\r", input , mysqrt (input));	
	}
}
