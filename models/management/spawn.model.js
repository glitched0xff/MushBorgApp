const DataTypes= require("sequelize");

module.exports = (sequelize, Sequelize) => {
    const Spawn = sequelize.define("spawn", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          code_spawn:{
            type: Sequelize.STRING
          },
          spawn_name:{
            type: Sequelize.STRING
          },
          strainId:{
            type: Sequelize.INTEGER,
            allowNull: true,
          },
          strainWeight:{
            type: Sequelize.FLOAT,
          },
          strainPerc:{
            type: Sequelize.FLOAT,
          },
          qt:{
            type: Sequelize.INTEGER,
            allowNull: true,
          },
          containerId:{
            type: Sequelize.INTEGER
          },
          n_container:{
            type: Sequelize.INTEGER,
            allowNull: true,
          },
          substrateId:{
            type: Sequelize.INTEGER,
          },
          substrateQt:{
            type: Sequelize.FLOAT,
          },
          purchased:{
            type:Sequelize.INTEGER,
            defaultValue: 0
          },
          purchased_date:{
            type: Sequelize.DATE
          },
          supplierId:{
            type:Sequelize.INTEGER,
          },
          exp_date:{
            type: Sequelize.DATE
          },
          expected_maturation_date:{
            type: Sequelize.DATE
          },
          storageId:{
            type: Sequelize.INTEGER
          },
          createLot:{
        type: Sequelize.DATE,
      },
          note:{
            type:Sequelize.STRING
          }
    });
    Spawn.associate = (models) => {
      Spawn.belongsTo(models.strain); 
      Spawn.belongsTo(models.container); 
      Spawn.belongsTo(models.substrate);
      Spawn.belongsTo(models.supplier);
      Spawn.belongsTo(models.storage);
      Spawn.hasMany(models.mushElement,{foreignKey:'relatedId',sourceKey: "id"});
    };
    return Spawn;
  };