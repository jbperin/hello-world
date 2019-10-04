
# Utiliser l'API LiveObject en Javascript


Cet article présente
[Collections PostMan pour LiveObject](https://github.com/DatavenueLiveObjects/Postman-collections-for-Live-Objects)




```javascript

  let request = new XMLHttpRequest()

  request.open('GET','https://liveobjects.orange-business.com/api/v0/apiKeys/current_key', true)
  request.setRequestHeader("X-API-KEY",api_key)
  request.setRequestHeader("Accept",'application/json')

  request.onload = function () {
    var data = JSON.parse(this.response)
    if (request.status == 200) {
      key_info_received(data)
    } else {
       if (request.status == 400) {
         console.log('error 400')
       } else if (request.status == 404){
         console.log('error 404')
       } else {
         console.log('error '+ request.status)
       }
       if (key_error !== undefined) {key_error()}
    }
  }
  request.send()
}
```
