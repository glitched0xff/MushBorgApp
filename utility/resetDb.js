const { Sequelize, QueryTypes } = require('sequelize');

// Configurazione della connessione
const sequelize = new Sequelize('mushborg', 'mushborg', 'mushborg0x0', {
  host: 'localhost',
  dialect: 'mariadb'
});

const EXCLUDED_TABLES = [
  'pretreatments',
  'materialCategories',
  'dDOptions',
  'containerTypes'
];

async function getTables() {
  try {
    // Esecuzione della query raw SHOW TABLES
    const tables = await sequelize.query('SHOW TABLES', {
      type: QueryTypes.SELECT
    });
    //console.log('Tabelle nel database:', tables);
    return tables
  } catch (error) {
    //console.error('Errore nel recupero delle tabelle:', error);
  }
}

(async () => {
  try {
    let tables=await getTables()
    tables=JSON.parse(JSON.stringify(tables))
    console.log(typeof tables)

    // Nome colonna dinamico (Tables_in_xxx)
    //const columnName = Object.keys(results[0])[0];
    const tableNames = tables.map(obj => Object.values(obj)[0]);

    console.log(tableNames);
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

    // console.log('✅ Cleanup completato');
     await sequelize.close();
     process.exit(0);
  } catch (err) {
    console.error('❌ Errore:', err);
    process.exit(1);
  } 
})();
