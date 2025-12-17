const express = require('express');
const router = express.Router();
const ToDo = require("../controllers/toDo.controller");
const moment=require("moment")
const { sensorData } = require('../models');

router.get('/',async  (req, res) => {
    let data=await ToDo.getAllOpenClose(0)
    res.render("todo",{todos:data})
  });

router.get('/getAll',async  (req, res) => {
    let data=await ToDo.getAll()
    res.status(200).json({todos:data})
});

router.post('/insert',async  (req, res) => {
    let data=await ToDo.insert(req.body)
    res.status(200).json({data:data})
});

router.delete('/delete',async (req,res) => {
    let id=req.query.id?req.query.id:false
    if (id!=false){
        await ToDo.delete(id)
        result= await ToDo.getAll()
        res.status(200).json({data:result})
    } else {
        res.status(422).json({error:"Invio dati errati controllare id e val"})
    } 
    
})

router.get('/markDone',async  (req, res) => {
    let id=req.query.id?req.query.id:false
    let val=req.query.val?req.query.val:false
    console.log(id,val)
    if ((id!=false) || (val!=false)){
        let data=await ToDo.markDone(id,val)
        res.status(200).json({data:data})
    } else {
        res.status(422).json({error:"Invio dati errati controllare id e val"})
    }   
});

router.get('/getAllOpenClose',async  (req, res) => {
    console.log(req.query)
    let eseguito=false
    if ((req.query.eseguito==0) || (req.query.eseguito==1)){
        eseguito=true
    }
    console.log(eseguito)
    if (eseguito!=false){
        let data=await ToDo.getAllOpenClose(req.query.eseguito)
        res.status(200).json({data:data})
    } else {
        res.status(422).json({error:"Invio dati errati controllare parametro eseguito"})
    }   
});

router.delete('/delAllDone',async (req,res) => {
    let result=await ToDo.delAllDone()
    console.log(result)
    result= await ToDo.getAll()

    res.status(200).json({data:result})
})

module.exports=router;