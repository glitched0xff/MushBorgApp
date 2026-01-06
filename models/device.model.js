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
      hume:{type: Sequelize.INTEGER},
      hums:{type: Sequelize.INTEGER},
      ligh:{type: Sequelize.INTEGER},
      co2:{type: Sequelize.INTEGER},
      levl:{type: Sequelize.INTEGER},
      wind:{type: Sequelize.INTEGER},
      type:{type:Sequelize.STRING},
      cronString:{
        type: Sequelize.STRING
      },
      active:{type:Sequelize.INTEGER},
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