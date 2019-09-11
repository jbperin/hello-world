
const kAPI=myCredentials.liveobjects.password
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




const app = document.getElementById('root')


const logo = document.createElement('img');
logo.src = 'logo.svg';
app.appendChild(logo)





function buildTimeGraph(stored_messages) {
  let variables_to_display = stored_messages
                            //.filter(msg => msg.value.variable.startsWith('ibo_p'))
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
    console.log ("Retrieving Key Info");
    console.log (info);
    displayKey(app, api_key, info );

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
