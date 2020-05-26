

Copier les fichiers de configuration de [contrib/atmos.cfgs.zip]() vers le répertoire `cfg` de votre installation cc65

http://forum.defence-force.org/viewtopic.php?f=3&t=1905#p18553

Ajouter la ligne suivante:
```
__START_ADDRESS__: type = weak, value= $0501 ;
```
dans la section `SYMBOLS` 

```
SET OSDK="C:\Users\tbpk7658\Applis\osdk_1_15\Bin"

SET ORICDSK="C:\Users\tbpk7658\Applis\Oricutron\disks"
SET ORICUTRON="C:\Users\tbpk7658\Applis\Oricutron\"

ca65 -t atmos glOric.s -g -l glOric.lst -o glOric.o  --include-dir .
ar65 r glOric.lib glOric.o
ca65 -t atmos print.s -g -l print.lst -o print.o  --include-dir .
cc65 hello.c -g -o hello.s
ca65 -t atmos hello.s -g -l hello.lst -o hello.o --include-dir .
cl65 -o hello.bin -Cl -O -t atmos -C atmosc.cfg -m hello.map -Ln hello.vice hello.o glOric.o print.o
sed -re 's/al 00(.{4}) \.(.+)$$/\1 \2/' hello.vice | sort > %ORICUTRON%/symbols
%OSDK%\header hello.bin hello.bin $0501
%OSDK%\tap2dsk -ihello.com hello.bin hello.dsk
%OSDK%\old2mfm hello.dsk
COPY /Y hello.dsk %ORICDSK%
DEL *.o *.lib hello.s *.lst *.bin  *.dsk

```

