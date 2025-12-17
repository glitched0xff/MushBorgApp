const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Calendar = sequelize.define("calendar", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      title:{
        type: Sequelize.STRING,
      },
      description:{
        type: Sequelize.STRING,
      },
      start:{
        type: Sequelize.DATE,
      },
      end:{
        type: Sequelize.DATE,

      },
      allDay:{
        type: Sequelize.INTEGER,
      },
      category:{
        type: Sequelize.INTEGER,
      },
      relatedElement:{
        type: Sequelize.INTEGER
      },
      calendarCategoryId:{
        type: Sequelize.INTEGER
      },
      completed:{
        type: Sequelize.INTEGER,
      }
    });
    return Calendar;
  };