
import markdown
from markdown.extensions.toc import TocExtension
import codecs

input_file = codecs.open("pythonMarkdown.md", mode="r", encoding="utf-8")
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
    'codehilite': {
        'linenums':False
        ,'guess_lang':False
        ,'css_class':'codehilite'
        ,'pygments_style':'default' # Pygments HTML Formatter Style (ColorScheme). Defaults to default.
        ,'noclasses':True
        ,'use_pygments':True
    }
}
html = markdown.markdown(text, extensions=["extra", "toc", "plantuml_markdown", "codehilite"], extension_configs=extension_configs)



output_file = codecs.open("pythonMarkdown.html", "w",
                          encoding="utf-8",
                          errors="xmlcharrefreplace"
)
output_file.write(html)
output_file.close()

print (html)
