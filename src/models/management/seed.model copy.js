/**
 * DEPRECATO
 */

const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Seed = sequelize.define("seed", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          relatedId:{
            type: Sequelize.INTEGER
          },
          inoculumId:{
            type: Sequelize.INTEGER
          },
          spawnId:{
            type: Sequelize.INTEGER
          },
          type:{
            type: Sequelize.STRING
          }
    });
    Seed.associate = (models) => {
        Seed.belongsTo(models.spawn,{foreignKey:'relatedId',targetKey: "id"});
        Seed.belongsTo(models.propagation,{foreignKey:'relatedId',targetKey: "id"});
        Seed.belongsTo(models.mushElement, {
          as: "Spawn",
          foreignKey: "spawnId",   // colonna presente in Seed
          targetKey: "id" ,         // PK di MushElement
        });

        Seed.belongsTo(models.mushElement, {
          as: "Inoculum",
          foreignKey: "inoculumId", // colonna presente in Seed
          targetKey: "id"
        });
      //  Seed.belongsTo(models.propagation,{foreignkey:'relatedId',targetKey: "id"});
      }
    return Seed;
  };

