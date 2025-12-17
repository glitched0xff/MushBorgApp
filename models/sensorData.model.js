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
      hum: {
        type: Sequelize.STRING
      },
      co2: {
        type: Sequelize.BOOLEAN
      },
      status:{
        type: Sequelize.BOOLEAN
      },
      flag01:{
        type: Sequelize.BOOLEAN
      },
      flag02:{
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
    }
    return SensorData;
  };