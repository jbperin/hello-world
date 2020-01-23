# Génération de niveaux pour Rain Panic

## Objectifs

L'objectif de cet outils est de générer des _waves_ pour le jeu Rain Panic.

Pour permettre de générer des niveaux qui exploitent au maximum l'intéret du jeu et captive le joueur, l'outils permet de régler la difficulté des wave.

Pour pouvoir être aisément couplé à Rain Panix, l'outils génère le code C de la wave pour une inclusion directe dans le code source de Rain Panic.


## Principe

La génération d'un wave commence par créer un objet `Sequence` en spécifiant sa durée en nombre de cycle de jeu

```python
S= sequence(123)
```

Ensuite, on "soupoudre" les évènements aléatoirement sur la durée de la wave.

Pour chaque type d'évènements des fonctions sont disponibles pour générer les codes de ce type d'évènement:

```python
# fonction de génération d'un code de goutte d'eau
def raindrop(): return random.randrange(0,13)*2 + 7

# fonction de génération d'un code de lightning
def lightning(): return random.randrange(0,13)*2 + 200
```

Par exemple, pour déclencher 12 d'eau et 5 lightning et les répartir aléatoirement de manière uniforme sur la durée de la wave on utilisera:

```python
S.spread (12, raindrop, "UNIFORM")
S.spread (5, lightning, "UNIFORM")
```

Enfin, pour obtenir la séquence sous forme d'un tableau C, on utilisera:

```python
print (S.toCarray())
```

Ce qui produira un résultat similaire à :

```C
unsigned char rain[] = {
21, 8, 15, 1, 35, 5, 27, 6, 15, 6, 23, 3, 11, 7, 208, 15, 7, 2, 19, 6, 222, 5, 11, 20, 220, 1, 17, 4, 15, 12, 214, 2, 31, 14, 200, 3, 255,0};
```
