
del /Q BUILD\*.*
del /Q %OSDK%\TMP\*.*
del /Q %OSDK%\Oricutron\OSDK.TAP
::
:: Set the build paremeters
::
SET OSDKADDR=$800
SET OSDKNAME=GLORIC
SET OSDKFILE=gl main print

REM :=========================: 
REM BASIC 
REM :=========================: 
ECHO #file MAIN.BAS  1>>%OSDK%\TMP\glOricTest.bas
TYPE MAIN.BAS  1>>%OSDK%\TMP\glOricTest.bas

%OSDK%\BIN\Bas2Tap -b2t1 -color1 %OSDK%\TMP\glOricTest.bas build\glOricTest.tap

REM :=========================: 
REM C 
REM :=========================: 

REM Preproc
%OSDK%\BIN\cpp.exe -lang-c++ -I %OSDK%\include -D__16BIT__ -D__NOFLOAT__ -DATMOS -DOSDKNAME_HWADVANCED -DOSDKVER=\"1.15\" -nostdinc gl.c %OSDK%\TMP\gl.c

REM compile
%OSDK%\BIN\compiler.exe -Nmain -O3 %OSDK%\TMP\gl.c  1>%OSDK%\TMP\gl.c2

REM Convert C to assembly code :

%OSDK%\BIN\cpp.exe  -lang-c++  -imacros %OSDK%\macro\macros.h  -DXA -traditional  -P %OSDK%\TMP\gl.c2 %OSDK%\TMP\gl.s

%OSDK%\BIN\macrosplitter.exe %OSDK%\TMP\gl.s %OSDK%\TMP\gl

REM :=========================: 
REM ASSEMBLY 
REM :=========================: 

XCOPY /Y /T print.S %OSDK%\TMP\

COPY print.S %OSDK%\TMP\print.s /Y  1>NUL

::XCOPY /Y /T glOric.s %OSDK%\TMP\

::COPY glOric.s %OSDK%\TMP\glOric.s /Y  1>NUL
%OSDK%\bin\xa glOric.s -o build\glOric.o

%OSDK%\bin\header -h1 -a0 build\glOric.o build\glOric.tap $6500

REM :=========================: 
REM LINK
REM :=========================: 

XCOPY /Y /T print.S %OSDK%\TMP\

%OSDK%\BIN\link65.exe  -d %OSDK%\lib/ -o %OSDK%\TMP\linked.s  -f -q  %OSDK%\TMP\gl  print.s glOric.s

%OSDK%\BIN\xa.exe -W -C %OSDK%\TMP\linked.s -o build\final.out -e build\xaerr.txt -l build\symbols -bt %OSDKADDR% -DASSEMBLER=XA -DOSDKNAME_HWADVANCED

%OSDK%\bin\taptap ren build\glOricTest.tap "Test" 0

%OSDK%\bin\taptap ren build\glOric.tap "glOric" 0



%OSDK%\BIN\header.exe  build\final.out build\%OSDKNAME%.tap %OSDKADDR%

%OSDK%\bin\tap2dsk -iCLS:TEST build\glOricTest.TAP build\glOric.tap build\glOricTest.dsk

%OSDK%\bin\old2mfm build\glOricTest.dsk

%OSDK%\BIN\taptap.exe ren build\%OSDKNAME%.tap %OSDKNAME% 0


::ECHO #file main.bas  1>>%OSDK%\TMP\main.bas

::TYPE main.bas  1>>%OSDK%\TMP\main.bas

::%OSDK%\BIN\Bas2Tap -b2t1 -color1 %OSDK%\TMP\main.bas build\%OSDKNAME%.tap
REM :=========================: 
REM RUN 
REM :=========================: 

COPY build\glOricTest.DSK %OSDK%\Oricutron\OSDK.DSK  1>NUL
COPY build\symbols %OSDK%\Oricutron\symbols  1>NUL

PUSHD %OSDK%\Oricutron
START oricutron.exe -d OSDK.DSK -s symbols
POPD

::COPY build\%OSDKNAME%.tap %OSDK%\Oricutron\OSDK.TAP  1>NUL

COPY build\symbols %OSDK%\Oricutron\symbols  1>NUL

PUSHD %OSDK%\Oricutron

.\oricutron.exe -t OSDK.TAP -s symbols

POPD