module.exports = (sequelize, Sequelize) => {
    const SensorHomeAssistant = sequelize.define("sensorHomeAssistant", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },

  class: {
    type:Sequelize.STRING,
  },
  sensor_code: {
    type:Sequelize.STRING,
  },
  friendly_name: {
    type:Sequelize.STRING,
  },
  val: {
    type:Sequelize.FLOAT,
  },
  unit_of_measurement: {
    type:Sequelize.STRING,
  },
  area: {
    type:Sequelize.STRING,
  },
  last_triggered: {
    type:Sequelize.DATE,
  },
    });
    return SensorHomeAssistant;
  };