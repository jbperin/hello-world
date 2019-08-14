


```
sudo apt install nginx 
```

le contenu du site web se trouve dans `/var/www/html/`

```
sudo chown -R www-data:pi /var/www/html/
sudo chmod -R 770 /var/www/html/
```

et consultale à l'adresse : [`http://127.0.0.1/`](http://127.0.0.1/)

La configuration ngix se trouve dans `sudo leafpad /etc/nginx/nginx.conf`


Dans le fichier `/etc/nginx/sites-enabled/default`, configurer la ligne `index` pour ajouter le cas php.


```
sudo systemctl status nginx
```

Pour la prise en compte par nginx des modifications:

```
sudo /etc/init.d/nginx restart
```



```
sudo service nginx start 
sudo service nginx stop 
sudo service nginx status 
```


Si problème d'accès:
```
 chown www-data:www-data /var/www
 chmod 744 /var/www
```



## installer php pour nginx

```
sudo apt install php-fpm
```

# Ressources

[NGINX sur RPI](https://raspbian-france.fr/installer-nginx-raspbian-raspberry/)

[Admin Bible](https://github.com/trimstray/nginx-admins-handbook)
