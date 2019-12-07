del /Q BUILD\*.*
del /Q %OSDK%\TMP\*.*
del /Q %OSDK%\Oricutron\OSDK.TAP


:: ECHO #file MAIN.BAS  1>>%OSDK%\TMP\mainOricTest.bas
:: TYPE MAIN.BAS  1>>%OSDK%\TMP\mainOricTest.bas
:: %OSDK%\BIN\Bas2Tap -b2t1 -color1 %OSDK%\TMP\mainOricTest.bas build\mainOricTest.tap

SET OSDKADDR=$550
SET OSDKNAME=glOric
SET OSDKFILE=glOric main

REM Preproc
%OSDK%\BIN\cpp.exe -lang-c++ -I %OSDK%\include -D__16BIT__ -D__NOFLOAT__ -DATMOS -DOSDKNAME_HWADVANCED -DOSDKVER=\"1.15\" -nostdinc main.c %OSDK%\TMP\main.c
REM compile
%OSDK%\BIN\compiler.exe -Nmain -O3 %OSDK%\TMP\main.c  1>%OSDK%\TMP\main.c2
REM Convert C to assembly code :
%OSDK%\BIN\cpp.exe  -lang-c++  -imacros %OSDK%\macro\macros.h  -DXA -traditional  -P %OSDK%\TMP\main.c2 %OSDK%\TMP\main.s
%OSDK%\BIN\macrosplitter.exe %OSDK%\TMP\main.s %OSDK%\TMP\main

:: %OSDK%\bin\xa glOric.s -o build\glOric.o
:: %OSDK%\bin\header -h1 -a0 build\glOric.o build\glOric.tap $6500


%OSDK%\BIN\link65.exe  -d %OSDK%\lib/ -o %OSDK%\TMP\linked.s  -f -q  %OSDK%\TMP\main glOric.s atan2.s div.s root.s square.s norm.s print.s line.s kernel.s
%OSDK%\BIN\xa.exe -W -C %OSDK%\TMP\linked.s -o build\final.out -e build\xaerr.txt -l build\symbols -bt %OSDKADDR% -DASSEMBLER=XA -DOSDKNAME_HWADVANCED

%OSDK%\BIN\header.exe  build\final.out build\%OSDKNAME%.tap %OSDKADDR%


%OSDK%\bin\taptap ren build\glOric.tap "glOric" 0

%OSDK%\BIN\header.exe  build\final.out build\%OSDKNAME%.tap %OSDKADDR%

COPY build\%OSDKNAME%.tap %OSDK%\Oricutron\OSDK.TAP  1>NUL

COPY build\symbols %OSDK%\Oricutron\symbols  1>NUL
PUSHD %OSDK%\Oricutron
.\oricutron.exe -t OSDK.TAP -s symbols
POPD
