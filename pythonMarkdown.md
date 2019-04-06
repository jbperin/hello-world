
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

```python hl_lines="1 3"
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

```plantuml format="png" classes="uml myDiagram" alt="My super diagram placeholder" title="My super diagram" width="300px" height="300px"
@@startdot
digraph foo {
  node [style=rounded]
  node1 [shape=box]
  node2 [fillcolor=yellow, style="rounded,filled", shape=diamond]
  node3 [shape=record, label="{ a | b | c }"]

  node1 -> node2 -> node3
}
@enddot
```

## Extension CodeHilite

```
sudo apt-get install python3-pygments
pip3 install Pygments
```

