

function formatParams( params ){
  return "?" + Object
        .keys(params)
        .map(function(key){
          return key+"="+encodeURIComponent(params[key])
        })
        .join("&")
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
  //request.setRequestHeader("Content-type",'application/json')

  console.log ("retrieveKeyInfo API Key " + api_key);
  request.onload = function () {
    console.log ("retrieveKeyInfo API Key onLoad");
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
      //stream_listener(data)
    } else {
      console.log('error')
    }
  }
  request.send()
}

function retrievePagedStreamContent (api_key, stream_id, stream_listener, nb_max_page = 2, bookmark_id, onFinishHandler) {
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
        //console.log(data)
        //console.log(data[data.length -1].id)
        if (data.length < record_per_page) {
          console.log ("Reached the end of stream")
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
