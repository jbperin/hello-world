

set DSTDIR=C:\Users\Public\Git\glOric

COPY alphabet.c %DSTDIR%\src\data
COPY traj.c %DSTDIR%\src\data

COPY atan2.s %DSTDIR%\src\math
COPY atan2test.py %DSTDIR%\tools
REM COPY bbuild.bat
REM COPY build.bat
COPY config.h %DSTDIR%\src
COPY decimal2bin.py %DSTDIR%\tools
COPY div.s %DSTDIR%\src\math
COPY externs.c %DSTDIR%\src
COPY fastatan.py %DSTDIR%\tools
COPY fastnorm.py %DSTDIR%\tools
COPY fastnorm2.py %DSTDIR%\tools
COPY optimizeLookUp.py %DSTDIR%\tools
COPY glOric.h %DSTDIR%\src
COPY gloric.py %DSTDIR%\tools
COPY glOric.s %DSTDIR%\src
COPY kernel.s %DSTDIR%\src
COPY line.s %DSTDIR%\src\raster
COPY main.c %DSTDIR%\src
COPY norm.s %DSTDIR%\src\math
COPY print.s %DSTDIR%\src\util
COPY root.s %DSTDIR%\src\math
COPY screen.s %DSTDIR%\src\util
COPY square.s %DSTDIR%\src\math


COPY buffer.s %DSTDIR%\src\raster
COPY display.s %DSTDIR%\src\raster
COPY line8.s %DSTDIR%\src\raster
