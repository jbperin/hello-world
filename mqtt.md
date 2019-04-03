

## En Python


```shell
C:\Windows\system32>pip3 install paho-mqtt
```

```
virtualenv paho-mqtt
source paho-mqtt/bin/activate
pip install paho-mqtt
```

## En Java


Télécharger la librairie `org.eclipse.paho.client.mqttv3-1.2.1.jar` depuis le site:

https://search.maven.org/search?q=a:org.eclipse.paho.client.mqttv3

Dans IntelliJ, créer un nouveau projet 

`File -> New Project, Java, Create from Template -> Command Line App`


```java

package com.jibe;

public class Main {

    public static void main(String[] args) {
        System.out.println ("HelloWorld");
    }
}

```

Ajouter la librairie paho au projet:

`File -> Project Structure -> Project Settings -> Libraries`


# Ressources

https://www.eclipse.org/paho/clients/java/

https://www.eclipse.org/paho/clients/python/


