const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Container = sequelize.define("container", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          code_container:{
            type: Sequelize.STRING
          },
          container_name:{
            type: Sequelize.STRING
          },
          capacity:{
            type: Sequelize.FLOAT
          },
          uom:{
            type: Sequelize.STRING
          },
          material:{
            type: Sequelize.STRING
          },
          reusable:{
            type: Sequelize.INTEGER(1)
          },
          supplierId:{
            type: Sequelize.INTEGER,
          },
          type:{
            type: Sequelize.STRING
          },
          destination:{
            type:Sequelize.STRING
          },
          note:{
            type:Sequelize.STRING
          }
    });
    Container.associate = (models) => {
        Container.belongsTo(models.supplier);
        Container.hasMany(models.inoculum,{foreignkey:'containerId'});
        Container.hasMany(models.propagation,{foreignkey:'containerId'});
        Container.hasMany(models.spawn,{foreignkey:'containerId'});
      }
    return Container;
  };