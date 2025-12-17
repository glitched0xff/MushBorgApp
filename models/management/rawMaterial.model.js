const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const RawMaterial = sequelize.define("rawMaterial", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      material_name:{
        type:Sequelize.STRING,
        unique:true
      },
      materialCategoryId:{
        type:Sequelize.INTEGER,
        references: {
          model: 'MaterialCategory',
          key: 'id',
          as: 'materialCategoryId',
        },
      },
      supplierId:{
        type:Sequelize.INTEGER,
        references: {
          model: 'Supplier',
          key: 'id',
          as: 'supplierId',
        },
      },
      hum_factor:{
        type:Sequelize.FLOAT
      },
      date_storage:{
        type:Sequelize.DATE
      },
      quantity:{
        type:Sequelize.FLOAT
      },
      uom:{
        type:Sequelize.STRING
      },
      used:{
        type:Sequelize.INTEGER,
        defaultValue:0
      },
      note:{
        type:Sequelize.STRING
      },
      storageId:{
        type:Sequelize.INTEGER
      },
      destination:{
        type:Sequelize.STRING
      },
    });
    RawMaterial.associate = (models) => {
      RawMaterial.belongsTo(models.materialCategory)
      RawMaterial.belongsTo(models.supplier)
      RawMaterial.belongsTo(models.storage)
      RawMaterial.hasMany(models.substrateElement,{foreignkey:'rawMaterialId'})
    }
    return RawMaterial;
  };