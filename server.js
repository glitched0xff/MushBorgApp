const express = require("express");
const fileUpload = require('express-fileupload');
const fs=require("fs")
//
const session = require('express-session');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
//
const app = express();
const cors = require("cors");
var path = require("path");
require('dotenv').config()
const mqtt = require("mqtt");


//
// Middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(fileUpload()); 
// Configurazione della sessione (in memoria)
app.use(session({
  secret: 'dmfgasi6753468924y',
  resave: false,
  saveUninitialized: false,
  cookie: {
    maxAge: 1000 * 60 * 60 * 24 // 1 ora
  }
}));
//

// CORS
var corsOptions = {
  origin: "http://localhost:3001"
};
app.use(cors(corsOptions));

app.use(express.static(path.join(__dirname, "public")));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Config Ejs
const config = JSON.parse(fs.readFileSync("templateConfig.json", "utf-8"));
app.locals.config = config;

// Configurazione routes
let routeIndex = require('./routes/routeIndex');
app.use('/', routeIndex);
let user = require('./routes/user');
app.use('/user', user);
let telemetry = require('./routes/telemetry');
app.use('/telemetry', telemetry);
let device = require('./routes/device');
app.use('/device', device);
let toDo = require('./routes/todo');
app.use('/toDo', toDo);
let calendar = require('./routes/calendar');
app.use('/calendar', calendar);
let diaryNote = require('./routes/diaryNote');
app.use('/diaryNote', diaryNote);
let search = require('./routes/search.js');
app.use('/search', search);

// Management
let materialCategory = require('./routes/management/materialCategory.js');
app.use('/materialCategory', materialCategory);
let rawMaterial = require('./routes/management/rawMaterial.js');
app.use('/rawMaterial', rawMaterial);
let supplier = require('./routes/management/supplier.js');
app.use('/supplier', supplier);
let recipes = require('./routes/management/recipes.js');
app.use('/recipes', recipes);
let recipeElement = require('./routes/management/recipeElement.js');
app.use('/recipeElement', recipeElement);
let substrate = require('./routes/management/substrate.js');
app.use('/substrate', substrate);
let substrateElement = require('./routes/management/substrateElement.js');
app.use('/substrateElement', substrateElement);
let strain = require('./routes/management/strain.js');
app.use('/strain', strain);
let spawn = require('./routes/management/spawn.js');
app.use('/spawn', spawn);
let propagation = require('./routes/management/propagation.js');
app.use('/propagation', propagation);
let storage = require('./routes/storage.js');
app.use('/storage', storage);
let container = require('./routes/management/container.js');
app.use('/container', container);
let mushElement = require('./routes/management/mushElement.js');
app.use('/mushElement', mushElement);
let inoculum = require('./routes/management/inoculum.js');
app.use('/inoculum', inoculum);
let statistic = require('./routes/statistic.js');
app.use('/statistic', statistic);
let print = require('./routes/print.js');
app.use('/print', print);
const sensorData=require("./controllers/sensorData.controller.js")
// Connessione server mqtt in locale e storing dei messaggi
// TODO: Controllo della provenienza del messaggio tramite il topic, l'indirizzo del topic deve essere un cod_sensore approvato e registrato
  // let clientMQTT = mqtt.connect("mqtt://127.0.0.1"); 
  // clientMQTT.on('connect', () => {
  //     console.log('Connected')
  //     clientMQTT.subscribe("#", () => {
  //       console.log(`Subscribe to topic #`)
  //     })
  //     clientMQTT.on('message', (topic, payload) => {
  //         sensorData.create(topic,payload)
  //       })
  //   })


// Start server
const PORT = process.env.PORT || 3000;
const SENSOR_ENABLE=process.env.SENSOR_ENABLE
//require("./routes/user.route.js")(app);
app.listen(PORT,async () => {

  // Connessione al db
const db = require("./models");
db.sequelize.sync()
  .then(() => {
    console.log("Synced db.");
  })
  .catch((err) => {
    console.log("Failed to sync db: " + err.message);
  });


  if (SENSOR_ENABLE=="true"){
    await sensorData.setCron()
  }else{console.log("# ATTENZIONE: SENSORI ACQUISIZIONE DATI DISABILITATI")}
  console.log(`Server is running on port ${PORT}.`);
})