const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const SubstrateElement = sequelize.define("substrateElements", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      substrateId:{
        type: Sequelize.INTEGER
      },
      materialCategoryId:{
        type: Sequelize.INTEGER
      },
      rawMaterialId:{
        type: Sequelize.INTEGER
      },
      materialName:{
        type: Sequelize.STRING
      },
      qt_dry:{
        type: Sequelize.FLOAT
      },
      qt_hum:{
        type: Sequelize.FLOAT
      },
      pretreatmentId:{
        type: Sequelize.INTEGER
      },
      pretreatmentNote:{
        type: Sequelize.STRING
      }
      
    });
    SubstrateElement.associate = (models) => {
      SubstrateElement.belongsTo(models.substrate);
      SubstrateElement.belongsTo(models.rawMaterial);
      SubstrateElement.belongsTo(models.materialCategory);
    }
    return SubstrateElement;
  };