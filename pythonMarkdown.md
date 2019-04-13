
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

```
sudo apt-get install python3-pygments
pip3 install Pygments
```

## Exemple Mermaid

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



