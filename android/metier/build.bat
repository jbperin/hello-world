set PROJ=C:\Users\tbpk7658\Documents\myCode\android\metier
REM set SDK_PATH=C:\Users\tbpk7658\Applis\ideaIC-2016.3\ideaIC-2016.3\sdk
set JDK_PATH=C:\Users\tbpk7658\Applis\ideaIC-2016.3\ideaIC-2016.3\jdk


%JDK_PATH%\bin\javac -source 1.7 -target 1.7 -d obj -classpath "libs\mqtt-client-0.4.0.jar;libs\gson-2.8.5.jar" src\com\jibe\itfmqtt\*.java src\com\jibe\lomodel\*.java
cd obj
%JDK_PATH%\bin\jar cf ..\metier.jar *
cd ..
