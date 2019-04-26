


#

```bash
sudo docker container ls --all
```

```bash
sudo docker image ls
```

Consulter les logs d'un container

```bash
sudo docker logs --tail 50 --follow --timestamps 676e85cc9e4e
```
Dans la ligne ci-dessus, `676e85cc9e4e` représente le container ID tel qu'il est  fourni par la commande `sudo docker container ls --all`

Execuer une commande dans un container

```bash
sudo docker exec wmc-dashboard /bin/bash
```

Lancer une image
```bash
sudo docker run -ti af0ae9b5fd05
```

Debugger un container qui reste bloqué en mode restarting:

```bash
sudo docker commit 676e85cc9e4e my-broken-container && sudo docker run -it my-broken-container /bin/bash
```
où `676e85cc9e4e` représente le container ID tel qu'il est  fourni par la commande `sudo docker container ls --all`

Supprimer une image docker

```bash
sudo docker image rm -f <IMAGE_ID>
```
Supprimer un container docker

```bash
sudo docker container rm <CONTAINER_ID>
```

Démarrer un container docker

```bash
sudo docker-compose -f /opt/docker/compose/wmc_compose-3.0.0.yml
```
