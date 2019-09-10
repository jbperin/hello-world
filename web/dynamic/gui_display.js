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
