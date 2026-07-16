/**
 * Script for list table
 * V0 - 28.01.2026
 * Glitched
 */

const { Sequelize, QueryTypes } = require('sequelize');

// Configurazione della connessione
const sequelize = new Sequelize('mushborg', 'mushborg', 'mushborg0x0', {
  host: 'localhost',
  dialect: 'mariadb'
});

async function getTables() {
  try {
    // Esecuzione della query raw SHOW TABLES
    const tables = await sequelize.query('SHOW TABLES', {
      type: QueryTypes.SELECT
    });
    console.log('Tabelle nel database:', tables);
  } catch (error) {
    console.error('Errore nel recupero delle tabelle:', error);
  } finally {
    await sequelize.close();
  }
}

getTables();