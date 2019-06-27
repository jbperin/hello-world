

# Les sources

Se placer dans le répertoire du projet et créer la structure projet avec les commandes suivantes:

```
mkdir src\com\example\helloandroid
mkdir obj
mkdir bin
mkdir res\layout
mkdir res\values
mkdir res\drawable
mkdir libs
```

Dans le fichier `src\com\example\helloandroid\MainActivity.java`

```java
package com.example.helloandroid;

import android.app.Activity;
import android.os.Bundle;

public class MainActivity extends Activity {
   @Override
   protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
   }
}
```

Dans le fichier `res\values\strings.xml`

```xml
<resources>
   <string name="app_name">A Hello Android</string>
   <string name="hello_msg">Hello Android!</string>
   <string name="menu_settings">Settings</string>
   <string name="title_activity_main">MainActivity</string>
</resources>
```

Dans le fichier `res/layout/activity_main.xml`

```xml
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools"
   android:layout_width="match_parent"
   android:layout_height="match_parent" >

   <TextView
      android:layout_width="wrap_content"
      android:layout_height="wrap_content"
      android:layout_centerHorizontal="true"
      android:layout_centerVertical="true"
      android:text="@string/hello_msg"
      tools:context=".MainActivity" />
</RelativeLayout>
```


Dans le fichier `AndroidManifest.xml`

```xml
<?xml version='1.0'?>
<manifest xmlns:a='http://schemas.android.com/apk/res/android' package='com.example.helloandroid' a:versionCode='0' a:versionName='0'>
    <application a:label='A Hello Android'>
        <activity a:name='com.example.helloandroid.MainActivity'>
             <intent-filter>
                <category a:name='android.intent.category.LAUNCHER'/>
                <action a:name='android.intent.action.MAIN'/>
             </intent-filter>
        </activity>
    </application>
</manifest>
```

Préparer la partie métier de l'application en construisant l'archive `metier.jar` grâce au script [metier/build.bat](metier/build.bat) et en la placant dans le répetoire `sources/libs` avec les autres dépendances.

Générer un certificat avec l'utilitaire [auto.py](tools/auto.py) et placer ce certificat dans `sources\thekey.keystore`

Compiler avec [sources/build.bat](sources/build.bat)



## Utiliser Orange Nura pour débugger

### Première utilisation  
Brancher le Orange Nura sur un port USB
Sur le Téléphone, cliquer sur `Connecté en tant qu'appareil multimedia` et sélectionner le protocole MTP.

Un disque dur apparaît. Aller dans le répertroire  Driver et exécuter DriverInstaller.exe

Pour pouvoir utiliser adb il faut disposer du driver usb android qui vient avec l'application [Smart Suite](http://www.alcatel-mobile.com/fr/support/smartsuite/list)

### Installation de l'apk

Pour installer l'apk, utiliser la commande:
```
%ANDROID_HOME%\platform-tools\adb install ./bin/hello.apk
```

L'application peut etre lancée par la commande:
```
%ANDROID_HOME%\platform-tools\adb shell am start -a android.intent.action.MAIN -n com.example.helloandroid/com.example.helloandroid.MainActivity
```

# Ressources

[How to make Android apps without IDE from command line](https://medium.com/@authmane512/how-to-build-an-apk-from-command-line-without-ide-7260e1e22676)
