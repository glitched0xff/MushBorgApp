const express = require('express');
const router = express.Router();
const db = require("../models");
const dropDownGenerator= require("../module/dropDownGenerator")

const Storage = db.storage;

router.get('/',async  (req, res) => {
    let redirectId=req.query.redirectId?req.query.redirectId:null
    const storages=await Storage.findAll()
  res.render("storage",{storages:storages,redirectId:redirectId})
});

router.get('/storageZoom',async  (req, res) => {
    let storageId=req.query.storageId?req.query.storageId:null
    if(storageId!=null){
        const storageData=await Storage.findOne({where:{id:storageId}})
        const activeSensorDD=await dropDownGenerator("selectDevice",{where:{active:1,type:"S"}})
        const activeActuatorDD=await dropDownGenerator("selectDevice",{where:{active:1,type:"R"}})
        res.render("storageZoom",{storageData:storageData,
                                  activeSensorDD:activeSensorDD,
                                  activeActuatorDD:activeActuatorDD})
    }
    else{
        res.redirect('/storage');
    }
});

router.post('/newStorage',async (req,res)=>{
    //console.log(req.body)
    await db.storage.create({
        name_storage:req.body.name_storage,
        code_storage:req.body.code_storage,
        data_storage:req.body.data_storage,
        note:req.body.note,
        rawmaterial:req.body.rawmaterial?req.body.rawmaterial:0,
        inoculum:req.body.inoculum?req.body.inoculum:0,
        spawn:req.body.spawn?req.body.spawn:0,
        propagation:req.body.propagation?req.body.propagation:0,
        container:req.body.container?req.body.container:0,
        mushElement:0,
        strain:0
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
router.post('/associateActuatorStorage',async (req,res)=>{
    //console.log(req.body)
    db.associateActuator.create({
         storageId:req.body.actuator_storageId,
        sensorId:req.body.actuator_sensorId,
        switch:req.body.actuator_switch,
        topicMqtt:req.body.actuator_topicMqtt,
        payloadMqtt:req.body.actuator_payloadMqtt,
        referenceSensorId:req.body.actuator_referenceSensorId,
        referenceField:req.body.actuator_referenceField,
        valueName:req.body.actuator_valueName,
        label:req.body.actuator_label,
        postChr:req.body.actuator_postChr,
        flagTimer:req.body.actuator_flagInterval,
        timeOn:req.body.actuator_timeOn,
        timeOff:req.body.actuator_timeOff,
        flagInterval:req.body.actuator_flagInterval,
        valMin:req.body.actuator_valMin,
        valMax:req.body.actuator_valMax
    }).catch(err=>{console.log(err)})
})
router.get('/getActuatorsStorages',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    let actuators= await db.associateActuator.findAll({where:{storageId:storageId,active:1}})
    res.status(200).json({actuators:actuators})
})
router.delete('/unlinkActuator',async (req,res)=>{
    let idAct=req.query.idAct?req.query.idAct:null
    if(idAct!=null){
        //console.log(idAct)
        let linkData= await db.associateActuator.findOne({where:{id:idAct}})
        linkData=JSON.parse(JSON.stringify(linkData))
        await db.associateActuator.destroy({where:{id:idAct}})
        await db.device.update({storageId:null},{where:{id:linkData.deviceId}})
        res.status(200).json({result:result})
    }else{
        res.status(422)
    }
})
/** Allarm */
router.get('/getAllarmStorages',async (req,res)=>{
    let storageId=req.query.storageId?req.query.storageId:null
    let allarm= await db.associateAllarm.findAll({where:{storageId:storageId,active:1}})
    res.status(200).json({allarm:allarm})
})
router.delete('/unlinkAllarm',async (req,res)=>{
    let idAll=req.query.idAll?req.query.idAll:null
    if(idAll!=null){
        await db.associateAllarm.destroy({where:{id:idAll}})
        .then(result=>{
            res.status(200).json({result:result})
        })
    }else{
        res.status(422)
    }
})
/** Sensors */
router.delete('/unlinkSensor',async (req,res)=>{
    let idSens=req.query.idSens?req.query.idSens:null
    if(idSens!=null){
        let linkData= await db.associateSensor.findOne({where:{id:idSens}})
        await db.associateSensor.destroy({where:{id:idSens}})
        .then(async result=>{
            await db.device.update({storageId:null},{where:{id:linkData.deviceId}})
            res.status(200).json({result:result})
        })
        
    }else{
        res.status(422)
    }
})
router.post('/associateSensorStorage',async (req,res)=>{
    //console.log(req.body)
    await db.associateSensor.create({
        storageId:req.body.sensor_storageId,
        deviceId:req.body.sensor_deviceId,
        fieldName:req.body.sensor_fieldName,
        valueName:req.body.sensor_valueName,
        label:req.body.sensor_label,
        icon:req.body.sensor_icon,
        postChr:req.body.sensor_postChr,
        bgcolor:"bg-primary",
        textColor:"text-white",
        active:1,
        version:1
    }).then(result=>{
        res.status(200).json({result:result})
    }).catch(err=>{
        console.log(err)
        res.status(422)
    })
})
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