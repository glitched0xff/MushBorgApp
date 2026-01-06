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
    const storage=await Storage.findOne({where:{id:storageId},
                                            include:[{model:db.associateActuator},
                                                     {model:db.associateAllarm},
                                                     {model:db.associateSensor}]})
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

/** Actuators */
router.get('/getActuatorsStorages',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    let actuators= await db.associateActuator.findAll({where:{storageId:storageId,active:1}})
    res.status(200).json({actuators:actuators})

})
/** Allarm */
router.get('/getAllarmStorages',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    let allarm= await db.associateAllarm.findAll({where:{storageId:storageId,active:1}})
    res.status(200).json({allarm:allarm})
})

/** Sensors */
router.get('/getSensorsStorages',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    let sensors= await db.associateSensor.findAll({where:{storageId:storageId,active:1},
                                                        include: [{
                                                            model: db.sensorData,
                                                            limit:1,
                                                            order:[["createdAt","DESC"]],
                                                            required: false,
                                                        }]
                                                    })
    // sensors=console.log(JSON.parse(JSON.stringify(sensors)))
    // for (let i = 0; i < sensors.length; i++) {
    //     const sens = sensors[i];
    //     let lastmessage=await db.sensorData.findOne({where:{deviceId:sensors.deviceId},order:[["createdAt","DESC"]]})
        
    // }
    
    res.status(200).json({sensors:sensors})

})
module.exports=router;