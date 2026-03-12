const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const ProductionOrder = sequelize.define("productionOrder", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          code_order:{
            type: Sequelize.STRING
          },
          orderDestinationId:{
            type: Sequelize.INTEGER
          },
          name_order:{
            type: Sequelize.STRING
          },
          description:{
            type: Sequelize.STRING
          },
          idContainer:{
            type: Sequelize.STRING
          },
          idStrain:{
            type: Sequelize.STRING
          },
          qt:{
            type: Sequelize.STRING
          },
          deliveryDate:{
            type: Sequelize.DATE,
          },
          requestDate:{
            type: Sequelize.DATE,
          },
          endDate:{
            type: Sequelize.DATE,
          },
          ended:{type:Sequelize.INTEGER},
          inExecution:{type:Sequelize.INTEGER},
          active:{type:Sequelize.INTEGER},
          note:{
            type: Sequelize.STRING
          }
    });
     ProductionOrder.associate = (models) => {
         ProductionOrder.belongsTo(models.orderDestination),{foreignkey:'orderDestinationId'};
    //     ProductionOrder.hasMany(models.inoculum,{foreignkey:'containerId'});
    //     ProductionOrder.hasMany(models.propagation,{foreignkey:'containerId'});
    //     ProductionOrder.hasMany(models.spawn,{foreignkey:'containerId'});
       }
    return ProductionOrder;
  };