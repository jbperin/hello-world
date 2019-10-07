

function formatParams( params ){
  return "?" + Object
        .keys(params)
        .map(function(key){
          return key+"="+encodeURIComponent(params[key])
        })
        .join("&")
}

function readDeviceConfig(api_key, device_id, onStateReceived, onError= undefined) {
  let request = new XMLHttpRequest()
  let url = 'https://liveobjects.orange-business.com/api/v1/deviceMgt/devices/'+encodeURIComponent(device_id)+'/config';
  request.open('GET', url, true);
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.onload = function () {
    var data = JSON.parse(this.response)
    if (request.status == 200) {
      onStateReceived(data);
    } else {
       console.log('error '+ request.status)
       if (onError !== undefined) {onError()}
    }
  }
  request.send()
}

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

function retrieveFifos(api_key, fifo_listener){
  var url = 'https://liveobjects.orange-business.com/api/v0/topics/fifo' + formatParams({
    "size":20,
    "page":0
  })
  // Create a request variable and assign a new XMLHttpRequest object to it.
  //console.log (url)
  var request = new XMLHttpRequest()
  // Open a new connection, using the GET request on the URL endpoint
  request.open('GET',
   url, true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.setRequestHeader("Content-type",'application/json')


  request.onload = function () {
    var data = JSON.parse(this.response)


    if (request.status == 200 ) {
      //console.log(data)
      // //data.totalCount =
      var url2 = 'https://liveobjects.orange-business.com/api/v0/topics/fifo' + formatParams({
        "size":data.totalCount,
        "page":0
      })
      //console.log (url2)
      var request2 = new XMLHttpRequest()
      // Open a new connection, using the GET request on the URL endpoint
      request2.open('GET', url2, true)
      request2.setRequestHeader("X-API-KEY",api_key)
      request2.setRequestHeader("Accept",'application/json')
      request2.setRequestHeader("Content-type",'application/json')
      request2.onload = function () {
        if (request.status == 200) {
          let data2 = JSON.parse(this.response)
          //console.log (data2)
          fifo_listener(data2.data)
        } else {
          console.log('error')
        }
      }
      request2.send(null)
    } else {
      console.log('error')
    }
  }
  request.send()

}

//curl -X GET --header 'Accept: application/json' --header 'X-API-KEY: e36519a3c5474778a0f0d2a867843eba' 'https://liveobjects.orange-business.com/api/v0/apiKeys?size=20&page=0&showSessionKeys=false&showMasterKey=true'

function  retrieveTenants (api_key, tenants_listener) {

  var url = 'https://liveobjects.orange-business.com/api/v0/apiKeys' + formatParams({
  //  "size":20,
  //  "page":0,
    "showSessionKeys":false,
    "showMasterKey":true
  })
  // Create a request variable and assign a new XMLHttpRequest object to it.
  //console.log (url)
  var request = new XMLHttpRequest()
  // Open a new connection, using the GET request on the URL endpoint
  request.open('GET',
   url, true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.setRequestHeader("Content-type",'application/json')


  request.onload = function () {
    var data = JSON.parse(this.response)


    if (request.status >= 200 && request.status < 400) {
      //console.log(data)
      //data.totalCount =
      var url2 = 'https://liveobjects.orange-business.com/api/v0/apiKeys' + formatParams({
        "size":data.totalCount,
        "page":0,
        "showSessionKeys":false,
        "showMasterKey":true
      })
      //console.log (url2)
      var request2 = new XMLHttpRequest()
      // Open a new connection, using the GET request on the URL endpoint
      request2.open('GET', url2, true)
      request2.setRequestHeader("X-API-KEY",api_key)
      request2.setRequestHeader("Accept",'application/json')
      request2.setRequestHeader("Content-type",'application/json')
      request2.onload = function () {
        if (request.status >= 200 && request.status < 400) {
          let data2 = JSON.parse(this.response)
          //console.log (data2)
          tenants_listener(data2.data)
        } else {
          console.log('error')
        }
      }
      request2.send(null)
    } else {
      console.log('error')
    }
  }
  request.send()
}




function retrieveDevices(api_key, device_listener){
  var url = 'https://liveobjects.orange-business.com/api/v1/deviceMgt/devices' + formatParams({
    "limit":2000,
    "offset":0,
    "sort": '["-creationTs", "urn"]'
  })
  // Create a request variable and assign a new XMLHttpRequest object to it.
  //console.log (url)
  var request = new XMLHttpRequest()
  // Open a new connection, using the GET request on the URL endpoint
  request.open('GET',
   url, true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.setRequestHeader("Content-type",'application/json')


  request.onload = function () {
    var data = JSON.parse(this.response)


    if (request.status == 200 ) {
      //console.log(data)
      device_listener(data)
      // // //data.totalCount =
      // var url2 = 'https://liveobjects.orange-business.com/api/v0/topics/fifo' + formatParams({
      //   "size":data.totalCount,
      //   "page":0
      // })
      // console.log (url2)
      // var request2 = new XMLHttpRequest()
      // // Open a new connection, using the GET request on the URL endpoint
      // request2.open('GET', url2, true)
      // request2.setRequestHeader("X-API-KEY",api_key)
      // request2.setRequestHeader("Accept",'application/json')
      // request2.setRequestHeader("Content-type",'application/json')
      // request2.onload = function () {
      //   if (request.status == 200) {
      //     let data2 = JSON.parse(this.response)
      //     console.log (data2)
      //     fifo_listener(data2.data)
      //   } else {
      //     console.log('error')
      //   }
      // }
      // request2.send(null)
    } else {
      console.log('error')
    }
  }
  request.send()

}

function retrieveDeviceInfo (api_key,device_id, device_listener){

  var url = 'https://liveobjects.orange-business.com/api/v1/deviceMgt/devices/'+encodeURIComponent(device_id)
  // Create a request variable and assign a new XMLHttpRequest object to it.
  //console.log (url)
  let request = new XMLHttpRequest()
  // Open a new connection, using the GET request on the URL endpoint
  request.open('GET',
   url, true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.setRequestHeader("Content-type",'application/json')


  request.onload = function () {
    var data = JSON.parse(this.response)
    if (request.status >= 200 && request.status < 400) {
      //console.log(data)
      device_listener(data)
    } else {
      console.log('error')
    }
  }
  request.send()

}

function retrieveDeviceStreams(api_key,device_id,stream_listener){
  var url = 'https://liveobjects.orange-business.com/api/v1/deviceMgt/devices/'+encodeURIComponent(device_id)+'/data/streams'
  // Create a request variable and assign a new XMLHttpRequest object to it.
  //console.log (url)
  let request = new XMLHttpRequest()
  // Open a new connection, using the GET request on the URL endpoint
  request.open('GET',
   url, true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.setRequestHeader("Content-type",'application/json')


  request.onload = function () {
    var data = JSON.parse(this.response)
    if (request.status >= 200 && request.status < 400) {
      //console.log(data)
      stream_listener(data)
    } else {
      console.log('error')
    }
  }
  request.send()
}

function retrieveStreamContent (api_key, stream_id, stream_listener) {
  //curl -X GET  'https://liveobjects.orange-business.com/api/v0/data/streams/urn%3Alo%3Ansid%3Aibo_Steps_OK&#33;uplink?limit=100'
  var url = 'https://liveobjects.orange-business.com/api/v0/data/streams/'+encodeURIComponent(stream_id) + formatParams({
    "limit":1000,
    //"timeRange":0,
    //"bookmarkId":
  })
  // Create a request variable and assign a new XMLHttpRequest object to it.
  //console.log (url)
  let request = new XMLHttpRequest()
  // Open a new connection, using the GET request on the URL endpoint
  request.open('GET',
   url, true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')
  request.setRequestHeader("Content-type",'application/json')


  request.onload = function () {
    var data = JSON.parse(this.response)
    if (request.status >= 200 && request.status < 400) {
      console.log(data)
      stream_listener(data)
    } else {
      console.log('error')
    }
  }
  request.send()
}

function retrievePagedStreamContent (api_key, stream_id, stream_listener, onFinishHandler, nb_max_page = 2, bookmark_id = undefined) {
  if (nb_max_page != 0) {
    let record_per_page = 1000
    //curl -X GET  'https://liveobjects.orange-business.com/api/v0/data/streams/urn%3Alo%3Ansid%3Aibo_Steps_OK&#33;uplink?limit=100'
    parms = {"limit":record_per_page,}

    if (bookmark_id != undefined) parms.bookmarkId = bookmark_id;
    formatted_params = formatParams(parms)
    var url = 'https://liveobjects.orange-business.com/api/v0/data/streams/'+encodeURIComponent(stream_id) + formatted_params;

    // Create a request variable and assign a new XMLHttpRequest object to it.
    //console.log (url)
    let request = new XMLHttpRequest()
    // Open a new connection, using the GET request on the URL endpoint
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

function publishFifo (api_key, fifo_name, data) {

	var request = new XMLHttpRequest ();

	request.open('POST',
	'https://liveobjects.orange-business.com/api/v0/topics/fifo/'+fifo_name, true
	)
	request.setRequestHeader("X-API-KEY",api_key)
	request.setRequestHeader("Accept",'application/json')
	request.setRequestHeader("Content-type",'application/json')

	request.onLoad= (event) => {
  	if (this.status === 202) {
  		//console.log(this.responseText)
  	} else {
  		console.log("erreur")
  	}
  };
	body = JSON.stringify(data)
	request.send(body)
}

function uploadBulk (api_key, data) {
	var request = new XMLHttpRequest ();
	request.open('POST',
	'https://liveobjects.orange-business.com/api/v0/data/bulk', true
	)
	request.setRequestHeader("X-API-KEY",api_key)
	request.setRequestHeader("Accept",'application/json')
	request.setRequestHeader("Content-type",'application/json')

	request.onLoad= (event) => {
  	if (this.status === 202) {
  		//console.log(this.responseText)
  	} else {
  		console.log("erreur")
  	}
  };
  //console.log(data)
	body = JSON.stringify(data)

	request.send(body)
}


function workFileContent(readerEvent) {
  let FIELD_SEPARATOR = ';'
  var content = readerEvent.target.result; // this is the content!

  let fields = content.replace(/\r/g, '').split('\n')[0].replace(/\"/g, '').split(FIELD_SEPARATOR)

  let lines = content.replace(/\r/g, '').replace(/\"/g, '').split('\n').slice(1).map(elem => elem.split(FIELD_SEPARATOR))

  let listOfLines = new Array()
  for (li of lines){
    let jsLine = {}
    for (fi of fields) {
      jsLine[fi]=li[fields.indexOf(fi)]
    }
    listOfLines.push(jsLine)
  }
  this.handler(listOfLines);
};

function inputCSVFile(app, onValidFileLoaded) {

	let container = document.createElement('div')
	container.setAttribute('class', 'w3-container')
	container.setAttribute('id', 'CSVFileSelector')

	let para = document.createElement('p')
	para.textContent = "Choisir un fichier CSV:"
	container.appendChild(para)

	let fileInput = document.createElement("input")
	fileInput.setAttribute('id', 'csv_file_input')
	fileInput.setAttribute('type', 'file')
  container.appendChild(fileInput)

  app.appendChild(container)
  readFile = function () {
      var reader = new FileReader();
      reader.handler = onValidFileLoaded;
      reader.onload = workFileContent;
	    reader.readAsText(fileInput.files[0],'UTF-8');
  };

	fileInput.addEventListener('change', readFile);

}
