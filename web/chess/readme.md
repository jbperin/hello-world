

https://github.com/exoticorn/stockfish-js

https://chessboardjs.com/

https://github.com/jhlywa/chess.js/


`.\chrome.exe --allow-file-access-from-files`



I use a workaround. Chrome blocks Worker but not <script>. Hence the best way to make a universal solution is this:

```javascript
function worker_function() {
    // all code here
}
// This is in case of normal worker start
// "window" is not defined in web worker
// so if you load this file directly using `new Worker`
// the worker code will still execute properly
if(window!=self)
  worker_function();
You then link it as normal <script src="...". And once the function is defined, you use this abomination of a code:

new Worker(URL.createObjectURL(new Blob(["("+worker_function.toString()+")()"], {type: 'text/javascript'})));

```



http://base64online.org/encode/

```javascript
const myWorker = new Worker("data:application/x-javascript;base64,b25tZXNzYW...");
```


https://github.com/oakmac/chessboardjs/issues/160
