
[TOC]

# Premier pas

## Installation


```bash
sudo apt-get install graphviz
sudo apt-get install plantuml
```

```bash
pip3 install markdown
```

Premier usage

```bash
python3 -m markdown <fichier.md>
```

Usage programmatique

```python3
import markdown

text = """#Coucou
## C'estun essai
"""

html = markdown.markdown(text)


print (html)
```

## Extension plantuml

```bash
pip3 install plantuml-markdown
```

```bash
python3 -m markdown -x plantuml_markdown  pythonMarkdown.md
```


```plantuml format="txt" classes="uml myDiagram" alt="My super diagram placeholder" title="My super diagram" width="300px" height="300px"
  Goofy ->  MickeyMouse: calls
  Goofy <-- MickeyMouse: responds
```


```plantuml format="png" classes="uml myDiagram" alt="My super diagram placeholder" title="My super diagram" width="300px" height="300px"
@startuml

(First usecase)
(Another usecase) as (UC2)  
usecase UC3
usecase (Last\nusecase) as UC4

@enduml
```


## Extension CodeHilite

L'extension CodeHilite se base sur pygments que l'on peut installer de la façon suivante:
```
sudo apt-get install python3-pygments
pip3 install Pygments
```

L'extension génère du html avec des balises qui définissent la couleur des différents mots.
Ces balises sont regroupées dans un fichier css qu'il faut incorporer en entête du fichier html rendu.
```html
<html lang="fr">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="/emacs.css">
</head>
<body>
  ...
</body>
</html>
```

Tel qu'indiqué dans [la documentation](https://python-markdown.github.io/extensions/code_hilite/), il est possible de générer les fichiers css par des commandes du type:

```
pygmentize -S default -f html -a .codehilite > styles.css
```
Ou bien de puiser dans les [css déjà générés](https://github.com/richleland/pygments-css) et illustrés dans le [cataloque de css](http://richleland.github.io/pygments-css/) fourni par Richard Leland.


## Exemple Mermaid

Pour utiliser l'extension Mermaid, il faut inclure le script mermaid.js dans  le fichier HTML template utilisé pour le rendu.
```
<html lang="fr">
<head>
...
</head>
<body>
  ...
  <INSERT HTML CODE HERE>
  ...
  <script src="mermaid.js"></script>
  <script>mermaid.initialize({startOnLoad:true});</script>
</body>
</html>
```

Ensuite, dans le fichier markdown, pour utiliser le mermaid, il faut placer la description mermaid dans une division de classe mermaid `<div class="mermaid">`
Par exemple, la section suivante 
```
<div class="mermaid">
  graph LR
      A --- B
      B-->C[fa:fa-ban forbidden]
      B-->D(fa:fa-spinner);
</div>
```
sera rendue de la façon suivante:

<div class="mermaid">
  graph LR
      A --- B
      B-->C[fa:fa-ban forbidden]
      B-->D(fa:fa-spinner);
</div>

## Extension Latex

Après avoir suivi la [procédure d'installation de latex](latex.md) pour raspberry Pi, installer l'extension comme suit:

```bash
wget https://raw.githubusercontent.com/justinvh/Markdown-LaTeX/master/latex.py
mv latex.py /home/perin/.local/lib/python3.5/site-packages/markdown/extensions
```
Mais je n'arrive pas à faire marcher en utilisant le site-packages . je suis obligé d'avoir le fichier latex.py dans le répertoire courant :-(



