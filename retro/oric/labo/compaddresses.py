


LORES_SCREEN_ADDRESS= 0xBB80
HIRES_SCREEN_ADDRESS= 0xA000
LORES_SCREEN_WIDTH= 40
LORES_SCREEN_HEIGHT= 26
HIRES_SCREEN_WIDTH= 240
HIRES_SCREEN_HEIGHT= 200

INK_BLACK	= 0
INK_RED		= 1
INK_GREEN	= 2
INK_YELLOW	= 3
INK_BLUE	= 4
INK_MAGENTA	= 5
INK_CYAN	= 6
INK_WHITE	= 7

## Character Set modifier	
STANDARD_CHARSET =8 ##		Use Standard Charset	
ALTERNATE_CHARSET =9 ##		Use Alternate Charset	
DOUBLE_STANDARD_CHARSET  =10	##	Use Double Size Standard Charset	
DOUBLE_ALTERNATE_CHARSET =11 ##		Use Double Size Alternate Charset	
BLINKING_STANDARD_CHARSET =12 ##		Use Blinking Standard Charset	
BLINKING_ALTERNATE_CHARSET =13 ##		Use Blinking Alternate Charset	
DOUBLE_BLINK_STANDARD_CHARSET =14	##	Use Double Size Blinking Standard Charset	
DOUBLE_BLINK_ALTERNATE_CHARSET =15	##	Use Double Size Blinking Alternate Charset

## Change Paper (background) color
PAPER_BLACK = 16
PAPER_RED = 17
PAPER_GREEN = 18
PAPER_YELLOW = 19
PAPER_BLUE = 20
PAPER_MAGENTA = 21
PAPER_CYAN = 22
PAPER_WHITE = 23

## Video control attributes
TEXT_60Hz = 24
TEXT_50Hz = 26
HIRES_60Hz = 28
HIRES_50Hz = 30

STD_CHARSET_ADDRESS = 0xB400
ALT_CHARSET_ADDRESS = 0xB800
NB_STD_CHAR = 128
NB_ALT_CHAR = 112
NB_BYTES_PER_CHAR = 8

def isInStdCharset(addr):
    return (addr >= STD_CHARSET_ADDRESS) and (addr < STD_CHARSET_ADDRESS + NB_STD_CHAR*NB_BYTES_PER_CHAR)

def isInAltCharset(addr):
    return (addr >= ALT_CHARSET_ADDRESS) and (addr < ALT_CHARSET_ADDRESS + NB_ALT_CHAR*NB_BYTES_PER_CHAR)

def isInLoresMemory(addr):
    return (addr >= LORES_SCREEN_ADDRESS) and (addr < LORES_SCREEN_ADDRESS + LORES_SCREEN_WIDTH*LORES_SCREEN_HEIGHT)

def isInHiresMemory(addr):
    return (addr >= HIRES_SCREEN_ADDRESS) and (addr < HIRES_SCREEN_ADDRESS + LORES_SCREEN_WIDTH*HIRES_SCREEN_HEIGHT+40+2*LORES_SCREEN_WIDTH)

def asciiCodeOfCharAt(addr):
    if isInStdCharset(addr):
        return "STD code = %d, line=%d"%((addr-STD_CHARSET_ADDRESS)/NB_BYTES_PER_CHAR, (addr-STD_CHARSET_ADDRESS)%NB_BYTES_PER_CHAR)
    if isInAltCharset(addr):
        return "ALT code = %d, line=%d"%((addr-ALT_CHARSET_ADDRESS)/NB_BYTES_PER_CHAR, (addr-ALT_CHARSET_ADDRESS)%NB_BYTES_PER_CHAR)

def coordsOfCharAt(addr):
    if isInLoresMemory(addr):
        return "STD code = %d, line=%d"%((addr-STD_CHARSET_ADDRESS)/NB_BYTES_PER_CHAR, (addr-STD_CHARSET_ADDRESS)%NB_BYTES_PER_CHAR)
    if isInHiresMemory(addr):
        return "ALT code = %d, line=%d"%((addr-ALT_CHARSET_ADDRESS)/NB_BYTES_PER_CHAR, (addr-ALT_CHARSET_ADDRESS)%NB_BYTES_PER_CHAR)

def write_screen_memory():

    print("LORES ADDR:")
    for ii in range(LORES_SCREEN_HEIGHT):
        addr = LORES_SCREEN_ADDRESS+(ii*LORES_SCREEN_WIDTH)+0
        if (isInStdCharset(addr) or isInAltCharset(addr)):
            print(ii, "%x"%addr, asciiCodeOfCharAt(addr))

    print("HIRES ADDR:")
    for ii in range (HIRES_SCREEN_HEIGHT):
        addr1 = HIRES_SCREEN_ADDRESS+(ii*LORES_SCREEN_WIDTH)+1
        if (isInStdCharset(addr1) or isInAltCharset(addr1)):
            print(ii, "%x"%addr1, asciiCodeOfCharAt(addr1))
        addr2 = HIRES_SCREEN_ADDRESS+(ii*LORES_SCREEN_WIDTH)+2
        if (isInStdCharset(addr2) or isInAltCharset(addr2)):
            print(ii, "%x"%addr2, asciiCodeOfCharAt(addr2))



def main():
    print ('coucou')
    write_screen_memory()


if __name__ == '__main__':
    main()
