/**
 * Copia i dati da una colonna all'altra della stessa tabella
 * V0 - 28.01.2026
 * Glitched
 */

const fromField = "createdAt";
const toField = "dataNota";
const tabelName = "diaryNotes"; // Name in Mysql DB

// Rimosso QueryTypes perché per i calcoli dei risultati usiamo le opzioni standard di MariaDB
const { Sequelize } = require('sequelize');

// Configurazione della connessione
const sequelize = new Sequelize('mushborg', 'mushborg', 'mushborg0x0', {
  host: 'localhost',
  dialect: 'mariadb',
  logging: false // Disattiva i log di log se vuoi una console pulita
});

async function copiaDati() {
  try {
    await sequelize.authenticate();
    console.log('Connessione riuscita.');

    // Esegue l'update dinamico usando una query nativa sicura
    const [results] = await sequelize.query(
      `UPDATE \`${tabelName}\` SET \`${toField}\` = \`${fromField}\` WHERE \`${toField}\` IS NULL`
    );

    // MariaDB/MySQL restituisce un oggetto con i metadati della query
    const affectedRows = results.affectedRows !== undefined ? results.affectedRows : 0;

    console.log(`Aggiornamento completato. Righe modificate: ${affectedRows}`);
  } catch (error) {
    console.error('Errore durante la copia:', error);
  } finally {
    await sequelize.close();
  }
}

// Avvia lo script
copiaDati();

//   try {
//     // Esecuzione della query raw SHOW TABLES
//     const tables = await sequelize.query('SHOW TABLES', {
//       type: QueryTypes.SELECT
//     });
//     console.log('Tabelle nel database:', tables);
//   } catch (error) {
//     console.error('Errore nel recupero delle tabelle:', error);
//   } finally {
//     await sequelize.close();
//   }
// }

// getTables();