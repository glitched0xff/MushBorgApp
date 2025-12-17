/* 17-2-25 Update
reenginering of software unveil that have propagation and fructification divided is wrong.
Still use this model as propagation but the reference /root will be /cultivation 
By this model create the inoculated bag.
*/

const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const Propagation = sequelize.define("propagation", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          code_propagation:{
            type: Sequelize.STRING
          },
          propagation_name:{
            type: Sequelize.STRING
          },
           strainId:{
            type: Sequelize.INTEGER,
            allowNull: true,
          },
          strainWeight:{
            type: Sequelize.FLOAT,
          },
          strainPerc:{
            type: Sequelize.FLOAT,
          },
          qt:{
            type: Sequelize.INTEGER,
            allowNull: true,
          },
          containerId:{
            type: Sequelize.INTEGER
          },
          n_container:{
            type: Sequelize.INTEGER,
            allowNull: true,
          },
          substrateId:{
            type: Sequelize.INTEGER,
          },
          substrateQt:{
            type: Sequelize.FLOAT,
          },
          
        purchased:{
                    type:Sequelize.INTEGER,
                    defaultValue: 0
                  },
         purchased_date:{
            type: Sequelize.DATE
          },
        exp_date:{
            type: Sequelize.DATE
          },
          expected_maturation_date:{
            type: Sequelize.DATE
          },
          expected_fructification_date:{
            type: Sequelize.DATE
          },
          supplierId:{
            type:Sequelize.INTEGER,
          },
          storageId:{
        type: Sequelize.INTEGER
      },
      createLot:{
        type: Sequelize.DATE,
      },
          note:{
            type:Sequelize.STRING
          },
    },
    );

    Propagation.associate = (models) => {
      Propagation.belongsTo(models.substrate);
      Propagation.belongsTo(models.strain); 
      Propagation.belongsTo(models.container);
      Propagation.belongsTo(models.supplier); 
      Propagation.belongsTo(models.storage);
      Propagation.hasMany(models.mushElement,{foreignKey:'relatedId',sourceKey: "id"});
      
    };
    return Propagation;
  };