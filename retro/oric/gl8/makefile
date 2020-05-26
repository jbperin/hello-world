
.SUFFIXES: 
.SUFFIXES: .s .c

PATH_TO_ORICUTRON="C:\Users\tbpk7658\Applis\Oricutron"

LIBNAME=glOric
PROGNAME=hello

PLATFORM=atmos

OSDK="C:\Users\tbpk7658\Applis\osdk_1_15\bin"
XA=$(OSDK)/xa.exe

AS=ca65
ASFLAGS=-t$(PLATFORM) -g --include-dir .

CC=cc65
CFLAGS= -g 

AR=ar65
ARFLAGS=r

LD=cl65
#LDFLAGS=-v -vm -g -t$(PLATFORM) 
LDFLAGS= -t$(PLATFORM) -Cl -O -C atmosc.cfg
#SRC_ASM= camera.asm temp.asm fill8.asm zbuff.asm hzfill.asm projection.asm projectPoint.asm scene.asm
#SRC_C= glOric_c.c
#OBJS= $(SRC_ASM:.asm=.o) $(SRC_C:.c=.o)

%.o: %.s
	$(AS) $(ASFLAGS) $^ -l $(@:.o=.lst) -o $@

%.s: %.c
	$(CC) $(CFLAGS) $^ -o $@

#%.o: %.c
#	$(CC) $(CFLAGS) $^ -o $@

#%.asm: %.s
#	$(XA) -v -R -cc -e error.txt -l xa_labels.txt $^ -o $(@:.asm=.o)
#	co65 $(@:.asm=.o) -o $@
#	rm -f $(@:.asm=.o)
	
	#$(XA) -v -R -cc -e error.txt -l xa_labels.txt -DTARGET_ORIX -DSAVE_ZERO_PAGE glOric_s.s -o glOric_s.o
	#co65 glOric_s.o -o glOric_s.asm
#%.o: %.asm
#	$(AS) $(ASFLAGS) $^ -l $(@:.o=.lst) -o $@

#GL: glOric_s.o start.o
#	$(LD) -m GL.map -Ln GL.vice $(LDFLAGS) start.o glOric_asm.o -o GL.tap
#	sed -re 's/al 00(.{4}) \.(.+)$$/\1 \2/' GL.vice | sort > $(PATH_TO_ORICUTRON)/symbols
#	cp GL.tap $(PATH_TO_ORICUTRON)/usbdrive/bin/d
#	cd $(PATH_TO_ORICUTRON) && ./oricutron.exe -s symbols &
#	cd -

#	cl65 -g -o GL -DTARGET_ORIX -DSAVE_ZERO_PAGE -ttelestrat start.c glOric_s.asm
#	cp GL $(PATH_TO_ORICUTRON)\usbdrive\bin\

$(PROGNAME).dsk: hello.o glOric.o print.o
	$(LD) -m $(@:.dsk=.map) -Ln $(@:.dsk=.vice) $(LDFLAGS) $^  -o $(@:.dsk=.bin)
	sed -re 's/al 00(.{4}) \.(.+)$$/\1 \2/' $(@:.dsk=.vice) | sort > $(PATH_TO_ORICUTRON)/symbols
	$(OSDK)/header.exe $(@:.dsk=.bin) $(@:.dsk=.bin) 1280
	$(OSDK)/tap2dsk.exe -i$(@:.dsk=.com) $(@:.dsk=.bin) $@
	$(OSDK)/old2mfm.exe $@

	cp $@ $(PATH_TO_ORICUTRON)/disks


all: $(PROGNAME).dsk

test: $(PROGNAME).dsk
	cp $^ $(PATH_TO_ORICUTRON)\disks
	cd $(PATH_TO_ORICUTRON) && ./oricutron.exe -s symbols &
	cd -

# $(SRC_C:.c=.asm)

clean:
	rm -f *.o *.lib hello.s *.lst *.bin  *.dsk

