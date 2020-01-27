
del /Q BUILD\*.*
del /Q %OSDK%\TMP\*.*
del /Q %OSDK%\Oricutron\OSDK.TAP

SET OSDKNAME=GLORIC

ECHO #file main.bas  1>>%OSDK%\TMP\main.bas

TYPE main.BAS  1>>%OSDK%\TMP\main.bas

%OSDK%\BIN\Bas2Tap -b2t1 -color1 %OSDK%\TMP\main.bas build\%OSDKNAME%.tap

COPY build\%OSDKNAME%.tap %OSDK%\Oricutron\OSDK.TAP  1>NUL

PUSHD %OSDK%\Oricutron

START .\oricutron.exe -t OSDK.TAP -s symbols

POPD
