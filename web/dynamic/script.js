
const kAPI=undefined
//const deviceId="urn:lo:nsid:flexy205:3475410668"
const deviceId=undefined
const streamId=undefined


function formatParams( params ){
  return "?" + Object
        .keys(params)
        .map(function(key){
          return key+"="+encodeURIComponent(params[key])
        })
        .join("&")
}


function inputApiKey (app, onValidValue, onInvalidValue){
  const form_api_key = document.createElement('form');
  var alphaExp = /^[0-9a-fA-F]{32}$/;
  form_api_key.setAttribute('class', 'w3-container')
  let lab = document.createElement('label')
  lab.textContent ="Clé API"
  form_api_key.appendChild(lab)
  let inp = document.createElement('input')
  inp.setAttribute('type', 'text')
  inp.setAttribute('name', 'api_key')

  if (kAPI != undefined) {
    inp.value = kAPI
    if (inp.value.match(alphaExp)) {
      inp.setAttribute('class', 'w3-input')
      onValidValue(inp.value)
    } else {
      inp.setAttribute('class', 'w3-input w3-border w3-pale-blue')
      onInvalidValue(inp.value)
    }
  }
  inp.addEventListener('keyup', function (evt) { // use change here. not neccessarily
      //console.log ("Texte is :" + this.value)

      if (this.value.match(alphaExp)) {
          this.setAttribute('class', 'w3-input')
          this.setAttribute('valid', 'true')
          //console.log ("Well formated :" + this.value)
          onValidValue(this.value)
      } else {
          this.setAttribute('class', 'w3-input w3-border w3-pale-blue')
          this.setAttribute('valid', 'false')

          onInvalidValue(this.value)
      }
  }, false);
  form_api_key.appendChild(inp)
  app.appendChild(form_api_key)
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

'https://liveobjects.orange-business.com/api/v0/apiKeys/current_key'
function  retrieveKeyInfo (api_key, key_listener) {

  var url = 'https://liveobjects.orange-business.com/api/v0/apiKeys/current_key'
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
      key_listener(data)
    } else {
      console.log('error')
    }
  }
  request.send()
}


const app = document.getElementById('root')


const logo = document.createElement('img');
logo.src = 'logo.svg';
app.appendChild(logo)


function listTenants(app, tenants ) {
  var container = document.createElement('div')
  container.setAttribute('class', 'w3-container')
  container.setAttribute('id', 'list_tenants')

  var laListe = document.createElement('ul')
  laListe.setAttribute('class', 'w3-ul w3-hoverable')

  app.appendChild(container)
  container.appendChild(laListe)
  //console.log(tenants)
  tenants.filter((elem) => ((elem.active == true) && (elem.expired == false))).forEach( (elem) =>{
    let li = document.createElement('li')
    li.textContent = `${elem.nonce} ${elem.id} ${elem.description}`
    laListe.appendChild(li)
  })
}

