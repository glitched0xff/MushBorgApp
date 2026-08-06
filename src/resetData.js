const db = require("./models/index");
const fs = require("fs");
const path = require("path");
const readline = require("readline");

const IMAGES_DIR = path.join(__dirname, "public", "imgMushEleNote");
const EXCLUDED_MODELS = ["calendarCategories", "dDOptions"];

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

async function runReset() {
  console.log("🔄 Avvio del reset totale (mantenendo le categorie e le opzioni)...");

  try {
    // 1. Disabilita i vincoli delle chiavi esterne
    await db.sequelize.query("SET FOREIGN_KEY_CHECKS = 0;");
    console.log("🔗 Vincoli chiavi esterne temporaneamente disabilitati.");

    // 2. Cicla e svuota i modelli Sequelize
    for (const modelName of Object.keys(db)) {
      if (modelName === "Sequelize" || modelName === "sequelize" || EXCLUDED_MODELS.includes(modelName)) {
        if (EXCLUDED_MODELS.includes(modelName)) {
          console.log(`ℹ️ Modello [${modelName}] escluso dal reset.`);
        }
        continue;
      }

      if (db[modelName] && typeof db[modelName].destroy === "function") {
        await db[modelName].destroy({ truncate: true, cascade: true });
        console.log(`✅ Tabella del modello [${modelName}] svuotata.`);
      }
    }

    await db.sequelize.query("SET FOREIGN_KEY_CHECKS = 1;");
    console.log("🔗 Vincoli chiavi esterne riabilitati.");

    // 3. Svuota la cartella delle immagini (Gestendo file e sottocartelle)
    if (fs.existsSync(IMAGES_DIR)) {
      const files = fs.readdirSync(IMAGES_DIR);
      let deletedCount = 0;

      for (const file of files) {
        if (file !== ".gitkeep" && file !== ".DS_Store" && file !== ".db_resetted") {
          const itemPath = path.join(IMAGES_DIR, file);
          
          // 🟢 MODIFICATO: Usa rmSync con recursive per eliminare sia file che cartelle (es. 786_C)
          fs.rmSync(itemPath, { recursive: true, force: true });
          deletedCount++;
        }
      }
      console.log(`✅ Cartella immagini svuotata (${deletedCount} elementi rimossi).`);
      
      // Crea il file di log persistente
      const logPath = path.join(IMAGES_DIR, ".db_resetted");
      const logContent = `Database resettato con successo in data: ${new Date().toISOString()}\n`;
      fs.writeFileSync(logPath, logContent, "utf8");
      console.log("📝 File di stato '.db_resetted' salvato nella cartella immagini.");

    } else {
      console.log("⚠️ Cartella immagini non trovata.");
    }

    console.log("🎉 Reset selettivo completato con successo!");
    process.exit(0);
  } catch (error) {
    console.error("❌ Errore durante il reset:", error);
    try { await db.sequelize.query("SET FOREIGN_KEY_CHECKS = 1;"); } catch (_) {}
    process.exit(1);
  }
}

function askConfirmation() {
  rl.question("⚠️ ATTENZIONE: Questa operazione svuoterà tutte le tabelle (escluse categorie e opzioni) e cancellerà tutte le immagini. Vuoi continuare? (y/N): ", (answer) => {
    const formattedAnswer = answer.trim().toLowerCase();
    if (formattedAnswer === "y" || formattedAnswer === "yes") {
      rl.close();
      runReset();
    } else {
      console.log("❌ Reset annullato dall'utente.");
      rl.close();
      process.exit(0);
    }
  });
}

askConfirmation();
