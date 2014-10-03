var mongoClient = require('mongodb').MongoClient;
var ObjectID = require('mongodb').ObjectID;
var express = require('express');
var bodyParser  = require('body-parser');
var app = express();

app.use('/component', express.static(__dirname + '/public/component/'));
app.use('/css', express.static(__dirname + '/public/app/css'));
app.use('/img',express.static(__dirname + '/public/app/img'));
app.use('/js',express.static(__dirname + '/public/app/js'));

var sendOptions = {root: __dirname + '/public/app/'};

console.log('Start');

mongoClient.connect('mongodb://corkadmin:corkpassword@ds043190.mongolab.com:43190/birthday-corkboard', function(err, db){

  if(!err) {
    console.log('Connected to mongo');
  }

  app.use(bodyParser.json());

  app.get('/', function(req, res) {
    res.sendFile('app.html', sendOptions);
  });

  app.get('/birthdays', function(req, res) {
      var collection = db.collection('birthdays');
      collection.find().toArray(function(err, birthdays) {
          res.format({
              json: function() {
                  res.send(birthdays);
              }
          });
      });
  });

  var server = app.listen(process.env.PORT || 5000, function() {
    console.log('Listening on port %d', server.address().port);
  });

});