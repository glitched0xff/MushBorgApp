/**
 * Script for update DB 
 * Sync MushElement strainId with strainId of relatedId
 * V0 - 01.02.2026
 * Glitched
 */
const { DataTypes } = require('sequelize');
const db = require("../models");

(async () => {
  try {
    //console.log(db)
   // db.sequelize.sync()

   // await db.sequelize.query('USE mushborg');
    console.log('✔️ Connessione DB ok');

    const qi = db.sequelize.getQueryInterface();

    // /**
    //  * 1️⃣ Controllo colonna
    //  */
    let tableDescription = await qi.describeTable('mushElements');

    if (!tableDescription.strainId) {
      console.log('➕ Aggiungo colonna strainId');

      await qi.addColumn('mushElements', 'strainId', {
        type: DataTypes.INTEGER(11),
        allowNull: true,
        defaultValue: null,
      });

      console.log('✔️ Colonna strainId aggiunta');
      tableDescription = await qi.describeTable('mushElements');
    } else {
      console.log('ℹ️ Colonna strainId già presente');
    }

    /**
     * 2️⃣ Popolamento dati
     */
    const mushElements = await db.mushElement.findAll();

    for (const elem of mushElements) {
      let result = null;

      if (elem.type === 'INOCULUM') {
        result = await db.inoculum.findByPk(elem.relatedId);
      } else if (elem.type === 'SPAWN') {
        result = await db.spawn.findByPk(elem.relatedId);
      } else if (elem.type === 'CULTIVATION') {
        result = await db.propagation.findByPk(elem.relatedId);
      }
      console.log(result.strainId)
      if (result && result.strainId) {
        await elem.update({ strainId: result.strainId });
      }
    }

    console.log('✔️ Aggiornamento completato');

   // await sequelize.close();
  } catch (err) {
    console.error('❌ Errore:', err);
    process.exit(1);
  }
})();