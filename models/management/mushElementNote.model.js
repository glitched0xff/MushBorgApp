const DataTypes= require("sequelize")

module.exports = (sequelize, Sequelize) => {
    const MushElementNote = sequelize.define("mushElementNote", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      mushElementId:{
        type: Sequelize.INTEGER
      },
      check_date:{
        type: Sequelize.DATE,
        allowNull: true,
      },
      stato:{
        type: Sequelize.STRING
      },
      type:{
        type: Sequelize.STRING
      },
      pict:{ //Picture
        type:Sequelize.STRING
      },
      note:{
        type: Sequelize.STRING
      }
    });
    MushElementNote.associate = (models) => {
        MushElementNote.belongsTo(models.mushElement, {
                                  foreignKey: 'mushElementId',
                                  onDelete: 'CASCADE'
                                });
    }
    return MushElementNote;
  };