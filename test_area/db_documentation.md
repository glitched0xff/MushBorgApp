#  Documentazione Database `mushborg`
V0 rev.1 

- [Documentazione Database `mushborg`](#documentazione-database-mushborg)
  - [Tabella `calendarCategories`](#tabella-calendarcategories)
  - [Tabella `calendars`](#tabella-calendars)
  - [Tabella `containers`](#tabella-containers)
  - [Tabella `containerTypes`](#tabella-containertypes)
  - [Tabella `dDOptions`](#tabella-ddoptions)
  - [Tabella `devices`](#tabella-devices)
  - [Tabella `diaryNotes`](#tabella-diarynotes)
  - [Tabella `fructifications`](#tabella-fructifications)
  - [Tabella `inoculums`](#tabella-inoculums)
  - [Tabella `materialCategories`](#tabella-materialcategories)
  - [Tabella `movimentations`](#tabella-movimentations)
  - [Tabella `mushElementHarvests`](#tabella-mushelementharvests)
  - [Tabella `mushElementNotes`](#tabella-mushelementnotes)
  - [Tabella `mushElements`](#tabella-mushelements)
  - [Tabella `pretreatments`](#tabella-pretreatments)
  - [Tabella `propagations`](#tabella-propagations)
  - [Tabella `rawMaterials`](#tabella-rawmaterials)
  - [Tabella `recipeElements`](#tabella-recipeelements)
  - [Tabella `recipes`](#tabella-recipes)
  - [Tabella `seeds`](#tabella-seeds)
  - [Tabella `sensorData`](#tabella-sensordata)
  - [Tabella `spawns`](#tabella-spawns)
  - [Tabella `species`](#tabella-species)
  - [Tabella `storages`](#tabella-storages)
  - [Tabella `strains`](#tabella-strains)
  - [Tabella `substrateElements`](#tabella-substrateelements)
  - [Tabella `substrates`](#tabella-substrates)
  - [Tabella `suppliers`](#tabella-suppliers)
  - [Tabella `todos`](#tabella-todos)
  - [Tabella `unknowMessages`](#tabella-unknowmessages)
  - [Tabella `users`](#tabella-users)


## Tabella `calendarCategories`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id categoria evento |
| nome_categoria | varchar(255) | Nome della categoria |
| colore | varchar(255) | Colore della categoria |
| class | varchar(255) | Class che identifica il colore della label della categoria |
| show | int(11) | Flag di visualizzazione |
| createdAt | datetime |  |
| updatedAt | datetime |  |

## Tabella `calendars`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| title | varchar(255) | Titolo evento |
| description | text | Descrizione evento |
| start | datetime | Inizio evento Datetime |
| end | datetime | Fine evento Datetime |
| allDay | tinyint(4) | Evento della durata giornaliera |
| category | int(11) | Id della categoria di appartenenza dell’evento |
| relatedElement | int(11) | Elemento connesso all’evento |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |
| completed | int(11) | Flag evento completato |
| calendarCategoryId | int(11) | Id della categoria di appartenenza dell’evento |

## Tabella `containers`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Container Id |
| code_container | varchar(255) | Codice contenitore |
| container_name | varchar(255) | Nome contenitore |
| capacity | float | Capacità |
| uom | varchar(255) | Unità di misura |
| material | varchar(255) | Materiale |
| reusable | int(1) | Flag contenitore riutilizzabile |
| supplierId | int(11) | Fornitore contenitore |
| type | varchar(255) | Tipo di contenitore |
| destination | varchar(45) | Destinazione |
| used | int(11) | Utilizzato *#deprecato* |
| note | varchar(255) | Note contenitore |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `containerTypes`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id tipo contenitore |
| txt | varchar(255) | Txt per drop down |
| val | varchar(255) | Val drop down |
| createdAt | datetime | Creato il Seqiuelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `dDOptions`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id Opzione |
| txt | varchar(255) | Testo per dropdown |
| val | tinyint(3) | Valore per dropdown |
| ddMenu | varchar(255) | Chiave menu |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `devices`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id device |
| cod_device | varchar(255) | Codice device |
| descrizione | varchar(255) | Descrizione device |
| posizione | varchar(255) | Posizione device (descrizione) |
| storageId | int(11) | Id Magazzino |
| ip | varchar(45) | Ip dispositivo |
| url | varchar(45) | URL richiesta dati |
| note | varchar(200) | Note dispositivo |
| cronString | varchar(45) | Cron string per polling |
| data | datetime | Data |
| temp | tinyint(1) | Flag temperatura |
| hum | tinyint(1) | Flag umidità |
| co2 | tinyint(1) | Flag co2 |
| light | tinyint(1) | Flag luce |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `diaryNotes`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id Nota |
| nota | text | Testo Note |
| area | varchar(45) | Area di appartenenza |
| tag | varchar(45) | Tag Nota |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `fructifications`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| code_fructification | varchar(255) |  |
| propagationId | int(11) |  |
| note | varchar(255) |  |
| createdAt | datetime |  |
| updatedAt | datetime |  |

## Tabella `inoculums`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id Inoculo |
| code_inoculum | varchar(45) | Codice inoculo |
| inoculum_name | varchar(45) | Nome inoculo |
| strainId | int(11) | Strain Id collegata a tabella Strains |
| containerId | int(11) | Contenitore id del lotto |
| n_container | int(11) | Numero contenitori da produrre |
| cultivation_media | varchar(65) | Tipo di media di coltivazione *#Deprecato* |
| exp_date | datetime | Data scadenza |
| expected_maturation_date | datetime | Maturazione stimata |
| storageId | int(11) | Id magazzino |
| purchased | tinyint(1) | Flag inoculo acquistato |
| substrateId | int(11) | Substrato di coltivazione |
| note | varchar(255) | Note dell’inoculo |
| mediaStrain | int(2) | Provenienza dello strain es. CL Petri Campione fresco Campione secco ecc |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `materialCategories`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id categoria del materiale |
| category_name | varchar(255) | Nome categoria |
| hum_factor | float | Fattore di umidità |
| dry_factor | int(11) | *#Deprecato* |
| note | varchar(255) | Note categoria |
| color | varchar(255) |  |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `movimentations`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id Movimentazione |
| relatedId | int(11) | Id elemento movimentato |
| from | tinyint(2) | Magazzino di partenza  |
| to | tinyint(2) | Destinazione elemento |
| type | varchar(45) | Tipo di movimentazione |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `mushElementHarvests`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id raccolto |
| mushElementId | int(11) | Elemento di riferimento del raccolto |
| harvest_date | datetime | Data di raccolta |
| harvest_weight | int(11) | Peso raccolta in gr |
| note | text | Note raccolta |
| type | varchar(15) | Tipo elemento INOCULUM - SPAWN - CULTIVATION |
| createdAt | varchar(45) | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `mushElementNotes`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id Nota elemento |
| mushElementId | int(11) | Elemento di riferimento |
| check_date | datetime | Data di controllo |
| stato | varchar(255) | Stato dell’elemento da dropDown |
| pict | varchar(255) | Immagine della nota |
| note | varchar(255) | Testo della nota |
| type | varchar(45) | Tipo elemento INOCULUM - SPAWN - CULTIVATION |
| createdAt | datetime | Creato il sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `mushElements`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id elemento |
| element_code | varchar(45) | Codice elemento |
| type | varchar(15) | Tipo elemento INOCULUM - SPAWN - CULTIVATION |
| relatedId | int(11) | Id lotto di riferimento |
| load_date | datetime | Data di creazione |
| pick_date | datetime | Data di eliminazione (pick) |
| pick_reason | varchar(255) | Ragione di eliminazione (pick) |
| stato | varchar(255) | Stato dell’elemento |
| stage | tinyint(1) | Flag di stage, se 0=Propagazione 1=Fruttificazione |
| qt | float | Quantità |
| expected_fructification_date | datetime | Data fruttificazione stimata |
| real_fructification_date | datetime | Data reale fruttificazione |
| expected_maturation_date | datetime | Data prevista maturazione |
| real_maturation_date | datetime | Data reale maturazione |
| substrateId | varchar(45) | Id substrato |
| note | varchar(255) | Note dell’elemento |
| active | tinyint(4) | Flag elemento attivato |
| storageId | tinyint(1) | Id Magazzino |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `pretreatments`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id pretrattamento |
| pretreatment_name | varchar(255) | Nome pretrattamento |
| type | varchar(255) | Tipo di trattamento |
| protocol | text | Protocollo -TXT- |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `propagations`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id lotto propagazione |
| code_propagation | varchar(255) | Codice lotto propagazione |
| propagation_name | varchar(45) | Nome lotto propagazione |
| strainId | int(11) | Strain id utilizzata |
| substrateId | int(11) | Subrato Id associato |
| containerId | int(11) | Contenitore del loto |
| n_container | int(11) | Numero contenitori che compongono il lotto |
| qt | int(11) | Quantità |
| substrateQt | float | Quantità substrato |
| spawnQt | float | Quantità spawn |
| percInoculo | float | Percentuale inoculo |
| storageId | int(11) | Magazzino |
| purchased | tinyint(1) | Lotto acquistato |
| note | varchar(45) | Note del lotto |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `rawMaterials`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id Materiale |
| material_name | varchar(255) | Nome materiale |
| materialCategoryId | int(11) | Categoria materiale collegata |
| supplierId | int(11) | Fornitore materiale |
| date_storage | datetime | Data di immagazzinamento |
| quantity | float | Quantità |
| uom | varchar(255) | Unità di misura |
| hum_factor | float | Fattore di umidità |
| note | varchar(255) | Note sul materiale |
| storageId | int(11) | Magazzino |
| destination | varchar(45) | Destinazione elemento ALL - INOCULUM - SPAWN - CULTIVATION |
| used | int(11) | *#Deprecato* |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `recipeElements`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Il elemento della ricetta |
| recipeId | int(11) | Id ricetta di riferimento |
| materialCategoryId | int(11) | Categoria del materiale |
| percentage | float | Percentuale |
| wet_weight | int(11) | * Deprecato * |
| categoryName | varchar(45) | Nome categoria |
| position | int(11) | Posizione |
| createdAt | datetime | Creato il sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `recipes`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id ricetta |
| cod_recipe | varchar(255) | Codice ricetta |
| sub_code | varchar(2) | Sub codice di riferimento della ricetta  |
| recipe_name | varchar(255) | Nome della ricetta |
| note | varchar(255) | Note della ricetta |
| destination | varchar(45) | Destinazione della ricetta  |
| used | int(11) | * #Deprecato * |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `seeds`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id seed |
| relatedId | int(11) | Elemento relativo |
| inoculumId | int(11) | Id inoculo quando usato in spawn |
| spawnId | int(11) | Id Spawn quando utilizzato in cultivation |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `sensorData`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id registrazione dati |
| cod_device | varchar(45) | Codice device dati |
| temp | float | Dato temperatura |
| hum | float | Dato umidità |
| Co2 | float | Dato Co2 |
| status | tinyint(1) | Stato device |
| flag01 | tinyint(1) | * #Blank * |
| flag02 | tinyint(1) | * #Blank * |
| deviceId | int(11) | Device id collegato |
| storageId | int(11) | Magazzino |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `spawns`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id Spawn |
| code_spawn | varchar(255) | Codice spawn |
| spawn_name | varchar(45) | Nome spawn |
| strainId | int(11) | Strain collegata |
| strainPerc | float | * #Deprecato * |
| strainWeight | float | * #Deprecato * |
| qt | float | Quantità |
| containerId | int(11) | Id contenitori |
| n_container | int(11) | Numero contenitori |
| substrateId | int(11) | Substrato utilizzato |
| substrateQt | int(11) | Quantità substrato |
| inoculumId | int(11) | Inoculo collegato |
| inoculumQt | int(11) | Quantità inoculo |
| note | varchar(255) | Note spawn |
| purchased | tinyint(1) | Flacg spawn acquistato |
| storageId | tinyint(2) | Magazzino |
| exp_date | datetime | Data scadenza |
| expected_maturation_date | datetime | Data prevista di maturazione |
| createdAt | datetime | Creato il sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `species`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id specie di fungo |
| species_name | varchar(45) | Nome della specie |
| description | varchar(45) | Descrizione specie |
| shortCode | varchar(2) | Codice abbreviato specie |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `storages`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| code_storage | varchar(255) |  |
| name_storage | varchar(255) |  |
| data_storage | varchar(255) |  |
| note | varchar(255) |  |
| rawmaterial | tinyint(1) |  |
| strain | tinyint(1) |  |
| container | tinyint(1) |  |
| spawn | tinyint(1) |  |
| mushElement | tinyint(1) |  |
| propagation | tinyint(1) |  |
| createdAt | datetime |  |
| updatedAt | datetime |  |

## Tabella `strains`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) | Id strain |
| code_strain | varchar(255) | Codice strain |
| sub_code | varchar(2) | Sub codice di 2 caratteri che identificano la strain
 |
| strain_name | varchar(255) | Nome della strain |
| percentage | int(11) | Percentuale di utilizzo *#Deprecato* |
| species | varchar(255) | Specie -> collegato alla tabella species |
| species_code | varchar(45) | Codice specie di 2 caratteri |
| description | varchar(255) | Descrizione strain |
| generation | varchar(255) | Generazione strain |
| derivedFrom | varchar(255) | Strain derivata da altra strain, può essere usata per i rinfreschi delle strain. 

Per la moltiplicazione si fa un lotto di inoculo |
| incubation_temp | varchar(255) | Temperatura di incubazione |
| incubation_hum | varchar(255) | Umidità relativa incubazione |
| incubation_len | varchar(255) | Durata incubazione |
| incubation_co2 | varchar(255) | Co2 ppm richiesti in incubazione |
| incubation_airExch | varchar(45) | Cicli di cambio d’aria in un’ora |
| incubation_light | varchar(45) | Temperatura luce per incubazione |
| primordia_temp | varchar(45) | Temperatura sviluppo primordi |
| primordia_hum | varchar(45) | Umidità relativa formazione primordi |
| primordia_len | varchar(45) | Durata formazione primordi |
| primordia_co2 | varchar(45) | Co2 ppm per primordi |
| primordia_airExch | varchar(45) | Cicli di cambio d’aria per primordi |
| primordia_light | varchar(45) | Temperatura luce per primordi |
| fructification_temp | varchar(255) | Temperatura di fruttificazione |
| fructification_hum | varchar(255) | Umidità relativa di fruttificazione |
| fructification_len | varchar(255) | Durata fruttificazione |
| fructification_co2 | varchar(255) | Co2 ppm richiesti per fruttificazione |
| fructification_airExch | varchar(45) | Cicli di ricambio d’aria in un’ora |
| fructification_light | varchar(45) | Temperatura luce per fruttificazione |
| light_temp | varchar(255) |  |
| outdoor | int(11) | Flag strain coltibalie outdoor |
| indoor | int(11) | Flag strain coltibalie indoor |
| buyed | datetime | Flag strain acquistata |
| liked_substrate | varchar(255) | Substrati consigliati *#Todo migliorare la gestione* |
| qt | int(11) | Quantità *#Non utilizzato* |
| supplierId | int(11) | Fornitore strain |
| conservationMedia | int(2) | Media di conservazione della strain se esistente CL, Petri Campione ecc.. |
| note | varchar(255) | Note strain |
| createdAt | datetime | Creato il Sequelize |
| updatedAt | datetime | Aggiornato il Sequelize |

## Tabella `substrateElements`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| substrateId | int(11) |  |
| materialCategoryId | int(11) |  |
| rawMaterialId | int(11) |  |
| materialName | varchar(50) |  |
| qt_hum | float |  |
| qt_dry | float |  |
| pretreatmentId | int(2) |  |
| pretreatmentNote | varchar(100) |  |
| createdAt | datetime |  |
| updatedAt | datetime |  |

## Tabella `substrates`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| cod_substrate | varchar(255) |  |
| name_substrate | varchar(255) |  |
| sub_code | varchar(2) |  |
| recipeId | int(11) |  |
| recipe_name | varchar(255) |  |
| pretreatment | varchar(255) |  |
| pretreatmentId | int(11) |  |
| pretreatmentNote | varchar(255) |  |
| qt | float |  |
| uom | varchar(3) |  |
| destination | varchar(45) |  |
| note | varchar(255) |  |
| forPurchased | tinyint(1) |  |
| createdAt | datetime |  |
| updatedAt | datetime |  |

## Tabella `suppliers`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| supplier_name | varchar(255) |  |
| address | varchar(255) |  |
| phone | varchar(255) |  |
| mail | varchar(255) |  |
| field | varchar(45) |  |
| taxInfo | varchar(45) |  |
| note | varchar(255) |  |
| createdAt | datetime |  |
| updatedAt | datetime |  |
| used | int(11) |  |

## Tabella `todos`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| titolo | varchar(255) |  |
| descrizione | varchar(255) |  |
| priority | varchar(255) |  |
| eseguito | tinyint(1) |  |
| sezione | varchar(255) |  |
| durata | varchar(255) |  |
| posizione | int(11) |  |
| createdAt | datetime |  |
| updatedAt | datetime |  |

## Tabella `unknowMessages`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| from | varchar(255) |  |
| message | varchar(255) |  |
| createdAt | datetime |  |
| updatedAt | datetime |  |

## Tabella `users`

| Campo | Tipo | Commento |
|-------|------|----------|
| id | int(11) |  |
| username | varchar(255) |  |
| password | varchar(255) |  |
| email | varchar(255) |  |
| data | datetime |  |
| enable | tinyint(1) |  |
| createdAt | datetime |  |
| updatedAt | datetime |  |

