# Utility per lo scambio dati tra Home Assistant e Mushborg

In questa cartella sono inseriti estensioni, blueprint, automazioni e script sviluppati per l'interconnessione tra HA (Home assistant) e MB (MushBorg)

## Blueprint > sendToMushborg_change.yaml

Crea l'automazione per l'invio dei dati da HA a MB. Durante la creazione del progetto di automazione è possibile segliere i dati dei sensori inviati a MB. L'automazione è triggerata ad ogni cambio di valore di un determinato sensore. Consigliato per analisi che richiede un'alta risoluzione dei dati

## Blueprint > sendToMushborg_timed.yaml

Crea l'automazione per l'invio dei dati da HA a MB. Durante la creazione del progetto di automazione è possibile segliere i dati dei sensori inviati a MB. L'automazione è triggerata da un timer. Aumentando il tempo diminuscono i dati inviati a MB ed anche la loro precisione.

## Pastorizzazione package

Modulo con interfaccia per la gestione del processo di pastorizzazione in acqua o a vapore.
L'interfaccia permette di selezionare il lotto di substrato da pastorizzare e registra la curva di pastorizzazione.
