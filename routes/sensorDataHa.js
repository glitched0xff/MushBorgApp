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

router.post('/insertData',async (req,res)=>{
    console.log("InsertData")
    // console.log(req.body)
    if (req.body){
        const dt = new Date(req.body.last_triggered);
        
        // Controllo e inserimento automatico
            await db.sensorHomeAssistant.findOrCreate({
        where: { 
            sensor_code: req.body.sensor_code,
            last_triggered: moment(req.body.last_triggered) ,
            val: parseFloat(req.body.val)? parseFloat(req.body.val):0,
            area: req.body.area,
            class: req.body.class,
        },
        defaults: {
            sensor_code:req.body.sensor_code,
            friendly_name: req.body.friendly_name,
            val: parseFloat(req.body.val)? parseFloat(req.body.val):0,
            unit_of_measurement: req.body.unit_of_measurement,
            area: req.body.area,
            class: req.body.class,
            last_triggered: moment(req.body.last_triggered)
        }
        }).then(result=>{
            // console.log("Dato inserito")
            // console.log(result)
            res.status(200).json(result)
        }).catch(err=>{
            console.log(err)
        })

        // if (creataOra) {
        // console.log('Nuovo dato salvato con successo!');
        // res.status(200).json(result)
        // } else {
        // console.log('Dato già presente a database. Ignorato.');
        // }
                
        
        
        // let present=db.sensorHomeAssistant.count({})
        // await db.sensorHomeAssistant.create({
        //     sensor_code:req.body.sensor_code,
        //     friendly_name: req.body.friendly_name,
        //     val: parseFloat(req.body.val)? parseFloat(req.body.val):0,
        //     unit_of_measurement: req.body.unit_of_measurement,
        //     area: req.body.area,
        //     class: req.body.class,
        //     last_triggered: moment(req.body.last_triggered)
        // }).then(result=>{
        //     console.log("Dato inserito")
        //     res.status(200).json(result)
        // }).catch(err=>{
        //     console.log(err)
        // })
    } else {
        res.status(200)
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