function displayKey(app, api_key, key_info ) {
  var container = document.createElement('div')
  container.setAttribute('class', 'w3-container')
  container.setAttribute('id', 'key_info')

  var unLabel = document.createElement('label')
  unLabel.setAttribute('class', 'w3-ul w3-hoverable')
  unLabel.textContent =key_info.label + ", tenant Id: "+key_info.tenantId + ", description "+ key_info.description
  container.appendChild(unLabel)

  app.appendChild(container)
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

function listFiFos(app, fifos ) {
  var container = document.createElement('div')
  container.setAttribute('class', 'w3-container')
  container.setAttribute('id', 'list_fifos')

  var laListe = document.createElement('ul')
  laListe.setAttribute('class', 'w3-ul w3-hoverable')

  app.appendChild(container)
  container.appendChild(laListe)
  //console.log(tenants)
  fifos.filter((elem) => true).forEach( (elem) =>{
    let li = document.createElement('li')
    li.textContent = `${elem.name} ${elem.messages} ${elem.consumers}`
    laListe.appendChild(li)
  })
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

function listDevices(app,  devices ){
  var container = document.createElement('div')
  container.setAttribute('class', 'w3-container')
  container.setAttribute('id', 'list_devices')

  var laListe = document.createElement('ul')
  laListe.setAttribute('class', 'w3-ul w3-hoverable')

  app.appendChild(container)
  container.appendChild(laListe)
  //console.log(tenants)
  devices.filter((elem) => true).forEach( (elem) =>{
    let li = document.createElement('li')
    li.textContent = `${elem.id} ${elem.name} `
    laListe.appendChild(li)
  })
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



function inputOrSelectDeviceId (app, devices, onNewValueHandler, onValidValueHandler, onInvalidValueHandler) {

  const form = document.createElement('form');
  var deviceIdRegExp = /^[0-9a-zA-Z]*:[0-9a-zA-Z]*$/;
  form.setAttribute('class', 'w3-container')
  form.setAttribute('autocomplete', 'off')

  let lab = document.createElement('label')
  lab.textContent ="Device Id"
  form.appendChild(lab)

  var container = document.createElement('div')
  container.setAttribute('class', 'autocomplete')
  container.setAttribute('style', 'width:300px;')
  form.appendChild(container)


  let inp = document.createElement('input')
  inp.setAttribute('type', 'text')
  inp.setAttribute('name', 'device_id')
  inp.setAttribute('id', 'myInput');
  inp.setAttribute('placeholder', 'DeviceId');
  inp.setAttribute('class', 'w3-input w3-border w3-pale-blue')

  let arr = Array.from(devices, d=>d.id.substring(12))
  //console.log(arr)
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              inp.setAttribute('class', 'w3-input')
              inp.setAttribute('valid', 'true')
              closeAllLists();
              onValidValueHandler("urn:lo:nsid:"+inp.value);
          });
          a.appendChild(b);
        }
      }
  });

  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });


  if (deviceId != undefined) {
    inp.value = deviceId.substring(12)
    if (inp.value.match(deviceIdRegExp)) {
      if (arr.includes (inp.value)) {
        inp.setAttribute('class', 'w3-input')
        onValidValueHandler('urn:lo:nsid:'+inp.value)
      } else {
        onNewValueHandler('urn:lo:nsid:'+this.value)
      }
    } else {
      inp.setAttribute('class', 'w3-input w3-border w3-pale-blue')
      onInvalidValueHandler('urn:lo:nsid:'+inp.value)
    }
  }
  inp.addEventListener('keyup', function (evt) { // use change here. not neccessarily
      //console.log ("Texte is :" + this.value)

      if (this.value.match(deviceIdRegExp)) {
          this.setAttribute('valid', 'true')
          if (this.value in arr) {
            this.setAttribute('class', 'w3-input')
            onValidValueHandler(this.value)
          } else {
            this.setAttribute('class', 'w3-input w3-border')
            onNewValueHandler(this.value)
          }
          //console.log ("Well formated :" + this.value)

      } else {
          this.setAttribute('class', 'w3-input w3-border w3-pale-blue')
          this.setAttribute('valid', 'false')

          onInvalidValueHandler(this.value)
      }
  }, false);
  form.appendChild(inp)
  app.appendChild(form)

}


function inputOrSelectStreamId (app, streams, onNewValueHandler, onValidValueHandler, onInvalidValueHandler) {

  const form = document.createElement('form');
  var streamIdRegExp = /^[A-Za-z0-9!:%]]*$/;
  form.setAttribute('class', 'w3-container')
  form.setAttribute('autocomplete', 'off')

  let lab = document.createElement('label')
  lab.textContent ="Stream Id"
  form.appendChild(lab)

  var container = document.createElement('div')
  container.setAttribute('class', 'autocomplete')
  container.setAttribute('style', 'width:300px;')
  form.appendChild(container)


  let inp = document.createElement('input')
  inp.setAttribute('type', 'text')
  inp.setAttribute('name', 'stream_id')
  inp.setAttribute('id', 'myInput');
  inp.setAttribute('placeholder', 'Stream Id');
  inp.setAttribute('class', 'w3-input w3-border w3-pale-blue')

  var arr = Array.from(streams, d=>d.streamId)
  //console.log(arr)
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              inp.setAttribute('class', 'w3-input')
              inp.setAttribute('valid', 'true')
              closeAllLists();
              onValidValueHandler(inp.value);
          });
          a.appendChild(b);
        }
      }
  });

  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });


  if (streamId != undefined) {
    inp.value = streamId
    if (inp.value.match(streamIdRegExp)) {
      inp.setAttribute('class', 'w3-input')
      onValidValueHandler(inp.value)
    } else {
      inp.setAttribute('class', 'w3-input w3-border w3-pale-blue')
      onInvalidValueHandler(inp.value)
    }
  }
  inp.addEventListener('keyup', function (evt) { // use change here. not neccessarily
      //console.log ("Texte is :" + this.value)

      if (this.value.match(streamIdRegExp)) {
          this.setAttribute('valid', 'true')
          if (this.value in arr) {
            this.setAttribute('class', 'w3-input')
            onValidValueHandler(this.value)
          } else {
            this.setAttribute('class', 'w3-input w3-border')
            onNewValueHandler(this.value)
          }
          //console.log ("Well formated :" + this.value)

      } else {
          this.setAttribute('class', 'w3-input w3-border w3-pale-blue')
          this.setAttribute('valid', 'false')

          onInvalidValueHandler(this.value)
      }
  }, false);
  form.appendChild(inp)
  app.appendChild(form)

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
      //console.log(data)
      stream_listener(data)
    } else {
      console.log('error')
    }
  }
  request.send()


}

