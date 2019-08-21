
const app = document.getElementById('root')


const logo = document.createElement('img');
logo.src = 'logo.svg';

const container = document.createElement('div')
container.setAttribute('class', 'w3-container')

const laListe = document.createElement('ul')
laListe.setAttribute('class', 'w3-ul w3-hoverable')


app.appendChild(logo)
app.appendChild(container)

container.appendChild(laListe)

function formatParams( params ){
  return "?" + Object
        .keys(params)
        .map(function(key){
          return key+"="+encodeURIComponent(params[key])
        })
        .join("&")
}

const kAPI="e36519a3c5474778a0f0d2a867843eba"
const streamId='urn:lo:nsid:flexy205:0475410668!uplink'

var encodedStreamId=encodeURIComponent(streamId)
var endpoint = "https://liveobjects.orange-business.com/api/v0/data/streams/"+encodedStreamId;
var params = {
  limit: 10,
}

var url = endpoint + formatParams(params)
// Create a request variable and assign a new XMLHttpRequest object to it.
var request = new XMLHttpRequest()
// Open a new connection, using the GET request on the URL endpoint
request.open('GET', url, true)
request.setRequestHeader("X-API-KEY",kAPI)
request.setRequestHeader("Accept",'application/json')
request.setRequestHeader("Content-type",'application/json')


request.onload = function () {
  var data = JSON.parse(this.response)

  if (request.status >= 200 && request.status < 400) {
    data.forEach(line => {
      console.log(line)

      const li = document.createElement('li')
      li.textContent = `${line.value.timestamp} ${line.value.timestamp2}`
      laListe.appendChild(li)
    })
  } else {
    console.log('error')
  }
}

// Send request
request.send()
