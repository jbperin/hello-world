

set DSTDIR=C:\Users\Public\Git\glOric

COPY src\data\alphabet.c %DSTDIR%\src\data
COPY src\data\traj.c %DSTDIR%\src\data
COPY src\data\geom.c %DSTDIR%\src\data

COPY src\math\atan2.s %DSTDIR%\src\math
COPY tools\atan2test.py %DSTDIR%\tools
REM COPY bbuild.bat
REM COPY build.bat
COPY src\config.h %DSTDIR%\src
COPY src\config.inc %DSTDIR%\src
COPY tools\decimal2bin.py %DSTDIR%\tools
COPY src\math\div.s %DSTDIR%\src\math
COPY src\externs.c %DSTDIR%\src
COPY tools\fastatan.py %DSTDIR%\tools
COPY tools\fastnorm.py %DSTDIR%\tools
COPY tools\fastnorm2.py %DSTDIR%\tools
COPY tools\optimizeLookUp.py %DSTDIR%\tools
COPY tools\fillclip.py %DSTDIR%\tools
COPY src\glOric.h %DSTDIR%\src
COPY tools\gloric.py %DSTDIR%\tools
COPY src\glOric.s %DSTDIR%\src
COPY src\glOric.asm %DSTDIR%\src
COPY src\caBuild.bat %DSTDIR%\src
COPY src\kernel.s %DSTDIR%\src
COPY src\raster\line.s %DSTDIR%\src\raster
REM COPY line.asm %DSTDIR%\src\raster
COPY src\raster\filler.s %DSTDIR%\src\raster
COPY src\render\hrsDrawing.c %DSTDIR%\src\render
COPY src\render\lrsDrawing.c %DSTDIR%\src\render
COPY src\raster\hseg8.s %DSTDIR%\src\raster
COPY src\raster\fill8.s %DSTDIR%\src\raster
COPY src\raster\bresfill.c %DSTDIR%\src\raster
COPY src\raster\fill16.c %DSTDIR%\src\raster
COPY src\main.c %DSTDIR%\src
COPY src\hrsDemo.c %DSTDIR%\src
COPY src\lrsDemo.c %DSTDIR%\src
COPY src\txtDemo.c %DSTDIR%\src
COPY src\demo.c %DSTDIR%\src
COPY src\logic.c %DSTDIR%\src
COPY src\math\norm.s %DSTDIR%\src\math
COPY src\util\print.s %DSTDIR%\src\util
COPY src\math\root.s %DSTDIR%\src\math
COPY src\util\screen.s %DSTDIR%\src\util
COPY src\math\square.s %DSTDIR%\src\math


COPY src\raster\buffer.s %DSTDIR%\src\raster
COPY src\util\display.s %DSTDIR%\src\util
COPY src\raster\line8.s %DSTDIR%\src\raster

COPY docs\algos.md %DSTDIR%\docs
