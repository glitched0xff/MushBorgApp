
const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const AssociateActuator = sequelize.define("associateActuator", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      valueName:{ type:Sequelize.STRING },
      sensorId:{ type:Sequelize.INTEGER },
      switch:{ type:Sequelize.INTEGER },
      topicMqtt:{ type:Sequelize.STRING },
      payloadType:{type:Sequelize.STRING},
      payloadMqttON:{ type:Sequelize.STRING }, 
        payloadMqttOFF:{ type:Sequelize.STRING }, 
      flagInterval:{ type:Sequelize.INTEGER },
      flagClock:{ type:Sequelize.INTEGER },
      valMin:{ type:Sequelize.FLOAT }, 
      valMax:{ type:Sequelize.FLOAT },
      timeOn:{ type:Sequelize.STRING }, 
      timeOff:{ type:Sequelize.STRING },
      label:{ type:Sequelize.STRING }, 
      postChr:{ type:Sequelize.STRING }, 
      icon:{ type:Sequelize.STRING }, 
      storageId:{ type:Sequelize.INTEGER }, 
      referenceSensorId:{ type:Sequelize.INTEGER }, 
      referenceField:{ type:Sequelize.STRING }, 
      inUse:{ type:Sequelize.INTEGER }, 
      version:{ type:Sequelize.INTEGER },
      active:{ type:Sequelize.INTEGER }
});
    AssociateActuator.associate = (models) => {
       AssociateActuator.belongsTo(models.storage, {foreignKey: "storageId"});
      //AssociateActuator.hasMany(models.sensorData, {foreignKey: "deviceId"});
    }
    return AssociateActuator;
  };        