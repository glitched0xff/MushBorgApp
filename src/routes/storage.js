const express = require('express');
const router = express.Router();
const db = require("../models");
const dropDownGenerator= require("../module/dropDownGenerator")

const Storage = db.storage;

router.get('/',async  (req, res) => {
    let redirectId=req.query.redirectId?req.query.redirectId:null
    const storages=await Storage.findAll()
  res.render("storage",{redirectId:redirectId})
});

router.get('/getAll',async (req,res)=>{
    const storages=await Storage.findAll()
    res.status(200).json({storages:storages})
})

router.get('/storageZoom',async  (req, res) => {
    let storageId=req.query.storageId?req.query.storageId:null
    if(storageId!=null){
        const storageData=await Storage.findOne({where:{id:storageId}})
        res.render("storageZoom",{storageData:storageData})
    }
    else{
        res.redirect('/storage');
    }
});

router.post('/newStorage',async (req,res)=>{
    console.log(req.body)
    await db.storage.create({
        name_storage:req.body.name_storage,
        code_storage:req.body.code_storage,
        data_storage:req.body.data_storage,
        area_HomeAssistant:req.body.area_HomeAssistant,
        note:req.body.note,
        rawmaterial:req.body.rawmaterial?req.body.rawmaterial:0,
        inoculum:req.body.inoculum?req.body.inoculum:0,
        spawn:req.body.spawn?req.body.spawn:0,
        propagation:req.body.propagation?req.body.propagation:0,
        container:req.body.container?req.body.container:0
    }).then(result=>{
        res.status(200).json(result)
    }).catch(err=>{
        console.log(err)
    })
})

router.delete('/deleteStorage',async (req,res)=>{
    let idStorage=req.query.idStorage?req.query.idStorage:false
    if (idStorage){
     await db.storage.destroy({where:{id:idStorage}})
     .then(result=>{
             res.status(200).json(result)
         }).catch(err=>{
             console.log(err)
         })
    }
})

router.get('/getOneStorage',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    console.log(storageId)
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