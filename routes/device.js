const express = require('express');
const router = express.Router();
const Device = require("../controllers/device.controller");
const moment=require("moment")
const db = require("../models");
const dropDownGenerator=require('../module/dropDownGenerator')

db.storage.associate(db)
db.device.associate(db)


router.get('/',async  (req, res) => {
  let data=await db.device.findAll()
  let storageDD=await dropDownGenerator('storage')
  data=JSON.parse(JSON.stringify(data))
  for (let i = 0; i < data.length; i++) {
          data[i].createdAt=moment(data[i].createdAt).format("DD-MM-YY HH:mm")
          let sensorN=await db.associateSensor.count({where:{deviceId:data[i].id}})
          let actN=await db.associateActuator.count({where:{sensorId:data[i].id}})
          let allN= await db.associateAllarm.count({where:{sensorId:data[i].id}})
          data[i].sensorN=sensorN
          data[i].actN=actN
          data[i].allN=allN
        }
  res.render("device",{devices:data,storageDD})
});

router.get('/getAllData',async (req, res) => {
  let dtTo=moment(req.query.dtTo).format("DD-MM-YYYY HH:mm:ss")
  let dtFrom=moment(req.query.dtFrom).format("DD-MM-YYYY HH:mm:ss")
  let data=await db.sensorData.findAll({where:{createdAt: {
                                                  [Op.gte]:dtFrom,
                                                  [Op.lte]:dtTo
                                                  }},
                                         order: [["createdAt", "DESC"]],
                                      }
                                    )
  data=JSON.parse(JSON.stringify(data))
  for (let i = 0; i < data.length; i++) {
          data[i].createdAtStr=moment(data[i].createdAt).format("DD-MM-YY HH:mm")
        }
  res.status(200).json(data);
});

router.get('/testDevice',async (req,res)=>{
  let idDevice=req.query.idDevice?req.query.idDevice:null
  if (idDevice!=null){
    let deviceData=await db.device.findOne({where:{id:idDevice}})
    const start = Date.now();
    await fetch(deviceData.url,{method:"GET"})
      .then(async result=>{
        const secSpent = (Date.now() - start) / 1000;
        result=await result.json();
        console.log(result)
        res.status(200).json({result:result,time:secSpent,deviceData:deviceData})
      })
      .catch(err=>{
        //console.log(err)
        res.status(200).json({result:false})
      })
    
  }else{
    res.status(422).json()
  }
})

module.exports=router;