const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const calendarCategory = sequelize.define("calendarCategory", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      nome_categoria:{
        type: Sequelize.STRING,
      },
      colore:{
        type: Sequelize.STRING,
      },
      class:{
        type: Sequelize.STRING,
      },
      show:{
        type: Sequelize.INTEGER,
      }
    });
  
    return calendarCategory;
  };