
set PROJ=C:\Users\tbpk7658\Documents\Projets\hello-world\android\sources
set SDK_PATH=C:\Users\tbpk7658\Applis\ideaIC-2016.3\ideaIC-2016.3\sdk
set JDK_PATH=C:\Users\tbpk7658\Applis\ideaIC-2016.3\ideaIC-2016.3\jdk

%SDK_PATH%\build-tools\25.0.1\aapt.exe package -f -m -J %PROJ%/src -M %PROJ%/AndroidManifest.xml -S %PROJ%/res -I %SDK_PATH%\platforms\android-25\android.jar

%JDK_PATH%\bin\javac -source 1.7 -target 1.7 -d obj -classpath src -bootclasspath %SDK_PATH%\platforms\android-25\android.jar src/com/example/helloandroid/*.java


%SDK_PATH%\build-tools\25.0.1\dx.bat --dex --output=%PROJ%\bin\classes.dex %PROJ%\obj
