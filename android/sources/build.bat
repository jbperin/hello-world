
set PROJ=C:\Users\tbpk7658\Documents\Projets\hello-world\android\sources
set SDK_PATH=C:\Users\tbpk7658\Applis\ideaIC-2016.3\ideaIC-2016.3\sdk
set JDK_PATH=C:\Users\tbpk7658\Applis\ideaIC-2016.3\ideaIC-2016.3\jdk

%SDK_PATH%\build-tools\25.0.1\aapt.exe package -f -m -J %PROJ%\src -M %PROJ%\AndroidManifest.xml -S %PROJ%\res -I %SDK_PATH%\platforms\android-25\android.jar

%JDK_PATH%\bin\javac -source 1.7 -target 1.7 -d obj -classpath "src;libs\mqtt-client-0.4.0.jar;libs\gson-2.8.5.jar;libs\metier.jar" -bootclasspath %SDK_PATH%\platforms\android-25\android.jar src\com\example\helloandroid\*.java

CALL %SDK_PATH%\build-tools\25.0.1\dx.bat --dex --output=%PROJ%\bin\classes.dex %PROJ%\obj %PROJ%\libs\*.jar

%SDK_PATH%\build-tools\25.0.1\aapt.exe package -f -m -F %PROJ%\bin\hello.unaligned.apk -M %PROJ%\AndroidManifest.xml -S %PROJ%\res -I %SDK_PATH%\platforms\android-25\android.jar

copy %PROJ%\bin\classes.dex .

%SDK_PATH%\build-tools\25.0.1\aapt.exe add %PROJ%\bin\hello.unaligned.apk classes.dex

REM %JDK_PATH%\bin\keytool.exe -genkeypair -validity 365 -keystore mykey.keystore -keyalg RSA -keysize 2048

CALL %SDK_PATH%\build-tools\25.0.1\apksigner.bat sign --ks thekey.keystore %PROJ%\bin\hello.unaligned.apk

%SDK_PATH%\build-tools\25.0.1\zipalign.exe -f 4 %PROJ%\bin\hello.unaligned.apk %PROJ%\bin\hello.apk

DEL %PROJ%\obj\com\example\helloandroid\*.class
DEL %PROJ%\bin\classes.dex
DEL %PROJ%\bin\hello.unaligned.apk
DEL %PROJ%\src\com\example\helloandroid\R.java
DEL classes.dex
