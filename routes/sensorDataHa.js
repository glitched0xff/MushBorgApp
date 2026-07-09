/**
 * In questa rpoute vengono gestite le ricezioni dei dati di home assistant 
 * E' una funzione sperimentale che verrà accorpata alla gestione dei sensori in Mushborg
 */
const express = require('express');
const router = express.Router();
const { Op,where,fn,col } = require('sequelize');
const db = require('../models');
const { v4: uuidv4 } = require("uuid");
const moment = require('moment');

router.get('/',async  (req, res) => {
    res.status(200).json({ok:"RICEZIONE DATI"})
});

router.post('/insertData', async (req, res) => {
    console.log("InsertData");
    let timeFilter=120 // valore in secondi
    let HysteresisFilter=0.4 // valore di differenza per cui il dato sia salvato
    
    if (!req.body) {
        return res.status(400).json({ error: "Body mancante" });
    }

    try {
        const currentCode = req.body.sensor_code;
        const currentVal = parseFloat(req.body.val) ? parseFloat(req.body.val) : 0;
        const currentTriggered = moment(req.body.last_triggered);

        //Recupera l'ULTIMO dato salvato 
        const lastRecord = await db.sensorHomeAssistant.findOne({
            where: { sensor_code: currentCode },
            order: [['last_triggered', 'DESC']] // Prende il più recente
        });

        if (lastRecord) {
            const lastVal = parseFloat(lastRecord.val);
            const lastTriggered = moment(lastRecord.last_triggered);

            // DIFFERENZA DI VALORE (< 0.3) 
            const valueDiff = Math.abs(currentVal - lastVal);

            // DIFFERENZA DI TEMPO (< 2 minuti) 
            const timeDiffMinutes = currentTriggered.diff(lastTriggered, 'minutes');

            if (timeDiffMinutes < timeFilter && valueDiff < HysteresisFilter) {
                console.log(" Dato non inserito per filtro di valore HysteresisFilter="+HysteresisFilter+" o filtro temporale timeFilter="+timeFilter)
                // Se non rispetta nessuna delle due condizioni, scartiamo il dato
                return res.status(200).json({ 
                    status: "skipped", 
                    message: "Dato ignorato: variazione minima e meno di 2 minuti trascorsi." 
                });
            }
        }

        // Inserisco il record univoco
        const [result, created] = await db.sensorHomeAssistant.findOrCreate({
            where: { 
                sensor_code: currentCode,
                last_triggered: currentTriggered,
                val: currentVal,
                area: req.body.area,
                class: req.body.class,
            },
            defaults: {
                sensor_code: currentCode,
                friendly_name: req.body.friendly_name,
                val: currentVal,
                unit_of_measurement: req.body.unit_of_measurement,
                area: req.body.area,
                class: req.body.class,
                last_triggered: currentTriggered
            }
        });

        return res.status(200).json({ result, created });

    } catch (err) {
        console.error("Errore durante l'inserimento:", err);
        return res.status(500).json({ error: "Errore interno del server" });
    }
})


router.post('/insertDataPolling',async (req,res)=>{
    console.log("insertDataPolling")
     console.log(req.body)
    
        res.status(200)

})
/********************************************
 * Route per gestione batch pastorizzazione *
********************************************/

/** Richiede la lista dei substrati */
router.get('/ask_substrate',async (req,res)=>{

    await db.substrate.findAll({
        where:{destination:"CULTIVATION",batched:0},
        include:[{model: db.recipe, where:{pretreatmentId:4}}],
        attributes:["cod_substrate","recipeId"],
    })
    .then((result)=>{
       // console.log(JSON.parse(JSON.stringify(result)))
        res.status(200).json(result)
    })
    .catch((err)=>{
        console.log(err)
    })
})

/** Avvia il batch per la pastorizzazione */
router.put('/startBatch',async (req,res)=>{
    //console.log(req.body)
    let code_substrate=req.body.substrateCode
    await db.pastorizzazioneBatch.create({
            code_substrate:code_substrate,
            stato:"START_BATCH",
            last_updated:moment()
        }).then(result=>{
            console.log("Start batch")
           // console.log(JSON.parse(JSON.stringify(result)))
            console.log("Dato inserito")
            res.status(200).json({date:moment()})
        }).catch(err=>{
            console.log(err)
        })
})
/** Termina il batch per la pastorizzazione */
router.post('/stopBatch',async (req,res)=>{
    //console.log(req.body)
    /*** TODO: Flaggare batched nel substrato */
    let code_substrate=req.body.substrateCode
    await db.pastorizzazioneBatch.create({
            code_substrate:code_substrate,
            stato:"STOP_BATCH",
            last_updated:moment()
        }).then(result=>{
            //console.log(JSON.parse(JSON.stringify(result)))
                console.log("Stop batch")

            res.status(200).json(result)
        }).catch(err=>{
            console.log(err)
        })
})
/** Aggiorna il batch della pastorizzazione */
router.post('/updateBatch',async (req,res)=>{
    console.log("Update batch")
    console.log(req.body)
    /*** TODO: Prima controllo se ho già lo stesso dato nel db */
    await db.pastorizzazioneBatch.create({
            code_substrate:req.body.substrateCode,
            stato:req.body.state,
            tempPastorizzazione:req.body.tempValue ? req.body.tempValue : null,
            tempAmbiente:req.body.tempAmbiente ? req.body.tempAmbiente : null,
            last_updated:moment()
        }).then(result=>{
            // console.log(JSON.parse(JSON.stringify(result)))
            // console.log("Dato inserito")
            res.status(200).json({date:moment()})
        }).catch(err=>{
            console.log(err)
        })
})


module.exports=router;