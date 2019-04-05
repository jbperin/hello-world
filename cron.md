


# System CRON


## Les fichiers à connaître

|fichier|description|
|--|--|
|`/etc/crontab`||
|`/etc/cron.d`||
|`/etc/cron.daily`|apt-compat  aptitude  bsdmainutils  dpkg  logrotate  man-db  passwd|
|`/etc/cron.hourly`|fake-hwclock|
|`/etc/cron.monthly`||
|`/etc/cron.weekly`|man-db|
|`/var/spool/cron/crontabs/<USER>`|crontab de l'utilisateur `<USER>`|


## Commandes de base

Lister les tâches enregister dans le system CRON
```
crontab -l
```

Consulter l'état du service CRON
```
sudo service cron status
```

Editer la liste des tâches périodiques

```bash
export EDITOR=vi
crontab -e
```

## Syntaxe des commandes de base


Voici de manière schématique la syntaxe à respecter d'un crontab:

```
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  *  user command to be executed
```


Le fichier crontab la syntaxe suivante pour décrire la planification des tâches:

```bash
mm hh jj MMM JJJ [user] tâche > log
```

avec:
* `mm` : minutes (00-59).
* `hh` : heures (00-23) .
* `jj` : jour du mois (01-31).
* `MMM` : mois (01-12 ou abréviation anglaise sur trois lettres : jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec).
* `JJJ` : jour de la semaine (1-7 ou abréviation anglaise sur trois lettres : mon, tue, wed, thu, fri, sat, sun).
* `user` (facultatif) : nom d'utilisateur avec lequel exécuter la tâche.
* `tâche` : commande à exécuter.
* `> log` (facultatif) : redirection de la sortie vers un fichier de log. Si un fichier de log n'est pas spécifié, un mail sera envoyé à l'utilisateur local.



Pour chaque unité, on peut utiliser les notations suivantes :

* un interval de valeur : ex `1-5` : valeurs de 1 à 5.
* un interval entre deux exécution: ex: `*/6` : toutes les 6 unités de temps (toutes les 6 heures par exemple).
* un esmble fini et déterminé de valeurs: ex: `2,7 ` pour les unités de temps 2 et 7.

Le champ user n'est pas utilisé dans les cron utilisateur


## Exécuter périodiquement un script PYTHON

S'assurer que le script commence par le chemin vers l'interpréteur python:

```python
#!/usr/bin/python3
```

Lui donner les droits d'exécution

```bash
chmod +x /chemin/vers/script.py
```



Pour exécuter le script python toute les 15 minutes, édite le crontab utilsateur

```bash
export EDITOR=vi
crontab -e
```
Et ajouter la ligne:
```
*/15 * * * * /chemin/vers/script.py > /tmp/script.log
```

On peut éventuellement ajouter la ligne `MAILTO=""` pour éviter l'envoi d'un mail lorsque le script s'exécute (si aucun fichier de log n'est spécifié).


# Resources

https://doc.ubuntu-fr.org/cron

https://www.linuxtricks.fr/wiki/cron-et-crontab-le-planificateur-de-taches#paragraph_la-configuration
