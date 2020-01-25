

set DSTDIR=C:\Users\Public\Git\glOric

COPY alphabet.c %DSTDIR%\src\data
COPY traj.c %DSTDIR%\src\data
COPY geom.c %DSTDIR%\src\data

COPY atan2.s %DSTDIR%\src\math
COPY atan2test.py %DSTDIR%\tools
REM COPY bbuild.bat
REM COPY build.bat
COPY config.h %DSTDIR%\src
COPY config.inc %DSTDIR%\src
COPY decimal2bin.py %DSTDIR%\tools
COPY div.s %DSTDIR%\src\math
COPY externs.c %DSTDIR%\src
COPY fastatan.py %DSTDIR%\tools
COPY fastnorm.py %DSTDIR%\tools
COPY fastnorm2.py %DSTDIR%\tools
COPY optimizeLookUp.py %DSTDIR%\tools
COPY fillclip.py %DSTDIR%\tools
COPY glOric.h %DSTDIR%\src
COPY gloric.py %DSTDIR%\tools
COPY glOric.s %DSTDIR%\src
COPY glOric.asm %DSTDIR%\src
COPY caBuild.bat %DSTDIR%\src
COPY kernel.s %DSTDIR%\src
COPY line.s %DSTDIR%\src\raster
REM COPY line.asm %DSTDIR%\src\raster
COPY filler.s %DSTDIR%\src\raster
COPY hrsDrawing.c %DSTDIR%\src
COPY lrsDrawing.c %DSTDIR%\src
COPY hseg8.s %DSTDIR%\src
COPY fill8.s %DSTDIR%\src
COPY fill8.c %DSTDIR%\src
COPY fill16.c %DSTDIR%\src
COPY main.c %DSTDIR%\src
COPY hrsDemo.c %DSTDIR%\src
COPY lrsDemo.c %DSTDIR%\src
COPY txtDemo.c %DSTDIR%\src
COPY demo.c %DSTDIR%\src
COPY logic.c %DSTDIR%\src
COPY norm.s %DSTDIR%\src\math
COPY print.s %DSTDIR%\src\util
COPY root.s %DSTDIR%\src\math
COPY screen.s %DSTDIR%\src\util
COPY square.s %DSTDIR%\src\math


COPY buffer.s %DSTDIR%\src\raster
COPY display.s %DSTDIR%\src\raster
COPY line8.s %DSTDIR%\src\raster

COPY ..\..\algos.md %DSTDIR%\docs\
