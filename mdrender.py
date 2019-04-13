
import markdown
from markdown.extensions.toc import TocExtension
import codecs

FILENAME_RAD = "essai2"

input_file = codecs.open(FILENAME_RAD+".md", mode="r", encoding="utf-8")
text = input_file.read()
##text = """
##[TOC]
###Coucou
#### C'estun essai
##
##```plantuml format="png" classes="uml myDiagram" alt="My super diagram placeholder" title="My super diagram" width="300px" height="300px"
##  Goofy ->  MickeyMouse: calls
##  Goofy <-- MickeyMouse: responds
##```
##"""
extension_configs = {
    'toc': {
        'marker':'[TOC]',
        'title':'TableOfContent',
        'baselevel': 1,
        'permalink': True
        
    },
    'plantuml_markdown': {
    },
    'fenced_code':{
    },
    'latex':{
    },
    'codehilite': {
        'linenums':False
        ,'guess_lang':True
        ,'css_class':'highlight'
        ,'pygments_style':'default' # Pygments HTML Formatter Style (ColorScheme). Defaults to default.
        ,'noclasses':False
        ,'use_pygments':True
    }
}

#html = markdown.markdown(text, extensions=["extra", "toc", "plantuml_markdown", "codehilite"], extension_configs=extension_configs)
html = markdown.markdown(text, extensions=["extra", "toc", "plantuml_markdown", "fenced_code", "latex", "codehilite"], extension_configs=extension_configs) #, 

result = """<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="emacs.css">
</head>
<body>
  %s
  <script src="mermaid.js"></script>
  <script>mermaid.initialize({startOnLoad:true});</script>
</body>
</html>"""%(html)

output_file = codecs.open(FILENAME_RAD+".html", "w",
                          encoding="utf-8",
                          errors="xmlcharrefreplace"
)
output_file.write(result)
output_file.close()

print (html)
