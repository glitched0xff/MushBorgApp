# Installazione Mushborg tramite Docker

Questa guida spiega come installare, gestire, aggiornare e resettare l'applicazione **Mushborg** e il relativo database MariaDB utilizzando Docker e Docker Compose.

---

## Installare docker

Prima di iniziare, è necessario installare l'ambiente Docker sul proprio computer.

1. Scarica **Docker Desktop** dal sito ufficiale: [https://docker.com](https://docker.com).
2. Scegli la versione adatta al tuo sistema operativo (Mac con chip Apple/Intel, Windows o Linux).
3. Avvia l'installazione e segui le istruzioni a schermo.
4. Assicurati che l'applicazione Docker Desktop sia aperta e in esecuzione in background prima di procedere con i comandi successivi.

---

## Clonare il repository

Apri il terminale del tuo computer (o la shell di VS Code) e scarica l'intero pacchetto dell'applicazione digitando:

```bash
git clone https://github.com/glitched0xff/MushBorgApp.git
```

Entra all'interno della cartella principale del progetto appena scaricato:

```bash
cd MushBorgApp
```

*Nota: Tutti i comandi successivi di questa guida vanno eseguiti tassativamente rimanendo all'interno della cartella principale `MushBorgApp`.*

---

## Creare il container

Il sistema configurerà ed avvierà automaticamente sia l'applicazione Node.js (con tutte le dipendenze per Canvas e Puppeteer) sia il database MariaDB, importando la struttura iniziale dal file `db.sql`.

Esegui il comando di build e avvio in background:

```bash
docker compose up -d --build
```

Al termine della procedura, l'applicazione sarà raggiungibile dal tuo browser al seguente indirizzo locale:
👉 **[http://localhost:3006](http://localhost:3006)**

---

## Svuotare il sistema da dati di test

Se hai avviato il sistema in precedenza e desideri cancellare completamente ogni dato, rimuovere i container e **azzerare totalmente il database** per ripartire da una configurazione iniziale pulita (ricaricando il file `db.sql` di default), esegui:

```bash
docker compose down -v
```

*Il flag `-v` rimuove in modo permanente i volumi sul disco fisso  compreso le cartelle dei documenti e delle immagini. Al successivo avvio con `docker compose up -d` il database verrà ricreato da zero.*

---

## Aggiornare il sistema

Grazie alla mappatura dei volumi del codice sorgente, l'utente può scaricare gli aggiornamenti rilasciati su Git in modo istantaneo. La persistenza dei dati del database e delle immagini inserite è garantita.

Esegui questa sequenza per aggiornare l'applicazione:

```bash
# 1. Scarica le ultime modifiche dal repository Git
git pull

# 2. Ricostruisce l'applicazione nel caso siano cambiati pacchetti nel package.json
docker compose up -d --build
```

---

## Resettare il sistema

È presente uno script interattivo per effettuare la pulizia dei dati di produzione senza perdere le configurazioni strutturali essenziali. 

Lanciando questo comando, verranno **svuotate tutte le tabelle del database** (ad esclusione delle tabelle `calendarCategories` e `dDOptions`) e verrà **ripulita interamente la cartella delle immagini** `imgMushEleNote`. Al termine, verrà generato un file marcatore `.db_resetted` come registro dell'operazione.

Per avviare il reset interattivo, esegui:

```bash
docker compose exec -it app npm run db-reset
```

Il terminale bloccherà l'esecuzione e chiederà una conferma digitando `y/N`:
* Digita `y` o `yes` e premi Invio per procedere con il reset selettivo.
* Premi Invio o digita qualsiasi altro carattere per annullare l'operazione in totale sicurezza.

---

## Comandi utili per la gestione di Docker

Di seguito l'elenco dei comandi principali da eseguire nella root del progetto per gestire l'infrastruttura nel quotidiano.

### 🟢 Avviare e Fermare i Container
* **Avviare i container esistenti** (senza ricompilare):
  ```bash
  docker compose start
  ```
* **Fermare i container temporaneamente** (senza perdere i dati del DB):
  ```bash
  docker compose stop
  ```
* **Spegnere e rimuovere i container** (i dati del DB rimangono comunque al sicuro nei volumi):
  ```bash
  docker compose down
  ```

### 📊 Monitoraggio e Log
* **Controllare lo stato dei container attivi:**
  ```bash
  docker compose ps
  ```
* **Leggere i log in tempo reale (tutti i servizi):**
  ```bash
  docker compose logs -f
  ```
* **Leggere i log in tempo reale solo dell'app Node.js:**
  ```bash
  docker compose logs -f app
  ```
* **Leggere i log in tempo reale solo del database MariaDB:**
  ```bash
  docker compose logs -f mariadb
  ```

### 🛠️ Accesso e Controllo Diretto
* **Entrare nella riga di comando (shell Alpine Linux) dell'app:**
  ```bash
  docker compose exec -it app sh
  ```
* **Uscire dalla shell del container:**
  Digitare `exit` e premere Invio.
* **Verificare la presenza del file marcatore del reset del DB:**
  ```bash
  docker compose exec app cat ../public/imgMushEleNote/.db_resetted
  ```