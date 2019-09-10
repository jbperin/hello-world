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
