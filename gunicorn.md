


[Gunicorn](https://gunicorn.org/)


```
sudo apt-get install gunicorn
```

créer le fichier `gunicorn_test.py` avec le contenu suivant:


```python
def app(environ, start_response):
    """Simplest possible application object"""
    data = b'Hello, World!\n'
    status = '200 OK'
    response_headers = [
        ('Content-type', 'text/plain'),
        ('Content-Length', str(len(data)))
    ]
    start_response(status, response_headers)
    return iter([data])
```

Lancer l'appli

```
gunicorn --workers=2 gunicorn_test:app
```

L'application est testable en visitant l'adresse [localhost:8000](http://127.0.0.1:8000)



Si on veut faire en sorte que l'application soit visitable à une addresse: `http://<adresse_internet>/web` par l'intermédiaire de nginx

Il faut ajouter une *location* redirigeant vers l'appli gunicorn

Ouvrir le fichier `/etc/nginx/sites-enabled/default` et ajouter 
```
    location /web {
      proxy_pass         http://127.0.0.1:8000;
      proxy_redirect     off;
      proxy_set_header   Host $host;
      proxy_set_header   X-Real-IP $remote_addr;
      proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header   X-Forwarded-Host $server_name;
    }
```

