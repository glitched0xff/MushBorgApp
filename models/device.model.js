const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Device = sequelize.define("device", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      cod_device: {
        type: Sequelize.STRING
      },
      descrizione: {
        type: Sequelize.STRING
      },
      posizione: {
        type: Sequelize.STRING
      },
      storageId:{ type:Sequelize.INTEGER },
      ip:{type: Sequelize.STRING},
      url:{type: Sequelize.STRING},
      temp:{type: Sequelize.INTEGER},
      hum:{type: Sequelize.INTEGER},
      light:{type: Sequelize.INTEGER},
      co2:{type: Sequelize.INTEGER},

      cronString:{
        type: Sequelize.STRING
      },
      note: {
        type: Sequelize.BOOLEAN
      }
    });
    Device.associate = (models) => {
      Device.belongsTo(models.storage, {foreignKey: "storageId"});
      Device.hasMany(models.sensorData, {foreignKey: "deviceId"});

    }
    return Device;
  };