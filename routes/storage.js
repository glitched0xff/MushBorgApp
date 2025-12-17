const express = require('express');
const router = express.Router();
const db = require("../models");
const Storage = db.storage;

router.get('/',async  (req, res) => {
    let redirectId=req.query.redirectId?req.query.redirectId:null
    const storages=await Storage.findAll()
  res.render("storage",{storages:storages,redirectId:redirectId})
});

router.get('/getOneStorage',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    const storage=await Storage.findOne({where:{id:storageId}})
    res.status(200).json({storage:storage})
})

router.get('/getRawMaterial',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    const rawMaterial=await db.rawMaterial.findAll({where:{storageId:storageId}})
    res.status(200).json({item:rawMaterial})
})

router.get('/getMushElement',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    const rawMaterial=await db.mushElement.findAll({where:{storageId:storageId,active:1}})
    res.status(200).json({item:rawMaterial})
})

module.exports=router;