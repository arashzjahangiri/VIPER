

var express = require('express');
var app = express();
var dateTime = require('node-datetime');

app.get('/getCurrentDate', function(req, res) {

  res.type('application/json');

  // simulate network delay
  setTimeout(function() {
    var dt = dateTime.create();
    var formatted = dt.format('Y-m-d H:M:S');
    console.log(formatted);
    res.json({
      "data":{
          "status": true,
          "date": formatted
          }
        })
  }, 4000)

});

app.get('*', function(req, res) {
  res.type('text/plain');
  // simulate network delay
  setTimeout(function() {
  }, 4000)
});

var port = process.env.PORT || 3000
app.listen(port);
console.log("Listen on: http://localhost:"+port+"/")