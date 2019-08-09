

|Acronyme|Signification|
|--|--|
|APK| Android Package Kit|
|DSL| Domain Specific Language|
|JDK| Java Development Kit|
|JRE| Java Runtime Environment|
|NDK| Native Development Kit|

# Optenir le JDK et le JRE

Télécharger Java SE à partir du [site officiel](https://www.oracle.com/technetwork/java/javase/overview/index.html).

Choisir la version `.exe`

par exemple `jdk-12.0.2_windows-x64_bin.exe`

Ouvrir le fichier .exe avec 7-zip

A l'intérieur de ce fichier il faut trouver l'archive `tools.zip` et l'extraire du .exe.

* Dans une version x86 tools.zip se trouve directement à la racine de l'archive.
* Dans une version java 8 pur x64, cela se trouvera dans `.rsrc\1033\JAVA_CAB10\111\`
* Dans une version java 12 pour x64, le fichier tools.zip se trouve dans le répertoire `st.cab`

Une fois l'archive `tools.zip` extraite du .exe, la décompresser dans un répertoire `jdk`.

Ce répertoire jdk doit contenir un répertoire `bin` contenant, entre autre, les exécutables `java` et `javac`

il faut décompresser les .pack présents dans les répertoires  `jdk\jre\lib` et dans `jdk\lib`
par la commande:
```
for /r %f in (*.pack) do "%JAVA_HOME%\bin\unpack200.exe" -r -q "%f" "%~pf%~nf.jar"
```
qui applique récursivement la commande :
`"%JAVA_HOME%\bin\unpack200" -r -v rt.pack rt.jar`
à tous les `.pack` de l'arborescence.



# Obtenir un éditeur

Télécharger la community edition windows de IntelliJ IDEA au format `.zip`

Décompresser l'archive au même niveau que le répertoire jdk précédemment

# Obtenir le sdk Android

Aller sur la [page de téléchargement d'Android Studio](https://developer.android.com/studio#downloads) et choisir de ne télécharger que les `sdk tools only`

```
tools\bin\sdkmanager.bat --update
```

Commencer par l'installation d'une plateforme android.
```
tools\bin\sdkmanager.bat "platforms;android-25"
```

Pour installer les outils de construction:

```
tools\bin\sdkmanager.bat "build-tools;25.0.2"
```
Cela va créer un répertoire `build-tools` qui contiendra notamment les utilitaires:
* aapt.exe
* apksigner.bat
* dx.bat


Pour installer les outils de debug.
```
tools\bin\sdkmanager.bat "platform-tools"
```

Cela va créer un répertoire `platform-tools` contenant, entre autre, l'incontournable `adb.exe`


Pour allourdir le tout:
```
tools\bin\sdkmanager.bat "extras;google;m2repository" "extras;android;m2repository"
tools\bin\sdkmanager.bat --licenses
```

Pour plus d'information, consulter la [documentation du SDK Manager](https://developer.android.com/studio/command-line/sdkmanager)

# Git portable

[Télécharger la version portable de Git](https://git-scm.com/download/win)


# Gradle

Télécharger la dernière version de gradle à partir de [la page des versions Gradle](https://gradle.org/releases/)

Et décompresser le répertoire gradle-x.y.y au même niveau que le répertoire jdk précédemment.

Ajouter le chemin `gradle-x.y.y\bin` au PATH.

## Générer un wrapper

Avec la commande
`gradle wrapper`

Cela va générer les fichiers et répertoires suivants:

|fichier ou répertoire | description |
|--|--|
|.gradle\| |
|gradle| |
|gradlew et/ou gradlew.bat| le script shell permettant de lancer une construction avec le wrapper|
|graddle\wrapper\gradle-wrapper.jar| Le .jar contenant le code nécessaire au téléchargement de la distribution gradle |
|graddle\wrapper\gradle-wrapper.properties| Le fichier de propriétes permettant de configurer le Wrapper pour se comporter comme  |




## Ressources

[Setting Up IntelliJ](https://github.com/codepath/android_guides/wiki/Setting-up-IntelliJ-IDEA)

[how-to-install-a-portable-jdk-in-windows-without-admin-rights](https://www.whitebyte.info/programming/java/how-to-install-a-portable-jdk-in-windows-without-admin-rights)
