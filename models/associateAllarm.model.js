
const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const AssociateAllarm = sequelize.define("associateAllarm", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      valueName:{ type:Sequelize.STRING },
      inUse:{type:Sequelize.INTEGER},
      sensorId:{ type:Sequelize.INTEGER },
      switch:{ type:Sequelize.INTEGER },
      topicMqtt:{ type:Sequelize.STRING },
      threshold:{ type:Sequelize.FLOAT },
      operator:{ type:Sequelize.STRING },
      label:{ type:Sequelize.STRING },
      postChr:{ type:Sequelize.STRING },
      icon:{ type:Sequelize.STRING },
      storageId:{ type:Sequelize.STRING },
      referenceSensorId:{ type:Sequelize.INTEGER },
      referenceField:{ type:Sequelize.STRING },
      sendMsg:{ type:Sequelize.STRING },
      sendMail:{ type:Sequelize.STRING },
      sendAllert:{ type:Sequelize.STRING },
      textColor:{ type:Sequelize.STRING },
      bgcolor:{ type:Sequelize.STRING },
      version:{ type:Sequelize.INTEGER },
      active:{ type:Sequelize.INTEGER },
});
    AssociateAllarm.associate = (models) => {
      AssociateAllarm.belongsTo(models.storage, {foreignKey: "storageId"});
      // AssociateAllarm.hasMany(models.sensorData, {foreignKey: "deviceId"});
    }
    return AssociateAllarm;
  };        
