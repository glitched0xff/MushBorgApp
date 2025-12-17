/*
Funzione di gestione dei dati derivanti dai sensori
*/

const db = require("../models");
const SensorData = db.sensorData;
const Device=require("./device.controller")
const UnknowMessage=require("./unknowMessage.controller")
//const Op = db.Sequelize.Op;
const { fn, col, literal, Op } = require("sequelize");

const moment=require('moment')
const schedule = require("node-schedule");


exports.create = async(topic, payload) => {
    // save sensor data coming from MQTT
    let top=topic.split("/")
    //console.log(payload.toString())
      if (top.length>0){
        if (await Device.checkSensorExist(top[1])){
          let data=JSON.parse(payload.toString())
          //console.log(data)
          if((result.temperature=="nan")||(!result.temperature)){
          result.temperature=0
        }
        if((result.umidita=="nan")||(!result.umidita)){
          result.umidita=0
        }
        if((result.co2=="nan")||(!result.co2)){
          result.co2=0
        }
            const sensorData = {
                cod_device:top[1],
                temp:data.temp,
                hum:data.hum,
                co2:data.co2,
                createdAt:Date.now(),
                updatedAt:Date.now(),
            };
      
          // Save sensor data
          await SensorData.create(sensorData)
            .catch(err => {
              console.log(err)
            });
          }
      }
    else{
     await UnknowMessage.insert(topic,payload.toString())
    }
  };


exports.setCron=async()=>{
  let devices=await db.device.findAll()
  for (let i = 0; i < devices.length; i++) {
  const el = devices[i];
  let onLine=true
  let result=await fetch(el.url, { method: "GET" })
        .catch(err=>{
          //console.log(err)
          onLine=false
        })
    
  if (onLine==true){
    result=await result.json()
    console.log(result)
    if((result.temperature=="nan")||(!result.temperature)){
          result.temperature=0
        }
        if((result.umidita=="nan")||(!result.umidita)){
          result.umidita=0
        }
        if((result.co2=="nan")||(!result.co2)){
          result.co2=0
        }
    await SensorData.create({
                cod_device:el.cod_device,
                temp:result.temperature,
                hum:result.umidita,
                co2:result.co2,
                deviceId:el.id,
                storageId:el.storageId,
                status:1,
            })
    schedule.scheduleJob(el.cod_device,el.cronString, async () => {
      let onLineSync=true
      let result=await fetch(el.url, { method: "GET" })
                  .catch(err=>{
                    onLineSync=false
                  })

      if (onLineSync==true){
        result=await result.json()
        if((result.temperature=="nan")||(!result.temperature)){
          result.temperature=0
        }
        if((result.umidita=="nan")||(!result.umidita)){
          result.umidita=0
        }
        if((result.co2=="nan")||(!result.co2)){
          result.co2=0
        }
        await SensorData.create({
                    cod_device:el.cod_device,
                    temp:result.temperature,
                    hum:result.umidita,
                    co2:result.co2,
                    deviceId:el.id,
                    storageId:el.storageId,
                    status:1,
                }) 
        }
        else{
          await SensorData.create({
                cod_device:el.cod_device,
                temp:"0",
                hum:"0",
                co2:"0",
                deviceId:el.id,
                storageId:el.storageId,
                status:0,
            })
          console.log("# Attenzione: il dispositivo "+el.cod_device+" non è raggiungibile.")
        }
      })
  }
  else{
    await SensorData.create({
                cod_device:el.cod_device,
                temp:"0",
                hum:"0",
                co2:"0",
                status:0,
            })
    console.log("# Attenzione: il dispositivo "+el.cod_device+" non è raggiungibile.")
  }
  }
Object.keys(schedule.scheduledJobs).forEach(name => {
  console.log("# Job registrato:", name);
});
}

//res.status(200).json({result:result,time:secSpent,deviceData:deviceData})
          //result=await result.json();
        