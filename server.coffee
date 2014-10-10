mongoClient = require('mongodb').MongoClient
ObjectID = require('mongodb').ObjectID
express = require('express')
bodyParser  = require('body-parser')
app = express()

app.use '/src', express.static __dirname + '/public/app/src/'
app.use '/element', express.static __dirname + '/public/element/'
app.use '/component', express.static __dirname + '/public/component/'
app.use '/css', express.static __dirname + '/public/app/css'
app.use '/img', express.static __dirname + '/public/app/img'
app.use '/js', express.static __dirname + '/public/app/js'

sendOptions = root: __dirname + '/public/app/'

console.log 'Start'

mongoClient.connect 'mongodb://corkadmin:corkpassword@ds043190.mongolab.com:43190/birthday-corkboard', 
  
  (err, db) ->

    if not err  
      console.log 'Connected to mongo'

    app.use bodyParser.json()

    app.get '/', (req, res) ->
      res.sendFile 'app.html', sendOptions
      console.log 'App was served'

    app.get '/birthdays', (req, res) ->
        collection = db.collection 'birthdays'
        options =
          "sort": "birthday"
        collection.find({}, options).toArray (err, birthdays) ->
            res.format
                json: -> 
                  res.send(birthdays);
                  console.log 'Request fulfilled'

    app.use (req, res) ->
      res.sendFile '404.html', sendOptions
      console.log 'Not found'

    server = app.listen process.env.PORT or 5000, -> console.log 'Listening on port %d', server.address().port