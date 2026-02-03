# Modifiche db Mushborg

### 1-02-25

Modificata tabella MushElement, aggiunto strainId per filtrare i singoli elementi per strain

ALTER TABLE `mushborg`.`mushElements` 
ADD COLUMN `strainId` INT(11) NULL DEFAULT NULL AFTER `element_code`;