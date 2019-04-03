

# Système


```
sudo raspi-config
```


```
sudo vi /etc/adduser.conf 
sudo deluser -remove-home pi
sudo passwd <username>
su - <username>
```

```
sudo apt-cache search games
sudo apt-get install openarena
```


```
sudo tail -f /var/log/auth.log
```

## Gestion des interfaces réseau

```
sudo ifconfig wlan0 down
sudo ifconfig wlan0 up
```
## Gestion des services

```
sudo service --status-all
```


# SSH



```

sudo apt install openssh-server
sudo vi /etc/ssh/sshd_config
```

```
Port 22

LogLevel VERBOSE

PermitRootLogin no
#StrictModes yes
#MaxAuthTries 6
MaxSessions 3

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication no
PermitEmptyPasswords no


UsePAM no

X11Forwarding yes

```



```
sudo systemctl restart ssh

sudo systemctl status ssh

cat id_rsa.pub >> ~/.ssh/authorized_keys

sudo service ssh reload
```


```
ssh-keygen.exe -t rsa -C "" -b 4096 
```
```
sudo nc -l -p  2200 > id_pub.rsa.key

nc 192.168.1.15 2200 < .ssh/id_rsa.pub
ssh -Y <user>@192.168.1.15
```



# XRDP

```
sudo apt-get install xrdp
sudo service xrdp stop
```

# RDESKTOP

```
sudo apt-get install rdesktop
rdesktop <IP_DEST>:3389
```


# FAIL2BAN

```
sudo apt-get install fail2ban
sudo vi /etc/ssh/sshd_config /etc/fail2ban/filter.d/sshd.conf /etc/fail2ban/jail.local
sudo iptables --list

sudo fail2ban-client set ssh unbanip 192.168.1.30
sudo fail2ban-client status
sudo service fail2ban restart

```


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
Script pour publier l'adresse de sa box sur un serveur ftp

```python 
#!/usr/bin/python

IP_FILE="homeip.txt"
FTP_SERVER=''
FTP_LOGIN=''
FTP_PASSWD=''
WEB_URL=""

# Retrieve Internet Box's Ip address from whatip.com
import urllib.request
contents = urllib.request.urlopen("http://www.whatip.com").read()

import re
result=re.compile(">([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})<").search(str(contents))
strCurrentIp=result.group(1)

print ("current IP = %s."%(strCurrentIp))


# Retrieve Former Internet Box's Ip address from web site
import urllib.request
contents = urllib.request.urlopen(WEB_URL+"/"+IP_FILE).read()

import re
result=re.compile("([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})").search(str(contents))
strPreviousIp=result.group(1)

print ("saved IP = %s."%(strPreviousIp))


if (strCurrentIp != strPreviousIp) :
    
    print ("IP address Out-of-date .. ")
    
    # write IP String to local file
    with open(IP_FILE, "w") as text_file:
        text_file.write(strCurrentIp)


    print ("FTP updating ")

    # transfert IP File to 
    import ftplib 
    with ftplib.FTP(FTP_SERVER) as ftp:
        try:    
            ftp.login(FTP_LOGIN, FTP_PASSWD)
            print ("\tLogged In. Deleting old ipfile.")
            
            try:
                ftp.delete(IP_FILE)
                print ("\told ipfile deleted.")
            except ftplib.error_perm as e:
                print('FTP delete error:', e) 
                pass

            print ("\tUploading new ipfile")
            with open(IP_FILE, 'rb') as fp:
                res = ftp.storlines("STOR " + IP_FILE, fp)
                
            print ("\tQuiting FTP...")
            ftp.quit()
            
            print ('\tClosing FTP connection')
            ftp.close()
            
        except ftplib.all_errors as e:
            print('FTP error:', e) 

else:
    print ("IP address up-to-date ..  No need to update")


```


# JEUX

## GNUGO

```
gnugo -l game.sgf -L 2

```
```
gnugo --mode ascii --level 10 -o game.sgf --boardsize 9 --color white --handicap 0
gnugo -l game.sgf --mode ascii  --replay black --printboard
gnugo -l 2018-12-27-White-0.5.sgf --score finish
```

## DOOMSLIKE


```

chocolate-doom -iwad /home/perin/Downloads/DOOM1.WAD 
chocolate-doom-setup -iwad /home/perin/Downloads/DOOM1.WAD
chocolate-heretic-setup -iwad /home/perin/Downloads/HERETIC.WAD
```
