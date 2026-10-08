const express = require('express');
const router = express.Router();
const Calendar = require("../controllers/calendar.controller");
const BaiKal = require("../controllers/baikal.controller");
const moment=require("moment")
const { calendar } = require('../models');

router.get('/',async  (req, res) => {
  let calendarCategories=await Calendar.getAllCategory()
  res.render("calendar",{calendarCategories:calendarCategories})
});

router.get('/getAllEvents',async  (req, res) => {
    let events=await Calendar.getAll()
    res.status(200).json({data:events})
  });

router.post('/newEvent',async  (req, res) => {
    console.log(req.body)
    req.body.start=moment(req.body.start,"MM/DD/YYYY hh:mm:ss").format("YYYY-MM-DD hh:mm:ss")
    req.body.stop=moment(req.body.stop,"MM/DD/YYYY hh:mm:ss").isValid()?moment(req.body.stop,"MM/DD/YYYY hh:mm:ss").format("YYYY-MM-DD hh:mm:ss"):null
    let event=await Calendar.newEvent(req.body)
    res.status(200).json({data:event})
  });

router.get('/isCompleted',async  (req, res) => {
    let idEvent=req.query.idEvent?req.query.idEvent:false
    if (idEvent!=false){
        let result=await Calendar.isComplete(idEvent)
        res.status(200).json({data:result})
    } else {
        res.status(522).json()
    }
  });

  router.get('/deleteEvent',async  (req, res) => {
    let idEvent=req.query.idEvent?req.query.idEvent:false
    if (idEvent!=false){
        let result=await Calendar.deleteEvent(idEvent)
        res.status(200).json({data:result})
    } else {
        res.status(522).json()
    }
  });

  router.get('/updateDate',async  (req, res) => {
    console.log(req.query)
    let idEvent=req.query.idEvent?req.query.idEvent:false
    let start=moment(req.query.start).add(1,'d').format("YYYY-MM-DD hh:mm:ss")
    let stop=moment(req.query.stop).isValid()?moment(req.query.stop,"MM/DD/YYYY hh:mm:ss").format("YYYY-MM-DD hh:mm:ss"):null
    console.log(start,
      stop)
    

    if (idEvent!=false){
        let result=await Calendar.updateDate(idEvent,start,stop)
        res.status(200).json({data:result})
    } else {
        res.status(522).json()
    }
  });

/** BaiKal */

  const baikalconfig={
    serverUrl:'https://bai.mushborg.it/dav.php/',
    calendarUrl:'https://bai.mushborg.it/dav.php/calendars/mushborg/default/',
    username:'mushborg',
    password:'Q0T2ZMJSYjAFPCrjWmQmf'
  }

   router.get('/getbaikal',async  (req, res) => {
    let fromDate=req.query.fromDate?req.query.fromDate:false
    let toDate=req.query.toDate?req.query.toDate:false
    if (fromDate && toDate){
        let result=await BaiKal.getEventsFromBaikal(fromDate,toDate,baikalconfig)
        res.status(200).json({data:result})
    } else {
        res.status(522).json({errore:"Mancano i  dati di filtro"})
    }
  });

  router.get('/insbaikal',async (req,res)=>{
    let titolo=req.query.titolo?req.query.titolo:""
    let descrizione=req.query.descrizione?req.query.descrizione:""
    let fromDate=req.query.fromDate?req.query.fromDate:""
    let toDate=req.query.toDate?req.query.toDate:""
    let location=req.query.location?req.query.location:""
    if (titolo || descrizione || fromDate || toDate || location){
        const result = await BaiKal.saveEventToBaikal({
          titolo: titolo || "default",
          descrizione: descrizione || "default",
          start: fromDate || '2026-10-10T10:00:00Z',
          stop: toDate || '2026-10-10T11:00:00Z',
          location: location || 'Laboratorio 1'
        },baikalconfig);
        res.status(200).json({data:result})
    } else {
        res.status(522).json({errore:"Mancano i dati di filtro"})
    }
  })

  router.get('/modbaikal',async (req,res)=>{
    let uid=req.query.uid?req.query.uid:false
    let titolo=req.query.titolo?req.query.titolo:""
    let descrizione=req.query.descrizione?req.query.descrizione:""
    let fromDate=req.query.fromDate?req.query.fromDate:""
    let toDate=req.query.toDate?req.query.toDate:""
    let location=req.query.location?req.query.location:""
    if (uid){
        const result = await BaiKal.saveEventToBaikal({
          uid: uid || "B2BFDD0D-72FD-4137-A6C9-B4FD7FF57E66",
          titolo: titolo || "default",
          descrizione: descrizione || "default",
          start: fromDate || '2026-10-10T10:00:00Z',
          stop: toDate || '2026-10-10T11:00:00Z',
          location: location || 'Laboratorio 1'
        },baikalconfig);
        res.status(200).json({data:result})
    } else {
        res.status(522).json({errore:"Mancano i  dati di filtro"})
    }
  })

  router.get('/delbaikal',async (req,res)=>{
    let uid=req.query.uid?req.query.uid:false
    if (uid){
        let result=await BaiKal.deleteEventFromBaikal(uid,baikalconfig)
        res.status(200).json({data:result})
    } else {
        res.status(522).json({errore:"Mancano i  dati di filtro"})
    }
  })

module.exports=router;