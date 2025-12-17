/**
 * Svg ERD
 **/

const generateERD = require('sequelize-erd');
const { sequelize } = require('./models'); // la tua init dei modelli
require('dotenv').config()
const db = require("./models");
sequelize.sync()
  .then(() => {
    console.log("Synced db.");
  })
  .catch((err) => {
    console.log("Failed to sync db: " + err.message);
  });

(async () => {
  const svg = await generateERD({ source: sequelize });
  require('fs').writeFileSync('diagram.svg', svg);
})();