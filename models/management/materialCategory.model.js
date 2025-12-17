const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const MaterialCategory = sequelize.define("materialCategory", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      category_name:{
        type:Sequelize.STRING
      },
      hum_factor:{
        type:Sequelize.FLOAT
      },
      note:{
        type:Sequelize.STRING
      },
      color:{
        type:Sequelize.STRING
      }

    });
    MaterialCategory.associate = (models) => {
      MaterialCategory.hasMany(models.rawMaterial,{foreignkey:'materialCategoryId'});
      MaterialCategory.hasMany(models.substrateElement,{foreignkey:'materialCategoryId'});
      MaterialCategory.hasMany(models.recipeElement,{foreignkey:'materialCategoryId'});
    }
    return MaterialCategory;
  };