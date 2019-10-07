# Envoyer une commande à un device LoRa



Nous partons du template HTML suivant:

```html
<html>
   <head>
    <meta charset="utf-8" />
    <title>Mon Appli LiveObjects</title>
    <script src="scripts/jblo.js" type="text/javascript"></script>
   </head>
    <body>
      <h1>Une page LiveObjects</h1>
      <div id="root"></div>
     	<script>

function Main(api_key) {

  // Ici votre code Live Objects

}
obtainApiKey (document.getElementById("root"), onValidValue= Main, onInvalidValue= (invkey)=>{})

    	</script>
   </body>
</html>
```

La commande envoyée aura la forme :

```json
{
  "confirmed": true,
  "data": "51285624ab5d",
  "port": 1
}
```

où le champs data contient la payload de la commande encodée en hexadécimal.



[service d'enregistrement de commandes du swagger](https://liveobjects.orange-business.com/swagger-ui/index.html#!/Device_management_for_LPWA/registerCommandUsingPOST)

```javascript
function registerCommand(api_key, device_EUI, command_obj, commandSent, onError = undefined) {

  var request = new XMLHttpRequest()
  let encodedDeviceEui = encodeURIComponent(device_EUI)
  let url = 'https://liveobjects.orange-business.com/api/v1/deviceMgt/connectors/lora/nodes/'+encodedDeviceEui+'/downlinks'

  request.open('POST', url, true);

  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.setRequestHeader("Content-type",'application/json')

  request.onload = function (event) {
    if (this.status === 200) {
        commandSent(JSON.parse(this.responseText))
    } else {
        console.log("Echec lors de l'enregistrement' d'une commande %d (%s)", this.status, this.statusText);
        if (onError !== undefined) onError();
    }
  };
  body = JSON.stringify(command_obj)
  request.send(body);
}
```
