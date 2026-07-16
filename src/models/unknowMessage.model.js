const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Device = sequelize.define("unknowMessage", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      from: {
        type: Sequelize.STRING
      },
      message:{
        type: Sequelize.STRING
      }
      
    });
  
    return Device;
  };