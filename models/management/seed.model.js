const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Seed = sequelize.define("seed", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          relatedId:{
            type: Sequelize.INTEGER,
          },
          mushElementId:{
            type: Sequelize.INTEGER,
          },
          mushElementCode:{
              type: Sequelize.STRING  
          },
          perc:{
            type: Sequelize.FLOAT
          },
          
          typeDestination:{
            type: Sequelize.STRING
          }
    });
     Seed.associate = (models) => {
    //     Seed.belongsTo(models.inoculum, {
    //     foreignKey: "inoculumId",
    //     as: "inoculum"
    //   });

    //   Seed.belongsTo(models.spawn, {
    //     foreignKey: "spawnId",
    //     as: "spawn"
    //   });

    //   Seed.belongsTo(models.propagation, {
    //     foreignKey: "propagationId",
    //     as: "propagation"
    //   });

      Seed.belongsTo(models.mushElement, {
        foreignKey: "mushElementId",
        as: "mushElement"
      });
        //seed.hasMany(mushElement, { as: 'mushElement' });
      // Seed.hasMany(models.mushElement,{foreignKey:'mushElementId'})
        //Seed.belongsTo(models.mushElement, {foreignKey:'mushElementId',targetKey: "id"})
      //  Seed.belongsTo(models.propagation,{foreignkey:'relatedId',targetKey: "id"});
      //}
    
  };
  return Seed;
}