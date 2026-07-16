const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Supplier = sequelize.define("supplier", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      supplier_name:{
        type:Sequelize.STRING
      },
      address:{type:Sequelize.STRING},
      phone:{type:Sequelize.STRING},
      mail:{type:Sequelize.STRING},
      field:{type:Sequelize.STRING},
      taxInfo:{type:Sequelize.STRING},
      note:{type:Sequelize.STRING}
    });
    Supplier.associate = (models) => {
      Supplier.hasMany(models.rawMaterial,{foreignkey:'supplierId'});
      Supplier.hasMany(models.strain,{foreignkey:'supplierId'});
      Supplier.hasMany(models.container,{foreignkey:'supplierId'});
      Supplier.hasMany(models.inoculum,{foreignkey:'supplierId'});
      Supplier.hasMany(models.spawn,{foreignkey:'supplierId'});
      Supplier.hasMany(models.propagation,{foreignkey:'supplierId'});
    }
    return Supplier;
  };