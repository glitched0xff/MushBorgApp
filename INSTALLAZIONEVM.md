# VM Mushborg

| File    | Sha256 | Rilascio |
| -------- | ------- | ---------
| [MushborgV0_19-12-25.ova](https://app.box.com/s/qw8gvw7l11aql7oxcnalyjdxtetzze3w)  | 6e1f1ad32ea79126c3fabf4aad3c0db6fd7e83ad     | 19-12-2025|

 


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
- controlla che l'applicativo sia attivo digitando
  
    `pm2 ls`    

    Il risultato del comando dovrebbe essere status online (vedi immagine allegata)
- Trovo l'indirizzo ip della macchina virtuale digitando:
  
    `ip addr`

    L'indirizzo IP pubblico è il secondo che viene presentato della scheda enp0s3, campo inet  (è qualcosa simile a 192.168.x.xx in base alla vostra configurazione)

- Torno sulla mia macchina locale, apro il browser e digito: http://indirizzoDellaVm
- Voilà, se tutto è andato per il verso giusto dovreste vedere la homepage di Mushborg.

## Manutenzione e aggiornamento Mushborg

Per mantenre il sistema aggiornato è necessario sincronizzare il repository locale con quello remoto.
Per aggiornare il sistema accedere alla VM. Posizionarsi nella cartella del sistema ~/MushBorgApp e digitare:

`git pull`

Riavvioare PM2

`pm2 restart msuhborg` oppure `pm2 restart 0`

Se l'aggiornamento è andato a buon fine si potrà vedere la lista dei file aggiornati.


ENJOY