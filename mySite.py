from flask import Flask, request, redirect, url_for
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = '.'
ALLOWED_EXTENSIONS = set(['txt', 'md'])

app = Flask(__name__)

import markdown
from markdown.extensions.toc import TocExtension
import codecs


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


app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 512 * 1024 # 512 Kb

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def renderHtmlContent(html):
    return """<!DOCTYPE html>
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


@app.route("/")
def hello():
    return "Hello World!"

@app.route('/mdview/<mdfile>')
def render_md_file(mdfile):
    if (mdfile == "mermaid.js") or (mdfile == "emacs.css"):
        input_file = codecs.open(mdfile, mode="r", encoding="utf-8")
        result = input_file.read()
        input_file.close()
    else:
        input_file = codecs.open(mdfile+".md", mode="r", encoding="utf-8")
        text = input_file.read()
        input_file.close()
        html = markdown.markdown(text, extensions=["extra", "toc", "plantuml_markdown", "fenced_code", "latex", "codehilite"], extension_configs=extension_configs) #, 
        # show the user profile for that user
        result = renderHtmlConent(html)
    return result
    
    
import os

@app.route('/upload', methods=['GET', 'POST'])
def upload_md_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        # if user does not select file, browser also
        # submit a empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            input_file = codecs.open(filename, mode="r", encoding="utf-8")
            text = input_file.read()
            input_file.close()
            html = markdown.markdown(text, extensions=["extra", "toc", "plantuml_markdown", "fenced_code", "latex", "codehilite"], extension_configs=extension_configs) #, 
            # show the user profile for that user
            result = renderHtmlConent(html)

 
            #return redirect(url_for('uploaded_file',
            #                        filename=filename))
            return result
    return '''
    <!doctype html>
    <title>Upload new File</title>
    <h1>Upload new File</h1>
    <form method=post enctype=multipart/form-data>
      <p><input type=file name=file>
         <input type=submit value=Upload>
    </form>
    '''
    
from flask import send_from_directory

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'],
                               filename)
