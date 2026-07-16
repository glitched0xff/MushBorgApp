const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const ToDo = sequelize.define("todo", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      titolo: {
        type: Sequelize.STRING
      },
      descrizione: {
        type: Sequelize.STRING
      },
      priority: {
        type: Sequelize.STRING
      },
      eseguito: {
        type: Sequelize.INTEGER,
        default:0
      },
      sezione: {
        type: Sequelize.STRING
      },
      durata:{
        type: Sequelize.STRING
      },
      posizione:{
        type: Sequelize.INTEGER
      }
    });
  
    return ToDo;
  };