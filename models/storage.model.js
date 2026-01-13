const DataTypes= require("sequelize")

// This model must be edit in DB

module.exports = (sequelize, Sequelize) => {
    const Storage = sequelize.define("storages", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      code_storage:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      name_storage:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      data_storage:{
        type: Sequelize.STRING,
        allowNull:false,
      },
      rawmaterial: {
        type: Sequelize.INTEGER},
      strain: {
        type: Sequelize.INTEGER},
      container: {
        type: Sequelize.INTEGER},
      spawn: {
        type: Sequelize.INTEGER},
      mushElement: {
        type: Sequelize.INTEGER},
      propagation: {
        type: Sequelize.INTEGER},
      note:{
        type: Sequelize.STRING,
      },
      showInHome:{
        type: Sequelize.INTEGER
      }
    });
    Storage.associate = (models) => {
         Storage.hasMany(models.mushElement, {foreignKey: "storageId"});
         Storage.hasMany(models.device, {foreignKey: "storageId"});
         Storage.hasMany(models.inoculum, {foreignKey: "storageId"});
         Storage.hasMany(models.spawn, {foreignKey: "storageId"});
         Storage.hasMany(models.propagation, {foreignKey: "storageId"});
         Storage.hasMany(models.associateActuator, {foreignKey: "storageId"})
         Storage.hasMany(models.associateSensor, {foreignKey: "storageId"})
         Storage.hasMany(models.associateAllarm, {foreignKey: "storageId"})
    }
    return Storage;
  };