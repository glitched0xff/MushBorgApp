# VM Mushborg

| File    | Sha256 | Rilascio | Deprecato |
| -------- | ------- | --------- | ------------ |
| [Mushborg0.1a.ova](https://app.box.com/s/rw2a63fi5pslsautpa5yylq8qjbmtfrp)  | afdbb3c81ffa63326150549f2a246329fb0d1e40     | 23-12-2025|
|| Aggiunta campo speciesId a a tabella Strain - Configutato hostname mushborg.local - Fix sync errato .env - Aggiunta area statistiche in Tools->Statistiche Controllo peso (controlla il peso totale di funghi raccolti in un intervallo di tempo)|
| ~~MushborgV0_19-12-25.ova~~  | 6e1f1ad32ea79126c3fabf4aad3c0db6fd7e83ad     | 19-12-2025| V

 


## Installazione della macchina virtuale Mushborg

- Scaricare e installare VirtualBox di Oracle [https://www.virtualbox.org/](https://www.virtualbox.org/)
- Scaricarel'ultima versione del file OVA di Mushborg
- Controlla l'hash del file scaricato:

    Linux: `$ sha256sum nomeFile`

    OSX: ` # shasum 256 nomeFile`

    Windows PowerShell: `Get-FileHash nomeFile.ova -Algorithm SHA256`


- Importare la virtual machine in VirtualBox:
 
    File -> Importa applicazione virtuale
    
    Selezionare il file da importare
    
    Importare il file, al termine del processo avviare la macchina virtuale

    ❕Controlla che le schede di rete della Vm siano impostate su Bridge e non su NAT (Le schede in bridge permettono di inserire la VM sulla tua rete locale rendendolo raggiungibile da altri dispositivi connessi alla rete)

- Accedi al terminale con le password di default
  
    ```
    user: mushborg
    password mushborg0x0
    ```
- Aggiorna l'applicazione
  
  `cd MushborgApp`

  `git pull`

- Riavvi PM2

    `pm2 restart 0`    

- Controlla che l'applicativo sia attivo digitando
  
    `pm2 ls`    

    Il risultato del comando dovrebbe essere status online 

- (Facoltativo) Trovo l'indirizzo ip della macchina virtuale digitando (V0):
  
    `ip addr`

    L'indirizzo IP pubblico è il secondo che viene presentato della scheda enp0s3, campo inet  (è qualcosa simile a 192.168.x.xx in base alla vostra configurazione).

- Torno sulla mia macchina locale, apro il browser e digito: `http://mushborg.local`
    
    Attenzione: per sistemi windows se si riscontrano problemi controllare l'installazione del servizio Bonjour
    
    Se si riscontrano problemi nel raggiungere `mushborg.local`:

      - Accedere al terminale del computer locale e digitare `ping mushborg.local` 
    
      - Se la risposta è negativa provare a pingare l'ip ddella VM `ping xxx.xxx.xxx.xxx`
    
      - Se la risposta è ancora negativa assicurarsi di essersi loggati nella VM o che la VM non sia spenta.


- Voilà, se tutto è andato per il verso giusto dovreste vedere la homepage di Mushborg.

## Manutenzione e aggiornamento Mushborg

Per mantenre il sistema aggiornato è necessario sincronizzare il repository locale con quello remoto.
Per aggiornare il sistema accedere alla VM. Posizionarsi nella cartella del sistema ~/MushBorgApp e digitare:

`git pull`

Riavvioare PM2

`pm2 restart msuhborg` oppure `pm2 restart 0`

Se l'aggiornamento è andato a buon fine si potrà vedere la lista dei file aggiornati.


ENJOY