const express = require('express');
const router = express.Router();
const SensorData = require("../controllers/sensorData.controller");
const moment=require("moment")
const {Op,query}=require("sequelize")
const db = require('../models');
const dropDownGenerator=require('../module/dropDownGenerator')


router.get('/',async  (req, res) => {
  let idDevice=req.query.idDevice
  let deviceData=null
  let ddDevice=await dropDownGenerator('device')
  //console.log(ddDevice)
  // Costruisco il filtro
  let where = {
    createdAt: {
      [Op.gte]: moment().startOf("day").toDate(),
      [Op.lte]: moment().toDate()},
  }
  if (idDevice) {
    where.deviceId = idDevice
    deviceData=await db.device.findOne({where:{id:idDevice}})
  }
  let data=await db.sensorData.findAll({where,
                                       order: [["createdAt", "DESC"]]})
   for (let i = 0; i < data.length; i++) {
        const elem = data[i];
         elem.createdAtStr=moment(elem.createdAt).format("DD-MM-YY HH:mm")
      }
  res.render("telemetry",{sensorData:data,deviceData:deviceData,ddDevice:ddDevice})
});

router.get('/getAllData',async (req, res) => {
  //console.log(req.query)
  let idDevice=req.query.idDevice
  let dtTo=req.query.dtTo?req.query.dtTo:moment().toDate();
  let dtFrom=req.query.dtFrom?req.query.dtFrom:moment().startOf('day')
  let deviceData=null
  let where = {
      createdAt: {
        [Op.gte]: moment(dtFrom),
        [Op.lte]: moment(dtTo)},
    }
  if (idDevice) {
    where.deviceId = idDevice
    deviceData=await db.device.findOne({where:{id:idDevice}})
  }
  let data=await db.sensorData.findAll({where,
                                       order: [["createdAt", "DESC"]],
                                    }
                                  )
    data=JSON.parse(JSON.stringify(data))
   for (let i = 0; i < data.length; i++) {
        data[i].createdAtStr=moment(data[i].createdAt).format("DD-MM-YY HH:mm")
      }
  res.status(200).json(data);
});

router.delete('/delData', (req, res) => {
});


module.exports=router;