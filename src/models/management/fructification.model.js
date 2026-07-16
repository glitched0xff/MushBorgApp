const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Fructification = sequelize.define("fructification", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          code_fructification:{
            type: Sequelize.STRING
          },
          propagationId:{
            type: Sequelize.INTEGER
          },
          note:{
            type:Sequelize.STRING
          }
    });
    Fructification.associate = (models) => {
      Fructification.belongsTo(models.propagation);
      //Fructification.belongsTo(models.substrate);
      Fructification.hasMany(models.fructificationElement,{foreignkey:'fructificationId'});
      Fructification.hasMany(models.fructificationFlush,{foreignkey:'fructificationId'});
    };
    return Fructification;
  };