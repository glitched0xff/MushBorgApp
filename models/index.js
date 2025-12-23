const dbConfig = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  dialect: "mariadb",
  //operatorsAliases: false,
  //logging:console.log,
  logging: false,
  pool: {
    max: dbConfig.pool.max,
    min: dbConfig.pool.min,
    acquire: dbConfig.pool.acquire,
    idle: dbConfig.pool.idle,
  }
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.user = require("./user.model.js")(sequelize, Sequelize);
db.sensorData = require("./sensorData.model.js")(sequelize, Sequelize);
db.storage = require("./storage.model.js")(sequelize, Sequelize);
db.device = require("./device.model.js")(sequelize, Sequelize);
db.toDo = require("./toDo.model.js")(sequelize, Sequelize);
db.unknowMessage = require("./unknowMessage.model.js")(sequelize, Sequelize);
db.calendar = require("./calendar.model.js")(sequelize, Sequelize);
db.calendarCategory = require("./calendarCategory.model.js")(sequelize, Sequelize);
db.diaryNote = require("./diaryNote.model.js")(sequelize, Sequelize);
// Managment
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
 db.propagation = require("./management/propagation.model.js")(sequelize, Sequelize);
 db.fructification = require("./management/fructification.model.js")(sequelize, Sequelize);
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
 db.speciesTemplate = require("./management/speciesTemplate.model.js")(sequelize, Sequelize);
 
db.seed.associate(db)
db.strain.associate(db)
db.species.associate(db)
db.spawn.associate(db)
db.substrate.associate(db)
db.substrateElement.associate(db)
db.propagation.associate(db)
db.container.associate(db)
db.mushElementNote.associate(db)
db.mushElement.associate(db)
db.materialCategory.associate(db)
db.rawMaterial.associate(db)

module.exports = db;