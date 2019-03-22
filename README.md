
# tutorial github

## Gestion  des credentials dans Git
```
git config --global user.name "jbperin"
git config --global user.email "jbperin@users.noreply.github.com"
```

## Gestion des credentials dans Git

Sous windows, pour stocker les credentials:
```
git config --global credential.helper wincred
```
Pour les stocker sur linux :
```
git config --global credential.helper store 
```
NB : je n'arrive pas à faire marcher --file ~/.my-credentials

## Récupération d'une repo Git

```
git clone https://github.com/jbperin/hello-world.git

git pull

git add README.md

git commit -m "Add a few git tips"

git push
```


essai de modif pour tester le pull request
```python 
import os, sys
import platform

runLocal = False

def main(argv):

    sys.stdout.write('OS       :' + os.name+'\n')
    sys.stdout.write('platform :' + sys.platform+'\n')
    sys.stdout.write('system   :' + platform.system()+'\n')
    sys.stdout.write('node     :' + platform.node()+'\n')
    sys.stdout.write('release  :' + platform.release()+'\n')
    sys.stdout.write('version  :' + platform.version()+'\n')
    sys.stdout.write('machine  :' + platform.machine()+'\n')
    sys.stdout.write('processor:' + platform.processor()+'\n')
    #i=1/0
    if sys.platform == 'linux-armv7l':
        import sl4a
        droid = sl4a.Android()
        print(dir(droid))
        #droid.ttsSpeak('Je suis sur un tel android')

    sys.stdout.write("FIN\n")
```





