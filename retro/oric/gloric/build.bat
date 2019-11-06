
del /Q BUILD\*.*
del /Q %OSDK%\TMP\*.*
del /Q %OSDK%\Oricutron\OSDK.TAP
::
:: Set the build paremeters
::
SET OSDKADDR=$800
SET OSDKNAME=GLORIC
SET OSDKFILE=gl main print


REM Preproc
%OSDK%\BIN\cpp.exe -lang-c++ -I %OSDK%\include -D__16BIT__ -D__NOFLOAT__ -DATMOS -DOSDKNAME_HWADVANCED -DOSDKVER=\"1.15\" -nostdinc gl.c %OSDK%\TMP\gl.c

REM compile
%OSDK%\BIN\compiler.exe -Nmain -O3 %OSDK%\TMP\gl.c  1>%OSDK%\TMP\gl.c2

REM Convert C to assembly code :

%OSDK%\BIN\cpp.exe  -lang-c++  -imacros %OSDK%\macro\macros.h  -DXA -traditional  -P %OSDK%\TMP\gl.c2 %OSDK%\TMP\gl.s

%OSDK%\BIN\macrosplitter.exe %OSDK%\TMP\gl.s %OSDK%\TMP\gl

XCOPY /Y /T print.S %OSDK%\TMP\

COPY print.S %OSDK%\TMP\print.s /Y  1>NUL

%OSDK%\BIN\link65.exe  -d %OSDK%\lib/ -o %OSDK%\TMP\linked.s  -f -q  %OSDK%\TMP\gl  print.s

%OSDK%\BIN\xa.exe -W -C %OSDK%\TMP\linked.s -o build\final.out -e build\xaerr.txt -l build\symbols -bt %OSDKADDR% -DASSEMBLER=XA -DOSDKNAME_HWADVANCED

%OSDK%\BIN\header.exe  build\final.out build\%OSDKNAME%.tap %OSDKADDR%

%OSDK%\BIN\taptap.exe ren build\%OSDKNAME%.tap %OSDKNAME% 0


::ECHO #file main.bas  1>>%OSDK%\TMP\main.bas

::TYPE main.bas  1>>%OSDK%\TMP\main.bas

::%OSDK%\BIN\Bas2Tap -b2t1 -color1 %OSDK%\TMP\main.bas build\%OSDKNAME%.tap

COPY build\%OSDKNAME%.tap %OSDK%\Oricutron\OSDK.TAP  1>NUL

COPY build\symbols %OSDK%\Oricutron\symbols  1>NUL

PUSHD %OSDK%\Oricutron

.\oricutron.exe -t OSDK.TAP -s symbols

POPD