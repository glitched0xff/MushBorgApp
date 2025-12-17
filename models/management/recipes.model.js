const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Recipes = sequelize.define("recipes", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      cod_recipe:{
        type: Sequelize.STRING,
      },
      sub_code:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      recipe_name:{
        type: Sequelize.STRING,
      },
      note:{
        type: Sequelize.STRING,
      },
      forPurchased: {
        type: Sequelize.INTEGER
      },
      destination:{
        type: Sequelize.STRING,
      }
    });
    Recipes.associate = (models) => {
      Recipes.hasMany(models.recipeElement,{foreignkey:'recipeId',onDelete: 'cascade' });
      Recipes.hasMany(models.substrate,{foreignkey:'recipeId' });
    }
    return Recipes;
  };