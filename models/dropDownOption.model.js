const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const DDOption = sequelize.define("dDOption", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      txt:{
        type: Sequelize.STRING
      },
      val:{
        type: Sequelize.INTEGER
      },
      ddMenu:{
        type: Sequelize.STRING,
        allowNull: false,
      }
    });
    return DDOption;
  };