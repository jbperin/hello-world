



```javascript
var nmsg=null;
var event_buffer=context.get('event_buffer') || undefined;
if (event_buffer === undefined) {
    context.set('event_buffer',[]);
    context.get('event_buffer').push(msg);
    nmsg = null;
} else {
    event_buffer.push (msg)// .sort()
    while (event_buffer.length > MAX_SIZE_OF_BUFF) {
        event_buffer.shift()
    }
    if (event_buffer.length >= 1) {
        // prepare series = ["A", "B", "C"];
        let series = event_buffer.map(e=>e.payload.variable).filter((value, index, self) =>  self.indexOf(value) === index ).sort()
        //["A", "B", "C"];
        labels = event_buffer.map(e=>e.timestamp);

        let data=[];
        series.forEach(e=>data.push([]))
        event_buffer.forEach(event => {
            data[series.indexOf(event.payload.variable)].push (
                {
                    "x":event.payload.timestamp,
                    "y":event.payload.value + 2*series.indexOf(event.payload.variable)
                }    
            )
        })
        nmsg = {"payload":[{"series": series,"data": data,"labels": labels}]}
        //nmsg = {"payload":[{}]}
        //nmsg = {"payload":[{}]}        
//event_buffer//.map((elem) => elem)
    } else {
        nmsg = null;
    }
}
```

# Resources
