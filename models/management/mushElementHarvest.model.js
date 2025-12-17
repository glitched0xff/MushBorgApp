const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const MushElementHarvest = sequelize.define("mushElementHarvest", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          mushElementId:{
        type: Sequelize.INTEGER
      },
          harvest_date:{
            type:Sequelize.DATE
          },
          harvest_weight: {
            type: Sequelize.FLOAT
          },
          type:{
            type: Sequelize.STRING
          },
          note:{
            type:Sequelize.STRING
          }
    });
    MushElementHarvest.associate = (models) => {
      MushElementHarvest.belongsTo(models.mushElement, {
                                  foreignKey: 'mushElementId',
                                  onDelete: 'CASCADE'
                                });
      }
    return MushElementHarvest;
  };