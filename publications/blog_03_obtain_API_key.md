# Protéger votre clé API lors des développements LiveObjects.
Une grosse part de la sécurité LiveObjects repose sur la clé API.

Cet élément indispensable est impliqué dans chaque interaction avec LiveObject mais il ne doit jamais être rendu public.

Lorsqu'on développe des applis web Live Objects, ce secret doit être présent à chaque test mais il ne doit apparaître nul part dans les éléments que nous partageons avec les autres (code source ou documentation).

Cet article présente mes astuces pour toujours avoir ma clé API à disposition dans mes scripts sans risquer de l'exposer en publiant des codes sources dans une repository.

**ATTENTION: Les solutions proposées ici ne sont applicables qu'à un contexte de développement et ne doivent pas être utilisée en production.**


## Stocker la clé API dans un fichier qui n'est pas géré en gestion de configuration.


La première astuce consiste à stocker le précieux secret dans un fichier local `credentials.js`.

```
myCredentials = {
    liveobjects : {
        password : "ICI VOTRE CLE API",
    }
}
```

et à ajouter le nom de ce fichier dans le fichier `.gitignore` à la racine de votre repository.

Une page HTML/Javascript peut ainsi utiliser la clé API sans que cette dernière soit codée en dure.

```html
<html>
   <head>
    <meta charset="utf-8" />
    <title>Mon Appli LiveObjects</title>
    <script src="credential.js" type="text/javascript"></script>
   </head>
    <body>
      <h1>Une page LiveObjects</h1>
      <div id="root"></div>
         <script>

api_key = myCredentials.liveobjects.password
connectLiveObject(api_key)

        </script>
   </body>
</html>
```


Cette solution est pratique pour travailler avec une clé API sans risquer de la divulguer par mégarde lors d'un commit.

Elle permet aussi aux différents développeurs de partager la même repository tout en gardant chacun sa propre clé API.


## Stocker la clé API dans le stockage du navigateur web

La solution précédente présente l'inconvénient de faire apparaître une information critique (la clé API) dans un fichier du répertoire de travail.

Si, par mégarde ,on envoie une copie de notre répertoire de travail à un collègue, la clé API peut se trouver divulguée.

Pour éviter cela, il existe une solution consistant à stocker cette clé dans le stockage local du navigateur web plutôt que dans un fichier.

```javascript
localStorage.setItem("api_key", api_key);
```

Elle devient ainsi facilement récupérable.

```javascript
api_key = localStorage.getItem("api_key");
```

Le stockage local du navigateur web étant propre à chaque page, il faut que ce soit la même page qui stocke la clé API et la récupère pour l'utiliser.
L'idée est donc de faire en sorte que la page demande à l'utilisateur de saisir sa clé API lors de son premier chargement. Puis, une fois que la clé est saisie, le script la stocke afin de pouvoir la retrouver ultérieurement sans avoir à la redemander à l'utilisateur. Cela peut en substance se traduire par:

```javascript
api_key = localStorage.getItem("api_key");

if (api_key != null) {
  connectLiveObject(api_key);
} else {
  api_key = demanderCleApiUtilisateur ();
  localStorage.setItem("api_key", api_key);
}
```


La saisie, par l'utilisateur, d'une information qu'il n'aura l'oportunité de saisir qu'une fois requiert d'entourer cette opération d'un certain nombre de contrôle.

En premier lieu il convient de s'assurer que la clé API est composée de 32 quartets hexadécimaux avec l'expression régulière suivante :

```javascript
let alphaExp = /^[0-9a-fA-F]{32}$/;
```

Et s'assurer également que la clé saisie est bien une clé valide sur la plateforme LiveObjects.

Nous supposerons ici disposer d'une fonction `retrieveKeyInfo (api_key, valid_key_handler , invalid_key_handler)`

qui demande à LiveObject des informations sur la clé `api_key` et, si la clé est valide, fournit les informations obtenues à la fonction `valid_key_handler`. Si la clé n'est pas reconnue par LiveObjects, c'est la fonction `invalid_key_handler` qui est appelée.

