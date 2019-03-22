

# Système

```
sudo deluser -remove-home pi

sudo tail -f /var/log/auth.log
```

## Gestion des interfaces réseau

```
sudo ifconfig wlan0 down
sudo ifconfig wlan0 up
```

# XRDP

```
sudo apt-get install xrdp
sudo service xrdp stop
```

# FAIL2BAN

```
sudo apt-get install fail2ban
sudo vi /etc/ssh/sshd_config /etc/fail2ban/filter.d/sshd.conf /etc/fail2ban/jail.local
```


# SSH



```

sudo apt install openssh-server
sudo vi /etc/ssh/sshd_config
sudo systemctl restart ssh

sudo systemctl status ssh

cat id_rsa.pub >> ~/.ssh/authorized_keys

sudo service ssh reload
```



# Git &  github



# Git &  github

## Configuration de base GitHub
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

# PYTHON

https://git-scm.com/book/fr/v2/Utilitaires-Git-Stockage-des-identifiants
```
sudo python -m SimpleHTTPServer 80
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





