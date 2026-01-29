/**
 * Script for fresh installation
 * Run the script with node resetDb.js
 * Be carefull make a backup before run the script.
 * Add to list EXCLUDED_TABLES the name of table that you want exclude from TRUNC
 * 
 * V0 - 28.01.2026
 * Glitched
 */

const { Sequelize, QueryTypes } = require('sequelize');

// Configurazione della connessione
const sequelize = new Sequelize('mushborg', 'mushborg', 'mushborg0x0', {
  host: 'localhost',
  dialect: 'mariadb'
});

/** 
 * Array of table name that will be UNERASE.
 * Add here other table name for save data from restore to empty 
 */
const EXCLUDED_TABLES = [
  'pretreatments',
  'materialCategories',
  'dDOptions',
  'containerTypes'
];

/** List table of mushborgDb */
async function getTables() {
  try {
    const tables = await sequelize.query('SHOW TABLES', {
      type: QueryTypes.SELECT
    });
    return tables
  } catch (error) {
    console.error('Errore nel recupero delle tabelle:', error);
  }
}

/** Function for list and erase data in table */
(async () => {
  try {
    let tables=await getTables()
    tables=JSON.parse(JSON.stringify(tables))
    const tableNames = tables.map(obj => Object.values(obj)[0]);
    await sequelize.query('SET FOREIGN_KEY_CHECKS = 0');
    for (const row of tableNames) {
      const tableName = row;
      if (EXCLUDED_TABLES.includes(tableName)) {
        console.log(`⏭️  Skipping ${tableName}`);
        continue;
      }
      console.log(`🧹 Truncating ${tableName}`);
      await sequelize.query(`TRUNCATE TABLE \`${tableName}\``);
    }
    await sequelize.query('SET FOREIGN_KEY_CHECKS = 1');
     console.log('✅ Cleanup completato');
     await sequelize.close();
     process.exit(0);
  } catch (err) {
    console.error('❌ Errore:', err);
    process.exit(1);
  } 
})();
