const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../models");
const { fn, col, literal, Op } = require("sequelize");

router.get('/',async  (req, res) => {
  res.render("statistic")
});

router.get('/checkWeigth',async (req,res)=>{
    let fromDate=req.query.fromDate?req.query.fromDate:moment().subtract(7,"days")
    let toDate=req.query.toDate?req.query.toDate:moment()
    let propId=req.query.propId?req.query.propId:""
    const harvests = await db.mushElementHarvest.findAll({
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
    [literal("day"), "ASC"]
  ]
});
    harvests=JSON.parse(JSON.stringify(harvests))
    const grouped = harvests.reduce((acc, item) => {
  if (!acc[item.day]) {
    acc[item.day] = {
      day: item.day,
      total_harvest_weight: 0,
      items: []
    };
  }

  acc[item.day].total_harvest_weight += item.total_harvest_weight;
  acc[item.day].items.push(item);

  return acc;
}, {});

// Convertiamo in array, se preferisci
const result = Object.values(grouped);

console.log(grouped)
    for (let i = 0; i < harvests.length; i++) {
        const el = harvests[i];
        let mushElementData=await db.mushElement.findAll({where:{id:el.mushElementId}})

    }
    res.render("stat_checkWeight",{harvests:harvests})

})
router.get('/getWeigthByElement',async (req,res)=>{

})

module.exports=router;