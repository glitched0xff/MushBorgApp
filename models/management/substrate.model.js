const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Substrate = sequelize.define("substrate", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      cod_substrate:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      name_substrate:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      sub_code:{
        type: Sequelize.STRING,
        allowNull:true,
      },
      recipeId:{
        type: Sequelize.INTEGER,
        allowNull:false
      },
      recipe_name:{
        type: Sequelize.STRING,
      },
      pretreatment:{
        type: Sequelize.STRING,
      },
      pretreatmentId:{
        type: Sequelize.INTEGER,
      },
      pretreatmentNote:{
        type: Sequelize.STRING,
      },
      qt:{
        type: Sequelize.FLOAT,
      },
      uom:{
        type: Sequelize.STRING,
      },
      destination:{
        type: Sequelize.STRING,
      },

      forPurchased:{
        type: Sequelize.INTEGER,
        defaultValue:0
      },
      note:{
        type: Sequelize.STRING,
      }
    });
    Substrate.associate = (models) => {
      Substrate.belongsTo(models.recipe);
      Substrate.hasMany(models.substrateElement,{foreignkey:'substrateId'});
      Substrate.hasMany(models.spawn,{foreignkey:'substrateId'});
      Substrate.hasMany(models.propagation,{foreignkey:'substrateId'});
      Substrate.hasMany(models.inoculum,{foreignkey:'substrateId'});
    }
    return Substrate;
  };