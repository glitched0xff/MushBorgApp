const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Movimentation = sequelize.define("movimentation", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          relatedId:{
            type: Sequelize.INTEGER
          },
          from:{
            type: Sequelize.INTEGER
          },
          to:{
            type: Sequelize.INTEGER
          },
          type:{
            type: Sequelize.STRING
          },
    });
    Movimentation.associate = (models) => {
        // Movimentation.belongsTo(models.spawn,{foreignKey:'relatedId',targetKey: "id"});
        // Movimentation.belongsTo(models.propagation,{foreignKey:'relatedId',targetKey: "id"});
        // Movimentation.belongsTo(models.mushElement, {
        //   as: "Spawn",
        //   foreignKey: "spawnId",   // colonna presente in Movimentation
        //   targetKey: "id" ,         // PK di MushElement
        // });

        // Movimentation.belongsTo(models.mushElement, {
        //   as: "Inoculum",
        //   foreignKey: "inoculumId", // colonna presente in Movimentation
        //   targetKey: "id"
        // });
      //  Movimentation.belongsTo(models.propagation,{foreignkey:'relatedId',targetKey: "id"});
      }
    return Movimentation;
  };