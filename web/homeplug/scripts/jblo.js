function formatParams( params ){
  return "?" + Object
        .keys(params)
        .map(function(key){
          return key+"="+encodeURIComponent(params[key])
        })
        .join("&")
}

function  retrieveKeyInfo (api_key, key_listener, key_error) {
  let request = new XMLHttpRequest()

  request.open('GET','https://liveobjects.orange-business.com/api/v0/apiKeys/current_key', true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')

  request.onload = function () {
    var data = JSON.parse(this.response)
    if (request.status == 200) {
      key_listener(data)
    } else {
       if (request.status == 400) {
         console.log('error 400')
       } else if (request.status == 404){
         console.log('error 404')
       } else {
         console.log('error '+ request.status)
       }
       key_error()
    }
  }
  request.send()
}


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


function retrievePagedStreamContent (api_key, stream_id, stream_listener, onFinishHandler, nb_max_page = 2, bookmark_id = undefined) {
  if (nb_max_page != 0) {
    let record_per_page = 1000

    parms = {"limit":record_per_page,}

    if (bookmark_id != undefined) parms.bookmarkId = bookmark_id;
    formatted_params = formatParams(parms)
    var url = 'https://liveobjects.orange-business.com/api/v0/data/streams/'+encodeURIComponent(stream_id) + formatted_params;

    let request = new XMLHttpRequest()

    request.open('GET', url, true)
    request.setRequestHeader("X-API-KEY",api_key)
    request.setRequestHeader("Accept",'application/json')
    request.setRequestHeader("Content-type",'application/json')

    request.onload = function () {
      var data = JSON.parse(this.response)
      if (request.status >= 200 && request.status < 400) {
        if (data.length < record_per_page) {
        } else {
          retrievePagedStreamContent (api_key, stream_id, stream_listener, nb_max_page - 1, data[data.length -1].id, onFinishHandler )
        }
        stream_listener(data)
        if ((nb_max_page == 1) || (data.length < record_per_page)){
          onFinishHandler()
        }
      } else {
        console.log('error')
      }
    }
    request.send()
  }

}

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
