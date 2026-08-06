const db = require("./models/index");
const fs = require("fs");
const path = require("path");
const readline = require("readline"); // Modulo nativo di Node.js per l'input da terminale

// Percorso della cartella immagini (dentro src/public/...)
const IMAGES_DIR = path.join(__dirname, "public", "imgMushEleNote");

// Inserisci qui i nomi ESATTI dei modelli Sequelize da NON cancellare (esclusi dal reset)
const EXCLUDED_MODELS = ["calendarCategories", "dDOptions"];

// Configurazione dell'interfaccia di lettura da terminale
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

async function runReset() {
  console.log("🔄 Avvio del reset totale (mantenendo le categorie e le opzioni)...");

  try {
    // 1. Disabilita i vincoli delle chiavi esterne per evitare blocchi durante i TRUNCATE
    await db.sequelize.query("SET FOREIGN_KEY_CHECKS = 0;");
    console.log("🔗 Vincoli chiavi esterne temporaneamente disabilitati.");

    // 2. Cicla su tutti i modelli registrati in Sequelize
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

    // Riabilita i vincoli delle chiavi esterne
    await db.sequelize.query("SET FOREIGN_KEY_CHECKS = 1;");
    console.log("🔗 Vincoli chiavi esterne riabilitati.");

    // 3. Svuota la cartella delle immagini senza eliminarla
    if (fs.existsSync(IMAGES_DIR)) {
      const files = fs.readdirSync(IMAGES_DIR);
      let deletedCount = 0;

      for (const file of files) {
        if (file !== ".gitkeep" && file !== ".DS_Store") {
          fs.unlinkSync(path.join(IMAGES_DIR, file));
          deletedCount++;
        }
      }
      console.log(`✅ Cartella immagini svuotata (${deletedCount} file rimossi).`);
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

// Funzione principale che chiede la conferma all'utente
function askConfirmation() {
  rl.question("⚠️ ATTENZIONE: Questa operazione svuoterà tutte le tabelle (escluse categorie e opzioni) e cancellerà tutte le immagini. Vuoi continuare? (y/N): ", (answer) => {
    const formattedAnswer = answer.trim().toLowerCase();
    
    if (formattedAnswer === "y" || formattedAnswer === "yes") {
      rl.close();
      runReset(); // Avvia la cancellazione vera e propria
    } else {
      console.log("❌ Reset annullato dall'utente.");
      rl.close();
      process.exit(0);
    }
  });
}

// Avvia la richiesta di conferma
askConfirmation();
