const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const SpeciesTemplate = sequelize.define("speciesTemplate", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          speciesId:{
            type: Sequelize.STRING
          },
         
          incubation_temp:{
            type:Sequelize.STRING
          },
          incubation_hum:{
            type:Sequelize.STRING
          },
          incubation_len:{
            type:Sequelize.STRING
          },
          incubation_co2:{
            type:Sequelize.STRING
          },
          incubation_airExch:{
            type:Sequelize.STRING
          },
          incubation_light:{
            type:Sequelize.STRING
          },
          primordia_temp:{
            type:Sequelize.STRING
          },
          primordia_hum:{
            type:Sequelize.STRING
          },
          primordia_len:{
            type:Sequelize.STRING
          },
          primordia_co2:{
            type:Sequelize.STRING
          },
          primordia_airExch:{
            type:Sequelize.STRING
          },
          primordia_light:{
            type: Sequelize.STRING
          },
           fructification_temp:{
            type:Sequelize.STRING
          },
          fructification_hum:{
            type:Sequelize.STRING
          },
          fructification_len:{
            type:Sequelize.STRING
          },
          fructification_co2:{
            type:Sequelize.STRING
          },
          fructification_airExch:{
            type:Sequelize.STRING
          },
          fructification_light:{
            type: Sequelize.STRING
          },
          outdoor:{
            type: Sequelize.INTEGER
          },
          indoor:{
            type: Sequelize.INTEGER
          },
          crops:{
            type: Sequelize.INTEGER
          }
    });
    SpeciesTemplate.associate = (models) => {
      }
    return SpeciesTemplate;
  };