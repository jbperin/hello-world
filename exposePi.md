
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


### Configurer le parefeu pour autoriser

Etape *non nécessaire* pour exposer le RPI. Le firewal de la box peut être laissé sur le niveau de sécurité Moyen.
Si le firewall est mis au niveau Personalisé, les sessions FTP sortante ne fonctionnent pas. Même si le port FTP est déclaré dans les règles du firewall.

|app/service|protocole|port source|port dest|action|
|--|--|--|--|--|--|
|HTTP|TCP+UDP|8080|80|accepter|--|
|HTTPS|TCP||443|accepter|--|
|DNS|TCP+UDP||53|accepter|--|
|xrdp|TCP+UDP|3389|3389|accepter|--|