Cette fonction fait l'objet d'un autre post de ce blog.

## Rendre disponible la clé API sans la stocker en fichier

Pour que la clé API ne soit plus stockée que dans le navigateur web, nous programmons ici une fonction:

`obtainApiKey (app, onValidValue, onInvalidValue)`

qui fait en sorte que si la clé API n'est trouvée ni dans un fichier credentials, ni dans le stockage local du navigateur, alors elle est demandée à l'utilisateur et mémorisée dans le stocakge local du navigateur après avoir été validée auprès de la plateforme LiveObjects.


```javascript
function obtainApiKey (app, onValidValue, onInvalidValue){

  let alphaExp = /^[0-9a-fA-F]{32}$/;

  let api_key = null;

  try {
      api_key = myCredentials.liveobjects.password;
      if (! api_key.match(alphaExp)) {
        api_key = null;
        console.log ("Erroneous api_key stored in credentials")
      } else {
        retrieveKeyInfo (api_key, (key_info) => {
          onValidValue(api_key);
        }, () => {
          console.log ("api_key from credentials not validated by LiveObjects")
          apiKeyNotFoundInCredentials (app, onValidValue, onInvalidValue);
        })
      }
  } catch (e) {
    if (e instanceof ReferenceError) {
      console.log ("api_key not found in credentials")
    } else {
      console.log ("Unexpected Exception" + e)
    }
    api_key = null;
    apiKeyNotFoundInCredentials (app, onValidValue, onInvalidValue);
  }


  function apiKeyNotFoundOnLocalStorage (app, p_onValidValue, p_onInvalidValue){
    console.log ("api_key not found on local storage")

    let para = document.createElement('p')
    para.setAttribute('id', 'prompt_api_key')
    para.textContent = "Entrer une clé API valide:"
    app.appendChild(para);

    let inp = document.createElement('input');
    inp.setAttribute('type', 'password');
    inp.setAttribute('id', 'api_key');
    inp.value = "";
    app.appendChild(inp);

    inp.addEventListener('keyup', function (evt) { // use change here. not neccessarily
      console.log(evt);
      if (this.value.match(alphaExp) && evt.key !== "Control") {
          this.setAttribute('class', 'w3-input');
          this.setAttribute('valid', 'true');
          retrieveKeyInfo (this.value, (key_info) => {
            console.log ("api_key entered by user validated by LiveObjects .. memorize it");
            api_key = this.value;
            localStorage.setItem("api_key", api_key);
            if (this.parentNode != null) {
              this.parentNode.removeChild(document.getElementById("prompt_api_key"));
              this.parentNode.removeChild(this);
            }
            p_onValidValue(api_key);
          }, () => {
            console.log ("api_key entered bu user is not validated by LiveObjects");
          })
        } else {
            this.setAttribute('class', 'w3-input w3-border w3-pale-blue')
            this.setAttribute('valid', 'false')
        }
    }, false);
  }

  function apiKeyNotFoundInCredentials (app, f_onValidValue, f_onInvalidValue){
    // Try to find it in Local Storage
    api_key = localStorage.getItem("api_key");
    if (api_key != null) {
      retrieveKeyInfo (api_key, (key_info) => {
        f_onValidValue(api_key);
      }, () => {
        console.log ("api_key from credentials not validated by LiveObjects")
        apiKeyNotFoundOnLocalStorage (app, f_onValidValue, f_onInvalidValue);
      })
    } else {
      apiKeyNotFoundOnLocalStorage (app, f_onValidValue, f_onInvalidValue);
    }
  }
}
```


Muni de cette fonction `obtainApiKey` que nous enregistrons dans le fichier `lolite.js`, il devient possible de démarrer un développement  LiveObject avec le fichier suivant :

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

function Main(api_key) {

  // Ici votre code Live Objects utilisant l'api_key

}
obtainApiKey (document.getElementById("root"), onValidValue= Main, onInvalidValue= (invkey)=>{})

    	</script>
   </body>
</html>
```
