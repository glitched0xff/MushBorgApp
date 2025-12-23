const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Species = sequelize.define("species", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          species_name:{
            type: Sequelize.STRING
          },
          description:{
            type: Sequelize.STRING
          },
          shortCode:{
            type: Sequelize.STRING
          },
          
    });
    Species.associate = (models) => {
       Species.hasMany(models.strain, {
          foreignKey: 'speciesId',
          as: 'strain'
        });
      }
    return Species;
  };