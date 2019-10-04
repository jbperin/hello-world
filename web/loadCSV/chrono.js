function buildTimeGraph(stored_messages, selected_variables = undefined, soughtSequence = undefined) {
  let tab_seq = undefined
  if (soughtSequence != undefined) {
    tab_seq = JSON.parse(soughtSequence)
  }
  let variables_to_display = stored_messages
                            //.filter(msg => msg.value.variable.startsWith('ibo_p'))
                            .map (msg => msg.value.variable)
                            .filter((value, index, self) => self.indexOf(value) === index)

  function convert_value(value) {return  (value == "0")? 0: 1};

  let description_time_graph = { signal: [], edge: [] }

  variables_to_display.forEach(varName => description_time_graph.signal.push ({
    name : varName,
    wave : 'x',
    node : '.'
  }))

  let current_ts = undefined
  let lst_nod = undefined
  let beacons = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
  function beacons_shift() {
    beac = beacons.shift()
    if (beac == 'a') {
    } else if (beac == 'b') {
      description_time_graph.edge.push('a~>b t'+(25-beacons.length))
    } else {
      description_time_graph.edge.push(lst_nod+'~>'+beac + ' t'+(25-beacons.length))
    }
    lst_nod = beac
    return (beac)
  }
  let msg_to_process = stored_messages
    .filter(msg => variables_to_display.includes(msg.value.variable))
    .sort ((msg1, msg2) => msg1.value.timestamp2 >= msg2.value.timestamp2)

  function isNextAwaitedEvent (variable, valeur){
    if ((tab_seq.length != 0) &&(tab_seq[0].v==variable) && (tab_seq[0].t == convert_value(valeur))) {
      tab_seq.shift()
      return true;
    }
    return false ;
  }
  for( unMsg of msg_to_process){
    nxt_event = isNextAwaitedEvent (unMsg.value.variable, unMsg.value.valeur)
    //console.log (unMsg.value.variable + ' ' + unMsg.value.valeur +' '+ unMsg.value.timestamp2+ ' ' + unMsg.value.timestamp)
    if (current_ts == undefined) {
      for (let sig of description_time_graph.signal) {
        if (sig.name === unMsg.value.variable) {
          sig.wave = sig.wave + convert_value(unMsg.value.valeur)
          let node_entry = (nxt_event &&(beacons.length != 0))? beacons_shift(): '.';
          sig.node = sig.node + node_entry
        } else {
          sig.wave = sig.wave + '.'
          sig.node = sig.node + '.'
        }
      }
    } else {

      if (unMsg.value.timestamp == current_ts) {
        let sig = description_time_graph.signal.filter (s => s.name == unMsg.value.variable)[0]
        sig.wave = sig.wave.replace(/.$/,(unMsg.value.valeur == 0)? '0':'1')
        let node_entry = (nxt_event &&(beacons.length != 0))? beacons_shift(): '.';
        sig.node = sig.node.replace(/.$/,node_entry)

      } else {
        for (sig of description_time_graph.signal) {
          if (sig.name === unMsg.value.variable) {
            sig.wave = sig.wave + convert_value(unMsg.value.valeur)
            let node_entry = (nxt_event &&(beacons.length != 0))? beacons_shift(): '.';
            sig.node = sig.node + node_entry
          } else {
            sig.wave = sig.wave + '.'
            sig.node = sig.node + '.'
          }
        }

      }
    }
    current_ts = unMsg.value.timestamp
  }
  return description_time_graph
}

function displayTimeGraph(app, description_time_graph) {

  var container = document.createElement('div')
  container.setAttribute('class', 'w3-container')
  container.setAttribute('id', 'time_diagram')

  var my_awesome_script = document.createElement('script');
  my_awesome_script.setAttribute('type','WaveDrom');
  my_awesome_script.setAttribute('id', 'time_diagram_script')

  my_awesome_script.textContent = JSON.stringify(
      description_time_graph
   )
   app.appendChild(container)
   container.appendChild(my_awesome_script)
   WaveDrom.ProcessAll()
}
