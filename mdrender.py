
import markdown

#input_file = codecs.open("pythonMarkdown.py", mode="r", encoding="utf-8")
#text = input_file.read()
text = """#Coucou
## C'estun essai
"""

html = markdown.markdown(text)



#output_file = codecs.open("pythonMarkdown.html", "w",
#                          encoding="utf-8",
#                          errors="xmlcharrefreplace"
#)
#output_file.write(html)
#output_file.close

print (html)
