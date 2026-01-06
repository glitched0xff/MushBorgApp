module.exports = (sequelize, Sequelize) => {
    const SensorData = sequelize.define("sensorData", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      cod_device: {
        type: Sequelize.STRING
      },
      temp: {
        type: Sequelize.STRING
      },
      hume: {
        type: Sequelize.STRING
      },
      hums: {
        type: Sequelize.STRING
      },
      co2: {
        type: Sequelize.BOOLEAN
      },
      levl: {
        type: Sequelize.BOOLEAN
      },
      ligh: {
        type: Sequelize.BOOLEAN
      },
      wind: {
        type: Sequelize.BOOLEAN
      },
      battery:{
        type: Sequelize.BOOLEAN
      },
      status:{
        type: Sequelize.BOOLEAN
      },
      deviceId:{
        type: Sequelize.INTEGER
      },
      storageId:{
        type: Sequelize.INTEGER
      },
      createdAt: {
        type: Sequelize.DATE
      },
      updatedAt: {
        type: Sequelize.DATE
      }
    });
    SensorData.associate = (models) => {
      SensorData.belongsTo(models.device, {foreignKey: "deviceId"});
       SensorData.belongsTo(models.associateSensor, {
    foreignKey: 'deviceId',
    targetKey: 'deviceId'
  });
    }
    return SensorData;
  };