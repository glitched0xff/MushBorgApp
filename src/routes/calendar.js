const express = require('express');
const router = express.Router();
const Calendar = require("../controllers/calendar.controller");
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
module.exports=router;