const DataTypes= require("sequelize")

// This model must be edit in DB

module.exports = (sequelize, Sequelize) => {
    const DiaryNote = sequelize.define("diaryNotes", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      nota:{
        type: Sequelize.STRING,
      },
      area:{
        type: Sequelize.STRING,
      },
      tag:{
        type: Sequelize.STRING,
      },
    });
    return DiaryNote;
  };