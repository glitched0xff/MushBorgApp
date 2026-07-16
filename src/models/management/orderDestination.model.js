const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const OrderDestination = sequelize.define("orderDestination", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          code_destination:{
            type: Sequelize.STRING
          },
          name:{
            type: Sequelize.STRING
          },
          surname:{
            type: Sequelize.STRING
          },
          address:{
            type: Sequelize.STRING
          },
          mail:{
            type: Sequelize.STRING
          },
          mobile:{
            type: Sequelize.STRING
          },
          active:{type:Sequelize.INTEGER},
          note:{
            type: Sequelize.STRING
          }
    });
    OrderDestination.associate = (models) => {
         //OrderDestination.belongsTo(models.supplier);
         OrderDestination.hasMany(models.productionOrder,{foreignkey:'orderDestinationId'});
         //OrderDestination.hasMany(models.propagation,{foreignkey:'containerId'});
         //OrderDestination.hasMany(models.spawn,{foreignkey:'containerId'});
     }
    return OrderDestination;
  };