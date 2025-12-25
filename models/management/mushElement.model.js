const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const MushElement = sequelize.define("mushElement", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      element_code:{
        type: Sequelize.STRING,
      },
      type:{ 
        type: Sequelize.STRING,
      },
      relatedId:{ // id relativo
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      load_date:{
        type: Sequelize.DATE,
        allowNull: true,
      },
      expected_maturation_date:{
        type: Sequelize.DATE,
        allowNull: true,
      },
      expected_fructification_date:{
        type: Sequelize.DATE,
        allowNull: true,
      },
      real_maturation_date:{
        type: Sequelize.DATE,
        allowNull: true,
      },
      real_fructification_date:{
        type: Sequelize.DATE,
        allowNull: true,
      },
      pick_date:{
        type: Sequelize.DATE,
        allowNull: true,
      },
      pick_reason:{
        type: Sequelize.STRING
      },
      stato:{
        type: Sequelize.STRING
      },
      qt:{
        type: Sequelize.FLOAT
      },
      stage:{
        type: Sequelize.INTEGER
      },
      active:{
        type: Sequelize.STRING
      },
      storageId:{
        type:Sequelize.INTEGER
      },
      perc:{
        type:Sequelize.FLOAT
      },
      note:{
        type: Sequelize.STRING
      }
    });
    MushElement.associate = (models) => {
        MushElement.hasMany(models.mushElementNote,{foreignKey:'mushElementId',
                                                    onDelete: 'CASCADE',   // 🔥 se cancello il MushElement, cancella anche i MushElementNote
                                                    hooks: true   });
        MushElement.hasMany(models.mushElementHarvest,{foreignKey:'mushElementId' });
        MushElement.belongsTo(models.spawn,{foreignKey:'relatedId',targetKey: "id"});
        MushElement.belongsTo(models.propagation,{foreignKey:'relatedId',targetKey: "id"});
        MushElement.belongsTo(models.inoculum,{foreignKey:'relatedId',targetKey: "id"});
       // MushElement.hasMany(models.seed,{as: "Spawn",foreignKey:'spawnId',targetKey: "id"})
        //MushElement.hasMany(models.seed,{as: "Inoculum",foreignKey:'inoculumId',targetKey: "id"})
         // MushElement.hasMany(models.seed,{foreignkey:'mushElementId'});
       //  MushElement.belongsTo(models.seed, {foreignKey: 'mushElementId'})
       
          MushElement.hasMany(models.seed, {
            foreignKey: "mushElementId",
            as: "seeds"
          });
        MushElement.belongsTo(models.storage, {foreignKey: "storageId",});
    }
    return MushElement;
  };