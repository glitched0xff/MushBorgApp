const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Strain = sequelize.define("strain", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          code_strain:{
            type: Sequelize.STRING
          },
          strain_name:{
            type: Sequelize.STRING
          },
          species:{
            type:Sequelize.STRING
          },
          species_code:{
            type:Sequelize.STRING
          },
          // speciesId:{
          //   type:Sequelize.INTEGER
          // },
          sub_code:{
            type:Sequelize.STRING
          },
          description:{
            type:Sequelize.STRING
          },
          generation:{
            type:Sequelize.STRING
          },
          derivedFrom:{
            type:Sequelize.STRING
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
          buyed:{
            type: Sequelize.DATE
          },
          liked_substrate:{
            type:Sequelize.STRING
          },
          qt:{
            type: Sequelize.INTEGER
          },
          supplierId:{
            type: Sequelize.INTEGER
          },
          conservationMedia:{
            type: Sequelize.INTEGER
          },
          note:{
            type:Sequelize.STRING
          }
    });
    Strain.associate = (models) => {
        Strain.hasMany(models.spawn,{foreignKey:'strainId'});
        Strain.hasMany(models.inoculum,{foreignKey:'strainId'});
        Strain.hasMany(models.propagation,{foreignKey:'strainId'});
        Strain.belongsTo(models.supplier)
        // Strain.belongsTo(models.species, {
        //   foreignKey: 'speciesId',
        //   as: 'species'
        // });
      }
    return Strain;
  };