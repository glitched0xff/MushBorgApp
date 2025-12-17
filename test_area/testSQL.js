require('dotenv').config()
const db = require("./models")
db.sequelize.sync()
  .then(() => {
    console.log("Synced db.");
    let container=db.container.findOne({where:{id:17}})
    return container
  })
  .then(container=>{
    console.log(container)
  })
  .catch((err) => {
    console.log("Failed to sync db: " + err.message);
  });

