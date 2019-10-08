# Lire un stream liveobjects


Nous partons d'un patron HTML disposant d'une fonction d'affichage ligne à ligne:

```html
<html>
   <head>
    <meta charset="utf-8" />
    <title>Mon Appli LiveObjects</title>
    <script src="jblo.js" type="text/javascript"></script>
   </head>
    <body>
      <h1>Une page LiveObjects</h1>
      <div id="root"></div>
     	<script>

function affiche (texte) {
  let para = document.createElement('p');
  para.textContent = texte
  document.getElementById('root').appendChild(para);
}

function Main(api_key) {
  // Ici le code du script LiveObjects
}

obtainApiKey (document.getElementById("root"), onValidValue= Main, onInvalidValue= (invkey)=>{})

    	</script>
   </body>
</html>
```

Le `StreamId` sera codé en dur dans notre page web pour aléger

```javascript
const STREAM_ID="urn:lora:70B3D5E75E007547!uplink";
```

Nous allons programmer une fonction

`retrievePagedStreamContent (api_key, stream_id, stream_listener, onFinishHandler, nb_max_page = 2, bookmark_id = undefined)`

qui récupère, de façon paginée, le contenu d'un stream `stream_id` et passe chaque page à la fonction `stream_listener`. La fonction `onFinishHandler` est appellée lorsque toutes les pages auront été lues.



Nous créons une liste initialement vide de messages.

```javascript
var msgs = undefined;
```
que nous alimenterons à chaque réception de page de messages à travers une fonction qui servira de `stream_listener` dans notre appel à la fonction `retrievePagedStreamContent`.

```javascript
function someNewDataArrived(data) {
  if (msgs == undefined) msgs = new Array();
  data.map(e => msgs.push(e))
}
```
Lorsque toutes les données auront été reçue, nous les afficherons par le biais d'une fonction qui servira de `onFinishHandler` dans notre appel à la fonction `retrievePagedStreamContent`.

```javascript
function allDataArrived() {
  msgs.forEach (msg => {
    affiche (msg.timestamp + JSON.stringify(msg.value));
  })
}
```
Notre appel à la fonction de récupération de contenu d'un stream sera donc:

```javascript
retrievePagedStreamContent (api_key, STREAM_ID, stream_listener = someNewDataArrived, onFinishHandler = allDataArrived, nb_max_page = 2, bookmark_id = undefined);
```
