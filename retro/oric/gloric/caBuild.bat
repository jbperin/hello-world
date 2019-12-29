
ca65 -tatmos glOric.asm -o glOric.o  --include-dir .
cl65 -C linker.cfg  -tatmos demo.c glOric.o -o toto.tap
copy toto.tap C:\Users\Public\osdk_1_15\Oricutron\tapes

PUSHD C:\Users\Public\osdk_1_15\Oricutron
.\oricutron.exe -t tapes\toto.tap
POPD

