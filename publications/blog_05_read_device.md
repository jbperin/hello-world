
# Consulter les infos d'un Device

Dans cet article, nous allons voir comment récupérer l'état MQTT courant d'un device  enregistré sur LiveObjects.

Les deux informations requises pour pouvoir lire l'état d'un device sont:
* la clé API LiveObjects
* l'identifiant du device.

La clé API sera obtenue par les mécanismes vus dans les billets [02](blog_02_get_key_info.md) et [03](blog_03_obtain_API_key.md) de ce blog.

Le device ID sera codé en dur pour alléger la démonstration.

```javascript
const DEVICE_ID="urn:lo:nsid:XXXXXXXXXXX";
```

Nous verrons dans un autre article comment il est possible de faire choisir le device id à l'utilisateur pour éviter de le coder en dur dans l'application Web.

Nous partons du patron de page web suivant:

```html
<html>
   <head>
    <meta charset="utf-8" />
    <title>Mon Appli LiveObjects</title>
    <script src="jblo.js" type="text/javascript"></script><!--style></style-->
   </head>
    <body>
      <h1>Une page LiveObjects</h1>
      <div id="root"></div>
       <script>

function Main(api_key) {

}
obtainApiKey (document.getElementById("root"), onValidValue= Main, onInvalidValue= (invkey)=>{})

     </script>
   </body>
</html>
```

L'affichage de l'état se fera grace à une fonction `affiche` décrite ci-dessous.


```javascript
function affiche (texte) {
  let para = document.createElement('p');
  para.textContent = texte
  document.getElementById('root').appendChild(para);
}
```


## Etat de connexion MQTT

Pour lire l'état de connexion du device, nous utiliserons la même opération que celle du [service de lecture d'un device sur le swagger ](https://liveobjects.orange-business.com/swagger-ui/index.html#!/Device_management_-_Inventory_-_V1/getDeviceUsingGET_2) que nous encapsulons dans une fonction `readDevice(api_key, device_id, onRead, onError= undefined)` qui recéupère les informations du device `device_id` et les passe en paramètre à la fonction `onRead`.


```javascript
function readDevice(api_key, device_id, onRead, onError= undefined) {
  let request = new XMLHttpRequest()
  let url = 'https://liveobjects.orange-business.com/api/v1/deviceMgt/devices/'+encodeURIComponent(device_id);
  request.open('GET', url, true);
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.onload = function () {
    var data = JSON.parse(this.response)
    if (request.status == 200) {
      onRead(data);
    } else {
       console.log('error '+ request.status)
       if (onError !== undefined) {onError()}
    }
  }
  request.send()
}
```

Pour ne pas allourdir notre fichier html, nous stockons cette fonction dans le fichier `jblo.js` qui nous sert de librairie.



## Lecture du dernier état publié dans un stream

Dans l'étape précédente, il a été vu la façon de consulter l'état de connexion d'un device. Nous allons à présent voir comment récupérer la dernière valeur publiée par le device dans un stream dont nous coderons  le nom en durpour l'instant:

```javascript
const STREAM_ID="ici_le_stream_id";
```


L'opération de lecture du stream Live Object repose la même API que celle du
[service de lecture de stream du swagger LiveObjects ](https://liveobjects.orange-business.com/swagger-ui/index.html#!/Data_management_data_store/retrieveDataUsingGET).

Nous programmons une fonction `retrieveLastPublished (api_key, stream_id, onRead)` qui récupère le dernier message publié sur le stream `stream_id` et le passe en paramètre à la fonction `onRead`.

```javascript
function retrieveLastPublished (api_key, stream_id, onRead, onError = undefined) {

  var url = 'https://liveobjects.orange-business.com/api/v0/data/streams/'+encodeURIComponent(stream_id) + formatParams({
    "limit":1})

  let request = new XMLHttpRequest()

  request.open('GET', url, true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.setRequestHeader("Content-type",'application/json')

  request.onload = function () {
    var data = JSON.parse(this.response)
    if (request.status == 200) {
      onRead(data)
    } else {
      console.log('error ' + request.status)
      if (onError !== undefined) onError ();
    }
  }
  request.send()
}
```

_NB:_ Nous ne lisons qu'un enregistrement du stream car seul le dernier état publié nous intéresse.

Si plusieurs devices publient dans le même stream ou si device publie d'autre trame que celle de son état, il faut pouvoir parcourir le stream à la recherche du dernier enregistrement d'état du device recherché. Ce genre de recheche fera l'objet d'un autre billet.
