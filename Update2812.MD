```
CREATE TABLE IF NOT EXISTS `mushborg`.`associateSensors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `valueName` VARCHAR(45) NOT NULL COMMENT 'Identificativo del valore es. (tempGrow)',
  `deviceId` VARCHAR(45) NOT NULL,
  `fieldName` VARCHAR(45) NOT NULL COMMENT 'Nome del campo nell’oggetto (es. per temperatura temp)',
  `label` VARCHAR(45) NOT NULL COMMENT 'Etichetta da visualizzare nell’interfaccia',
  `icon` VARCHAR(45) NULL DEFAULT NULL,
  `postChr` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Postfisso del valore per interfaccia (es. °C, % ecc)',
  `sensorType` INT(11) NULL DEFAULT NULL COMMENT 'I tipi di sensori possono essere (umidità, temperatura, umidità suolo, capacità es cisterna, del. Vento ecc)',
  `storageId` INT(11) NULL DEFAULT NULL,
  `mushElementId` INT(11) NULL DEFAULT NULL,
  `version` INT(11) NOT NULL DEFAULT 0 COMMENT 'Versione dell’associazione',
  `active` TINYINT(1) NOT NULL DEFAULT 1 COMMENT 'Sensore attivo/non attivo 0/1',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
```

```
CREATE TABLE `mushborg_prod`.`acociateAllarms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valueName` VARCHAR(45) NOT NULL,
  `sensorId` INT NULL,
  `switch` INT NULL COMMENT 'Identifica se lo switch del relay è normalmente aperto o normalmente chiuso',
  `topicMqtt` VARCHAR(45) NULL,
  `flagInterval` TINYINT(1) NULL COMMENT 'Definisce se è un attuatore che funziona per intervallo di valori o per temporizzazione',
  `acociateAllarmscol` TINYINT(1) NULL,
  `valMin` FLOAT NULL,
  `valMax` FLOAT NULL,
  `timeOn` DATETIME NULL,
  `timeOff` DATETIME NULL,
  `label` VARCHAR(45) NULL,
  `postChr` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);
```