function buildTimeGraph(stored_messages) {
  let variables_to_display = stored_messages
                            .filter(msg => msg.value.variable.startsWith('ibo_p'))
                            .map (msg => msg.value.variable)
                            .filter((value, index, self) => self.indexOf(value) === index)
  console.log (variables_to_display)

  let description_time_graph = { signal: [], edge: [] }
  variables_to_display.forEach(varName => description_time_graph.signal.push ({
    name : varName,
    wave : 'x',
    node : ''
  }))
  let msg_to_process = stored_messages
    .filter(msg => variables_to_display.includes(msg.value.variable))
    .sort ((msg1, msg2) => msg1.value.timestamp2 >= msg2.value.timestamp2)
  //variables_to_display = stored_messages.filter (msg => true)
  let current_ts = undefined

  for( unMsg of msg_to_process){
    //console.log(msg)
    console.log (unMsg.value.variable + ' ' + unMsg.value.valeur +' '+ unMsg.value.timestamp2+ ' ' + unMsg.value.timestamp)
    if (current_ts == undefined) {
      for (sig of description_time_graph.signal) {
        if (sig.name === unMsg.value.variable) {
          sig.wave = sig.wave + ((unMsg.value.valeur == 0)? '0':'1')
          sig.node = sig.node + '.'
        } else {
          sig.wave = sig.wave + '.'
          sig.node = sig.node + '.'
        }
      }
    } else {

      if (unMsg.value.timestamp == current_ts) {
        let sig = description_time_graph.signal.filter (s => s.name == unMsg.value.variable)[0]
        sig.wave = sig.wave.replace(/.$/,(unMsg.value.valeur == 0)? '0':'1')
        sig.node = sig.node + '.'

      } else {
        for (sig of description_time_graph.signal) {
          if (sig.name === unMsg.value.variable) {
            sig.wave = sig.wave + ((unMsg.value.valeur == 0)? '0':'1')
            sig.node = sig.node + '.'
          } else {
            sig.wave = sig.wave + '.'
            sig.node = sig.node + '.'
          }
        }

      }
    }
    current_ts = unMsg.value.timestamp
  }
  console.log(description_time_graph)
  //let description_time_graph = { signal: [], edge: [] }
  // description_time_graph.signal.push({ name: 'A', wave: '01........0....',  node: '.a........j' });
  // description_time_graph.signal.push({ name: 'B', wave: '0.1.......0.1..',  node: '..b.......i' });
  // description_time_graph.signal.push({ name: 'C', wave: '0..1....0...1..',  node: '...c....h..' });
  // description_time_graph.signal.push({ name: 'D', wave: '0...1..0.....1.',  node: '....d..g...' });
  // description_time_graph.signal.push({ name: 'E', wave: '0....10.......1',  node: '.....ef....' });
  // description_time_graph.edge = [
  //   'a~b t1', 'c-~a t2', 'c-~>d time 3', 'd~-e',
  //   'e~>f', 'f->g', 'g-~>h', 'h~>i some text', 'h~->j'
  // ]
  return description_time_graph
}
function listStoredDataMessages(app, stored_messages) {

  var container = document.createElement('div')
  container.setAttribute('class', 'w3-container')
  container.setAttribute('id', 'time_diagram')
  console.log(stored_messages)
  var my_awesome_script = document.createElement('script');
  my_awesome_script.setAttribute('type','WaveDrom');

  the_graph = buildTimeGraph(stored_messages)
// { name: 'A', wave: '01........0....',  node: '.a........j' },
// { name: 'B', wave: '0.1.......0.1..',  node: '..b.......i' },
// { name: 'C', wave: '0..1....0...1..',  node: '...c....h..' },
// { name: 'D', wave: '0...1..0.....1.',  node: '....d..g...' },
// { name: 'E', wave: '0....10.......1',  node: '.....ef....' }
//],
//edge:
//}
  my_awesome_script.textContent = JSON.stringify(
      the_graph
   )
   app.appendChild(container)
   container.appendChild(my_awesome_script)
   WaveDrom.ProcessAll()
  // var container = document.createElement('div')
  // container.setAttribute('class', 'w3-container')
  // container.setAttribute('id', 'list_messages')
  //
  // let laListe = document.createElement('ul')
  // laListe.setAttribute('class', 'w3-ul w3-hoverable')
  //
  // app.appendChild(container)
  // container.appendChild(laListe)
  //
  // stored_messages.filter((elem) => true).forEach( (elem) =>{
  //   let li = document.createElement('li');
  //   li.textContent = `${elem.value.timestamp} ${elem.value.variable} ${elem.value.v}`;
  //   laListe.appendChild(li);
  // })
}



