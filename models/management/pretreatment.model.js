const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Pretreatment = sequelize.define("pretreatment", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          pretreatment_name:{
            type: Sequelize.STRING
          },
          type:{
            type:Sequelize.STRING
          },
          protocol:{
            type: Sequelize.TEXT
          },
    });
    // Pretreatment.associate = (models) => {
    //   Pretreatment.belongsTo(models.spawn);
    //   Pretreatment.belongsTo(models.substrate);
    //   //Pretreatment.belongsTo(models.substrate);
    //   Pretreatment.hasMany(models.pretreatmentElement,{foreignkey:'pretreatmentId'});
    //   Pretreatment.hasMany(models.fructification,{foreignkey:'pretreatmentId'});
    // };
    return Pretreatment;
  };