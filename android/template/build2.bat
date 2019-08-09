
@if "%DEBUG%" == "" @echo off

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.

set PROJ=%DIRNAME%
set SDK_PATH=C:\Users\tbpk7658\Applis\Java
set JDK_PATH=%SDK_PATH%\jdk
set JAVA_HOME=%SDK_PATH%\jdk

set BUILD_TOOLS_VERSION=25.0.1
set ANDROID_PLATFORM=android-25

REM %SDK_PATH%\build-tools\%BUILD_TOOLS_VERSION%\aapt2.exe package -f -m -J %PROJ%\src -M %PROJ%\AndroidManifest.xml --dir %PROJ%\res -I %SDK_PATH%\platforms\%ANDROID_PLATFORM%\android.jar
%SDK_PATH%\build-tools\%BUILD_TOOLS_VERSION%\aapt2.exe compile -o foo.ap_ --dir %PROJ%\res


%SDK_PATH%\build-tools\%BUILD_TOOLS_VERSION%\aapt2.exe link -o %PROJ%\bin\hello.unaligned.apk --manifest %PROJ%\AndroidManifest.xml -I %SDK_PATH%\platforms\%ANDROID_PLATFORM%\android.jar -R foo.ap_ --java src --auto-add-overlay

%JDK_PATH%\bin\javac -source 1.7 -target 1.7  -d obj -classpath "src;libs\gson-2.8.5.jar" -bootclasspath %SDK_PATH%\platforms\%ANDROID_PLATFORM%\android.jar src\com\example\helloandroid\*.java


REM -> CALL %SDK_PATH%\build-tools\%BUILD_TOOLS_VERSION%\dx.bat --dex --output=%PROJ%\bin\classes.dex %PROJ%\libs\*.jar %PROJ%\obj

REM -> %SDK_PATH%\build-tools\%BUILD_TOOLS_VERSION%\aapt2.exe package -f -m -F %PROJ%\bin\hello.unaligned.apk -M %PROJ%\AndroidManifest.xml -S %PROJ%\res -I %SDK_PATH%\platforms\%ANDROID_PLATFORM%\android.jar

REM -> copy %PROJ%\bin\classes.dex .

REM -> %SDK_PATH%\build-tools\%BUILD_TOOLS_VERSION%\aapt2.exe add %PROJ%\bin\hello.unaligned.apk classes.dex

REM %JDK_PATH%\bin\keytool.exe -genkeypair -validity 365 -keystore mykey.keystore -keyalg RSA -keysize 2048

REM -> CALL %SDK_PATH%\build-tools\%BUILD_TOOLS_VERSION%\apksigner.bat sign --ks thekey.keystore %PROJ%\bin\hello.unaligned.apk

REM -> %SDK_PATH%\build-tools\%BUILD_TOOLS_VERSION%\zipalign.exe -f 4 %PROJ%\bin\hello.unaligned.apk %PROJ%\bin\hello.apk

DEL %PROJ%\obj\com\example\helloandroid\*.class
REM -> DEL %PROJ%\bin\classes.dex
DEL %PROJ%\bin\hello.unaligned.apk
REM DEL %PROJ%\src\com\example\helloandroid\R.java
REM -> DEL classes.dex
