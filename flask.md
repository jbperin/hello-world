
# PYTHON

install


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

<div class="mermaid">
gantt
    title A Gantt Diagram
    dateFormat  YYYY-MM-DD
    section Section
    A task           :a1, 2014-01-01, 30d
    Another task     :after a1  , 20d
    section Another
    Task in sec      :2014-01-12  , 12d
    another task      : 24d
</div>
