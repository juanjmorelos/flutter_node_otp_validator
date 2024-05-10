var cors = require('cors')
var routes = require('./routes/router')
var express = require('express');
var bodyParser = require('body-parser');

var app = express();

app.use(cors())

var port = process.env.PORT || 3525;

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());
app.use(routes)


app.listen(port, function(){
	console.log(`Server running in http://localhost:${port}`);
});