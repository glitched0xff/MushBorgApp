const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../models");
const { fn, col, literal, Op } = require("sequelize");

router.get('/',async  (req, res) => {
  res.render("statistic")
});

router.get('/checkWeigth',async (req,res)=>{
    let fromDate=req.query.fromDate?req.query.fromDate:moment().subtract(10,"days")
    let toDate=req.query.toDate?req.query.toDate:moment()
    let propId=req.query.propId?req.query.propId:""
    let harvests = await db.mushElementHarvest.findAll({
  attributes: [
    "mushElementId",
    [fn("DATE", col("createdAt")), "day"],
    [fn("SUM", col("harvest_weight")), "total_harvest_weight"]
  ],
  where: {
    mushElementId: {
      [Op.like]: `%${propId}%`
    },
    type: "CULTIVATION",
    createdAt: {
      [Op.gte]: fromDate,
      [Op.lte]: toDate,
    }
  },
  group: [
    "mushElementId",
    literal("DATE(createdAt)")
  ],
  order: [
    [literal("day"), "DESC"]
  ]
});
    harvests=JSON.parse(JSON.stringify(harvests))
    for (let i = 0; i < harvests.length; i++) {
        const el = harvests[i];
        let mushElementData=await db.mushElement.findAll({where:{id:el.mushElementId},include:db.propagation})
        harvests[i].mushElementData=JSON.parse(JSON.stringify(mushElementData))
    }
      let harvestsGroupedByDay = harvests.reduce((acc, item) => {
      const { day } = item;
      if (!acc[day]) {
        acc[day] = [];
      }
      acc[day].push(item);
      return acc;
    }, {});
    harvestsGroupedByDay = Object.values(harvestsGroupedByDay);
    
    console.log(harvestsGroupedByDay)
    // ogni elemento contiene il totale, l'indice è uguale all'array precedente
    let arrayTotalWeight=[]
    for (let i = 0; i < harvestsGroupedByDay.length; i++) {
      const day = harvestsGroupedByDay[i];
      let tot=0
      for (let y = 0; y < day.length; y++) {
        const elem = day[y];
        tot=tot+elem.total_harvest_weight
      }
      arrayTotalWeight.push(tot)
    }

    res.render("stat_checkWeight",{harvests:harvestsGroupedByDay,arrayTotalWeight:arrayTotalWeight})

})

router.get('/getWeigthByElement',async (req,res)=>{

})

module.exports=router;