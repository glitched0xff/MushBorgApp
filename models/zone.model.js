const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Zone = sequelize.define("zone", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      code_zone:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      zone_name:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      address:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      contact:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      used:{
        type: Sequelize.INTEGER,
        dedefaultValue:0
      },
      note:{
        type: Sequelize.STRING,
      }
    });
    Zone.associate = (models) => {
      Zone.hasMany(models.substrateElement,{foreignkey:'substrateId'});
      Zone.hasMany(models.spawn,{foreignkey:'substrateId'});
    }
    
    return Zone;
  };