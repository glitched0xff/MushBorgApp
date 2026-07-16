const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const ContainerType = sequelize.define("containerType", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          txt:{
            type: Sequelize.STRING,
          },
          val:{
            type: Sequelize.STRING,
          }
    });
    return ContainerType;
  };
  