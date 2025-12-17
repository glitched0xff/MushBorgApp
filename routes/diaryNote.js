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
    where:{createdAt: {
          [Op.gte]: dtFrom,
          [Op.lte]: dtTo},
      },
    attributes: [
      "nota",
      "area",
      "tag",
      "createdAt"
    ],
    
    order: [["createdAt", "DESC"]],
    raw: true
  });

  // Raggruppo per giorno/mese
  let grouped = {};

  notes.forEach(n => {
    const date = new Date(n.createdAt);
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
  console.log(req.query)
  let dtFrom=req.query.dtFrom?req.query.dtFrom:moment().startOf("day").subtract(7,'days')
  let dtTo=req.query.dtTo?req.query.dtTo:moment()
  let data=await getGroupedNotes(dtFrom,dtTo)
  res.status(200).json(data);
});

router.post('/newNota',async (req,res)=>{
  let data=req.body
  console.log(data)
  await DiaryNote.create({
      nota:data.nota,
        tag:data.tag
    })
    .then(result=>{
      res.status(200).json({result:result})
    }).catch(err=> console.log(err))
})


module.exports=router;