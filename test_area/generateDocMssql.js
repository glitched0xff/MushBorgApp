
const fs=require("fs")
const db = require("./models");
db.sequelize.sync()
  .then(async(result) => {
    console.log(result)
    console.log("Synced db.");
    //await generateDocumentation();
  })
  .catch((err) => {
    console.log("Failed to sync db: " + err.message);
  });




