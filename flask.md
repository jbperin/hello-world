[TOC]


# PYTHON

installation


```bash
sudo pip3 install Flask
```

première appli


```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"
```

lancer l'application

```bash
env FLASK_APP=mySite.py flask run --host=0.0.0.0 --port=8000
```
