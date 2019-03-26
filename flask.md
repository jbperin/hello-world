
# PYTHON

install


```
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

```
env FLASK_APP=mySite.py flask run
```

