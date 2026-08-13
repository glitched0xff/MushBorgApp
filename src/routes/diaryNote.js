const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../models");
const dropDownGenerator=require('../module/dropDownGenerator')
const { fn, col, literal, Op } = require("sequelize");
const DiaryNote = db.diaryNote;

async function getGroupedNotes(dtFrom,dtTo) {
  // Recupero le note ordinate per data


  let notes = await DiaryNote.findAll({
    where:{dataNota: {
          [Op.gte]: dtFrom,
          [Op.lte]: dtTo},
      },
    attributes: [
      "nota",
      "area",
      "tag",
      "dataNota",
      "createdAt"
    ],
    
    order: [["dataNota", "DESC"]],
    raw: true
  });

  // Raggruppo per giorno/mese
  let grouped = {};

  notes.forEach(n => {
    const date = new Date(n.dataNota);
    const giorno = date.getDate();
    const mese = date.getMonth() + 1; // mesi da 0-11
    const key = `${giorno}-${mese}`;

    if (!grouped[key]) {
      grouped[key] = {
        giorno,
        mese,
        note: []
      };
    }
    grouped[key].note.push({
      nota: n.nota,
      area: n.area,
      tag: n.tag,
      dataNota: n.dataNota,
      createdAt: n.createdAt
    });
  });

  // Converto in array
  return { notes: Object.values(grouped) };
}


router.get('/',async  (req, res) => {
  res.render("diaryNote")
});

router.get('/getall',async (req, res) => {
  //console.log(req.query)
  let fromDate=req.query.fromDate?moment(req.query.fromDate):moment().subtract(1, 'months').startOf('month')
  let toDate=req.query.toDate?moment(req.query.toDate).endOf('day'):moment().endOf('day')
  let data=await getGroupedNotes(fromDate,toDate)
  data.fromDate=fromDate
  data.toDate=toDate
  res.status(200).json(data);
});

router.post('/newNota',async (req,res)=>{
  let data=req.body
  //console.log(data)
  await DiaryNote.create({
      nota:data.nota,
        tag:data.tag,
        dataNota:moment(data.dataNota, "DD-MM-YY hh:mm")
    })
    .then(result=>{
      res.status(200).json({result:result})
    }).catch(err=> console.log(err))
})


module.exports=router;