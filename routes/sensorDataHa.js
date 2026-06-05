/**
 * In questa rpoute vengono gestite le ricezioni dei dati di home assistant 
 * E' una funzione sperimentale che verrà accorpata alla gestione dei sensori in Mushborg
 */
const express = require('express');
const router = express.Router();
const { Op,where,fn,col } = require('sequelize');
const moment=require("moment")
const db = require('../models');

router.get('/',async  (req, res) => {
    res.status(200).json({ok:"RICEZIONE DATI"})
});

router.post('/insertData',async (req,res)=>{
     console.log(req.body)
     const dt = new Date(req.body.last_triggered);
    await db.sensorHomeAssistant.create({
        sensor_code:req.body.sensor_code,
        friendly_name: req.body.friendly_name,
        val: parseFloat(req.body.val),
        unit_of_measurement: req.body.unit_of_measurement,
        area: req.body.area,
        class: req.body.class,
        last_triggered: moment(req.body.last_triggered)
    }).then(result=>{
        res.status(200).json(result)
    }).catch(err=>{
        console.log(err)
    })
   
})

module.exports=router;