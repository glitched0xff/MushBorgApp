// resetTables.js
const db=require("./models/index")

async function resetTables() {
  try {
    console.log("🔄 Avvio reset tabelle...");

    // Elenco delle tabelle da resettare
    // ⚠️ Ordine importante se ci sono foreign key
    const tablesToReset = [
      "substrate",
      "substrateElement"
    ];
    const dialect = db.sequelize.getDialect();

    // MySQL/MariaDB: disabilitiamo le foreign key temporaneamente
    if (dialect === "mysql" || dialect === "mariadb") {
      await db.sequelize.query("SET FOREIGN_KEY_CHECKS = 0;");
    }

    for (const tableName of tablesToReset) {
      const model = db[tableName];

      if (!model) {
        console.warn(`⚠️ Modello non trovato: ${tableName}`);
        continue;
      }

      console.log(`🗑️ Reset tabella: ${tableName}`);

      // RESET COMPLETO + RESET ID
      await db.destroy({
        where: {},
        truncate: true,
        cascade: true,
        restartIdentity: true, // <-- RESET ID (Postgres + SQLite + alcuni dialetti)
        force: true
      });

      // Per alcuni dialetti serve TRUNCATE manuale
      if (dialect === "postgres") {
        await db.sequelize.query(`TRUNCATE TABLE "${model.tableName}" RESTART IDENTITY CASCADE;`);
      }
    }

    // Riattiva FK in MySQL/MariaDB
    if (dialect === "mysql" || dialect === "mariadb") {
      await db.sequelize.query("SET FOREIGN_KEY_CHECKS = 1;");
    }

    console.log("✅ Reset completato (dati eliminati + ID azzerati)");
    process.exit(0);

  } catch (error) {
    console.error("❌ Errore durante reset:", error);
    process.exit(1);
  }
}

resetTables();