const Sequelize = require("sequelize");
const tunnel = require("tunnel-ssh");
//const dbConfig = require("../config/db.config.js");

const sshConfig = {
  username: "",               // utente SSH del VPS
  password:"",
  host: "",    // IP o dominio del VPS
  port: 22,                       // porta SSH
 // privateKey: require("fs").readFileSync("/path/to/id_rsa"), // chiave privata SSH
  dstHost: "127.0.0.1",           // MySQL è locale sul VPS
  dstPort: 3306,                  // porta MySQL sul VPS
  localHost: "127.0.0.1",
  localPort: 3307                 // qualsiasi porta libera sul tuo PC
};

const dbConfig = {
  username: "admin",
  password: "",
  database: "mushborg",
  dialect: "mariadb",
  host: "127.0.0.1",  // Tunnel locale
  port: 3307          // stessa porta scelta sopra
};

function connectThroughSSH() {
  return new Promise((resolve, reject) => {
    tunnel(sshConfig, (error, server) => {
      if (error) {
        console.error("❌ Errore creazione tunnel SSH:", error);
        return reject(error);
      }

      console.log("✅ Tunnel SSH creato. Connessione locale sulla porta 3307");

      // Configurazione Sequelize passando per il tunnel
      const sequelize = new Sequelize(
        dbConfig.DB,
        dbConfig.USER,
        dbConfig.PASSWORD,
        {
          host: sshConfig.localHost,
          port: sshConfig.localPort,
          dialect: dbConfig.dialect,
          logging: false,
          pool: dbConfig.pool,
        }
      );

      resolve(sequelize);
    });
  });
}


module.exports = (async () => {
  const sequelize = await connectThroughSSH();

  const db = {};
  db.Sequelize = Sequelize;
  db.sequelize = sequelize;

  // ✅ Carica tutti i tuoi modelli come prima
  db.user = require("./user.model.js")(sequelize, Sequelize);
  db.sensorData = require("./sensorData.model.js")(sequelize, Sequelize);
  db.storage = require("./storage.model.js")(sequelize, Sequelize);
  db.device = require("./device.model.js")(sequelize, Sequelize);
  db.toDo = require("./toDo.model.js")(sequelize, Sequelize);
  db.unknowMessage = require("./unknowMessage.model.js")(sequelize, Sequelize);
  db.calendar = require("./calendar.model.js")(sequelize, Sequelize);
  db.calendarCategory = require("./calendarCategory.model.js")(sequelize, Sequelize);
  db.diaryNote = require("./diaryNote.model.js")(sequelize, Sequelize);

  // Management models
  db.materialCategory = require("./management/materialCategory.model.js")(sequelize, Sequelize);
  db.rawMaterial = require("./management/rawMaterial.model.js")(sequelize, Sequelize);
  db.supplier = require("./management/supplier.model.js")(sequelize, Sequelize);
  db.recipeElement = require("./management/recipeElement.model.js")(sequelize, Sequelize);
  db.recipe = require("./management/recipes.model.js")(sequelize, Sequelize);
  db.substrateElement = require("./management/substrateElement.model.js")(sequelize, Sequelize);
  db.substrate = require("./management/substrate.model.js")(sequelize, Sequelize);
  db.species = require("./management/species.model.js")(sequelize, Sequelize);
  db.strain = require("./management/strain.model.js")(sequelize, Sequelize);
  db.spawn = require("./management/spawn.model.js")(sequelize, Sequelize);
  db.spawnElement = require("./management/spawnElement.model.js")(sequelize, Sequelize);
  db.spawnElementNote = require("./management/spawnElementNote.model.js")(sequelize, Sequelize);
  db.propagation = require("./management/propagation.model.js")(sequelize, Sequelize);
  db.propagationElement = require("./management/propagationElement.model.js")(sequelize, Sequelize);
  db.fructification = require("./management/fructification.model.js")(sequelize, Sequelize);
  db.fructificationElement = require("./management/fructificationElement.model.js")(sequelize, Sequelize);
  db.fructificationFlush = require("./management/fructificationFlush.model.js")(sequelize, Sequelize);
  db.pretreatment = require("./management/pretreatment.model.js")(sequelize, Sequelize);
  db.container = require("./management/container.model.js")(sequelize, Sequelize);
  db.containerType = require("./management/containerType.model.js")(sequelize, Sequelize);
  db.inoculum = require("./management/inoculum.model.js")(sequelize, Sequelize);
  db.dDOption = require("./dropDownOption.model.js")(sequelize, Sequelize);
  db.mushElement = require("./management/mushElement.model.js")(sequelize, Sequelize);
  db.mushElementNote = require("./management/mushElementNote.model.js")(sequelize, Sequelize);
  db.seed = require("./management/seed.model.js")(sequelize, Sequelize);
  db.movimentation = require("./management/movimentation.model.js")(sequelize, Sequelize);
  db.mushElementHarvest = require("./management/mushElementHarvest.model.js")(sequelize, Sequelize);
  console.log(db)
  return db;
})();