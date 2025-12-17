# Metodi di installazione Mushborg

## Installazione tramite repository e configurazione manuale
Configurazione macchina Linux/Raspberry. 

L'installazione è compatibile con Debian

N.b. Se si usa una macchina virtuale assicurarsi che le schede di rete siano in bridge e non in NAT

***

### Prerequisiti
- SO Linux Debian Trixie o sistemi derivati (Raspberry Os)
- Nodejs v >=22
- MariaDb v >= 8

#### Accesso tramite SSH al server
Se il sistema operativo è installato su un raspberry o in una macchina virtuale si può eseguire l'installazione tramite SSH.

` ssh [nome_utente]@[hostname] ` 


### Installare i pacchetti necessari

#### Curl
Pacchetto per il download dei sorgenti di node

` sudo apt-get install curl`

___

#### Nodejs

Seguire le istruzioni del seguente link [NodeJs Official Download](https://nodejs.org/en/download).
Dopo aver selezionato le impostazioni del sistema operativo di destinazione copia e incolla lo script

Lo script dovrebbe apparire simile a quello seguente
```
    # Download and install nvm:
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    
    # in lieu of restarting the shell
    \. "$HOME/.nvm/nvm.sh"
    
    # Download and install Node.js:
    nvm install 24
    
    # Verify the Node.js version:
    node -v # Should print "v24.10.0".
    
    # Verify npm version:
    npm -v # Should print "11.6.1".
```

___

#### MariaDb

Installo il pacchetto MariaDb
` sudo apt-get installa mariadb-server`

Configuro il database

`  sudo mariadb-secure-installation `

- Inserire la password di root
- Switch to unix_socket authentication Y
- Change the root password? Y -> Inserire la nuova password (può essere la stessa della precende)
- Remove anonymous users? Y
- Disallow root login remotely? Y
- Remove test database and access to it? Y
- Reload privilege tables now? Y

Accedo al database

`   mariadb -u root -p `

Creiamo un utente diverso da root per la gestione del database.

```
    Utente di default: mushborg
    Password di default: mushborg0x0
```
L'utente ha tutti i privilegi.

`GRANT ALL ON *.* TO 'mushborg_admin'@'localhost' IDENTIFIED BY 'mushborg0x0' WITH GRANT OPTION;`

Aggiorno i provilegi

`FLUSH PRIVILEGES;`

Creo il database Mushborg

`CREATE DATABASE mushborg`

Controllo che il database sia creato correttamente

`SHOW DATABASES;`

Esco da mariaDb

`EXIT;`

___

#### Clonare il repository

` clone git`

#### Importare il nuovo database

Per importare il database di default seguire la seguente sintassi

mysql -u [username] -p [nome_database] < [percorso_file.sql]

` mariadb -u mushborg -p mushborg < dbBkup/mushborgDb.sql `

#### Installo i pacchetti necessari

` npm i `

Installo Pm2

`sudo npm i pm2 -g`

#### Edit file .env per connessione al db

Di defualt username e password sono quelli indicati precedentemente

`nano .env`

Modifico i dati necessari e chiudo il file con `Ctrl+x`

#### avvio il server

pm2 start server.js --name Mushborg


### Installa webserver per reverse proxy verso la porta 3000

` sudo apt-get install nginx`

Copiare il file di configurazione e modifica per il reverse forwarding

```
cd /etc/nginx/sites-available/
sudo cp defualt default.orig
sudo nano default
```

Eliminare il contenuto e incollare il seguente testo

```
##       
# Configurazione Mushborg
# reverse forwarding dalla porta 80 alla 3000
##
server {
    listen 80;
    server_name mushborg.local;

    location / {
        proxy_set_header   X-Forwarded-For $remote_addr;
        proxy_set_header   Host $http_host;
        proxy_pass         http://localhost:3000;
    }
}
```

Controllo che non ci siano errori

sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful

riavvio il servizio 

sudo systemctl restart nginx

Se tutto è andato a buon fine ci si può collegare a Mushborg e controllare il funzionamento

- Aprire il browser
- Inserire l'ip della macchina o l'hostname

### Possibili problemi

#### Risposta 502 del browser

Probabilmente il sistema avviato ha riscontrato un bug, controllare i parametri nel file `.env` che siano coretti

Controllare il log `pm2 status Mushborg`

#### Pagina irraggiungibile

Potrebbe essere legata alla configurazione del server.

Controllare lo stato del webserver

`sudo systemclt status nginx`