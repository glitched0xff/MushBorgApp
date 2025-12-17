const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Inoculum = sequelize.define("inoculums", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      code_inoculum:{
        type: Sequelize.STRING
      },
      inoculum_name:{
        type: Sequelize.STRING
      },
      strainId:{
        type: Sequelize.INTEGER
      },
      containerId:{
        type: Sequelize.STRING
      },
      n_container:{
        type: Sequelize.INTEGER
      },
      cultivation_media:{
        type: Sequelize.STRING
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
      purchased:{
        type: Sequelize.INTEGER,
        defaultValue: 0
      },
      purchased_date:{
        type: Sequelize.DATE,
      },
      substrateId:{
        type: Sequelize.INTEGER
      },
      fromSample:{
        type: Sequelize.INTEGER,
        defaultValue: 0
      },
      sampleType:{
        type: Sequelize.INTEGER
      },
      supplierId:{
        type: Sequelize.INTEGER
      },
      createLot:{
        type: Sequelize.DATE,
      },
      note:{
        type: Sequelize.STRING
      }
    });
    Inoculum.associate = (models) => {
        Inoculum.belongsTo(models.strain);
        Inoculum.belongsTo(models.container);
        Inoculum.belongsTo(models.substrate);
        Inoculum.belongsTo(models.storage);
        Inoculum.belongsTo(models.supplier);
        Inoculum.hasMany(models.mushElement,{foreignKey:'relatedId',sourceKey: "id"});
      
    }
    return Inoculum;
  };
