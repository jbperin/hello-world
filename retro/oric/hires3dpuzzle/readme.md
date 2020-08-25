

# Creation d'un puzzle 

## Préparer une image

Faire une image aux dimensions 960*800
Cela correspond à 4 fois la dimension de l'écran HiRes Oric 
C'est pour pouvoir travailler à ujne échelle plus confortable pour la saisie des points.
Les coordonnées seronts divisés par 4 dans la suite du processus.


## Saisir la géométrie

```
python puzzleEditor.py
```

Cliquer sur le menu New et sélectionner l'image à éditer
Cliquer sur Draw et choisir une couleur
Ensuite il est possible d'utiliser les touches suivantes pour changer le mode :

- p pour passer en mode saisie de point
- s pour passer en mode saisie de segment 
- f pour passer en mode saisie de face
- e pour exporter

Le workflow consiste en premier lieu à passer en mode saisie de point (avec `p`) pour saisir les points remarquables de l'image (les angles et extrémités). Les points saisis sont matérialisés à l'écran par une pastille de la couleur choisie.
Ensuite, il faut utiliser les modes saisie de segment (par `s`) ou saisie de face (par `f`). Dans ce mode il faut cliquer sur les points précédement saisis pour les sélectionner un par un. Il faut deux sélections pour définir un segment et tros sélection pour définir une face.
Une fos que les segments et les faces ont été saisie, on peut exporter avec la lettre `e`.
Sur la console s'affiche le code python définissant la forme.

Copier coller ce code dans la structure `models` du fichier `genData.py`

## Générer les data

```
python genData.py
```

va générer les fichiers `tabpoints.c` et `traj_c.c`


