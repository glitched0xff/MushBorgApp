const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const PastorizzazioneBatch = sequelize.define("pastorizzazioneBatch", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
          code_substrate:{
            type: Sequelize.STRING
          },
          stato:{
            type: Sequelize.STRING
          },
          tempPastorizzazione:{
            type: Sequelize.FLOAT
          },
          tempAmbiente:{
            type: Sequelize.FLOAT
          },
          last_updated:{
            type: Sequelize.DATE
          }
    });
    
    return PastorizzazioneBatch;
  };