inputApiKey (app, onValidValue = (api_key) => {
  console.log ("Valid API Key :" + api_key)
  retrieveKeyInfo (api_key, (info) => {
    //console.log (info);
    //displayKey(app, api_key, info );

    retrieveDevices(api_key, (devices)=> {
      console.log (devices);
      listDevices(app,  devices );
      document.getElementById("list_devices").style.display = "none";

      inputOrSelectDeviceId (app, devices,
         onNewValue = (device_id) => {
           console.log("New Device Id" + device_id);
         },
         onValidValue = (device_id) => {
           console.log("Selected Device Id" + device_id);
           retrieveDeviceInfo (api_key, device_id, (deviceInfo) => {
             console.log ("device info:" + deviceInfo);
             retrieveDeviceStreams (api_key,device_id, (streams) => {
              //console.log ("streams")
              //console.log (streams)
              inputOrSelectStreamId (app, streams,
                 onNewValueHandler= (streamId) => {
                   console.log("New Stream Id" + streamId);
                 },
                 onValidValueHandler= (streamId) => {
                   console.log("Valid Stream Id" + streamId);
                   retrieveStreamContent (api_key, streamId, (StoredDataMessages) => {
                     //console.log("Stored Data Messages" );
                     //console.log(StoredDataMessages);
                     listStoredDataMessages(app, StoredDataMessages)
                   })
                 },
                 onInvalidValueHandler= (streamId) => {
                   console.log("Invalid Stream Id" + streamId);
                 })
             })

           })

        console.log("" + device_id);
      }, onInvalidDeviceId = (device_id) => {

      })

    })
    // //if ('BUS_CONFIG_R' in info.rules){
    //   retrieveFifos(api_key, (fifos)=> {
    //     //console.log (fifos);
    //     listFiFos(app,  fifos );
    //     document.getElementById("list_fifos").style.display = "none";
    //
    //   })
    // //}
    // //if ('BUS_CONFIG_R' in info.rules){
    //   retrieveTenants (api_key, (tenants) => {
    //     //console.log (tenants)
    //     listTenants(app, tenants)
    //     document.getElementById("list_tenants").style.display = "none";
    //   })
    // //}
  })

}, onInvalidValue = (api_key) => {
  console.log ("Invalid API Key :" + api_key);
  if (document.getElementById("list_tenants") != null)
    document.getElementById("list_tenants").remove();
  if (document.getElementById("key_info") != null)
    document.getElementById("key_info").remove();
  // document.getElementById("list_tenants").style.display = "none";
  // document.getElementById("key_info").style.display = "none";
})
