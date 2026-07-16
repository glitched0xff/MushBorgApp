const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const RecipeElement = sequelize.define("recipeElements", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      recipeId:{
        type: Sequelize.INTEGER
      },
      materialCategoryId:{
        type: Sequelize.INTEGER
      },
      categoryName:{
        type: Sequelize.STRING
      },
      percentage:{
        type: Sequelize.FLOAT
      },
      wet_weight:{
        type: Sequelize.INTEGER
      },
      position:{
        type: Sequelize.INTEGER
      }
    });
    RecipeElement.associate = (models) => {
      RecipeElement.belongsTo(models.recipe);
      RecipeElement.belongsTo(models.materialCategory);
    }
    return RecipeElement;
  };