
## Description




## Configuration box

### Configurer une IP fixe pour le rpi.

configuration avancée / configuration réseau / DHCP


repérer l'adresse MAC du raspberry Pi et dans la partie adresse IP statique, lui affecter un nom et une adresse IP statique.

|nom| adresse IP | adresse MAC |
|--|--|--|
|\<HOSTNAME\>|\<LOCALIP\>|b8:27:eb:...:8e|

### Translater les ports entrants vers le rpi.


configuration avancée / configuration réseau / NAT/PAT

|app/ service|port interne|port externe|protocole|appareil|activer|
|--|--|--|--|--|--|
|SSH|22|\<PORTSSH\>|TCP+UDP|\<HOSTNAME\>|[x]|
|HTTP|80|\<PORTWEB\>|TCP+UDP|\<HOSTNAME\>|[x]|


### Configurer le parefeu pour autoriser les connexions entrantes

|app/service|protocole|port source|port dest|action|
|--|--|--|--|--|
|HTTP|TCP+UDP|\<PORTWEB\>|80|accepter|
|HTTPS|TCP||443|accepter|
| DNS | TCP | |53 | accepter|


## Tester

Lancer un serveur WEB

```
sudo python -m SimpleHTTPServer 80
```

Depuis une machine extérieure au réseau domestique, visiter la page web 

http://\<IPBOX\>:\<PORTWEB\>/


# RESSOURCES

https://www.techcoil.com/blog/how-to-deploy-python-3-flask-application-on-raspberry-pi-3-with-raspbian-stretch-lite-nginx-supervisor-virtualenv-and-gunicorn/


