const express = require('express');
const router = express.Router();
const { Op,where,fn,col } = require('sequelize');
const moment=require("moment")

const db = require("../models");

router.get('/',async (req, res) => {
    let config=req.app.locals.config
   // console.log(config)
    let nInoculum=await db.mushElement.count({where:{type:"INOCULUM",active:1}})
    let nSpawn=await db.mushElement.count({where:{type:"SPAWN",active:1}})
    let nCultivation=await db.mushElement.count({where:{type:"CULTIVATION",active:1}})
    let harvests=[]
    let harvestWeek = await db.mushElementHarvest.findAll({
            attributes: [
              [fn("SUM", col("harvest_weight")), "totalWeight"]
            ],
            where: {
              createdAt: {
                [Op.between]: [moment().startOf("month").toDate(), moment()]
              }
            },
            raw: true
          });
    harvestWeek=harvestWeek[0].totalWeight?harvestWeek[0].totalWeight:0
    harvests.push({harvest:harvestWeek,week:moment().week()})
    
    let harvestMonth = await db.mushElementHarvest.findAll({
            attributes: [
              [fn("SUM", col("harvest_weight")), "totalWeight"]
            ],
            where: {
              createdAt: {
                [Op.between]: [moment().startOf("month").toDate(), moment()]
              }
            },
            raw: true
          });
    harvestMonth=harvestMonth[0].totalWeight?harvestMonth[0].totalWeight:0

    harvests.push({harvest:harvestMonth,month:moment().locale("it").format("MMMM")}) 
    let harvestYear = await db.mushElementHarvest.findAll({
            attributes: [
              [fn("SUM", col("harvest_weight")), "totalWeight"]
            ],
            where: {
              createdAt: {
                [Op.between]: [moment().startOf("month").toDate(), moment()]
              }
            },
            raw: true
          });
    harvestYear=harvestYear[0].totalWeight?harvestYear[0].totalWeight:0
    harvests.push({harvest:harvestYear,year:moment().year()})

    
    // let storage=await db.storage.findAll({include:{model:db.device,
    //                                               include:{model:db.sensorData,
    //                                               attributes: [
    //                                                     "id","hume","co2","status","createdAt","temp",
    //                                                     [fn('date_format', col('createdAt'), '%d-%m-%y %hh:%mm'), 'createdAtFormatted']
    //                                                 ],
    //                                               order:[ [ 'createdAt', 'DESC' ]],
    //                                               limit:1}}})

      let storage=await db.storage.findAll({include:[
                                                      {model:db.associateActuator},
                                                      {model:db.associateAllarm},                                                      
                                                      {model:db.associateSensor,
                                                        include:{model:db.sensorData,
                                                                attributes: ["id","hume","co2","hums","levl","ligh","wind","pwrQ","status","createdAt","temp",
                                                        [fn('date_format', col('createdAt'), '%d-%m-%y %hh:%mm'), 'createdAtFormatted']]
                                                        ,order:[ [ 'createdAt', 'DESC' ]],limit:1}}
                                                                                    ]})

      let c=JSON.parse(JSON.stringify(storage))
      console.log(c)
     res.render("index", { title: "Express" ,
                           nInoculum,
                           nSpawn,
                           nCultivation,
                          storage,
                          harvests,
                          config});
});

router.get('/getStoragesData',async (req,res)=>{
 await db.storage.findAll({include:[{model:db.associateActuator},
                                    {model:db.associateAllarm},                                                      
                                    {model:db.associateSensor,
                                      include:{model:db.sensorData,
                                              attributes: ["id","hume","co2","hums","levl","ligh","wind","pwrQ","status","createdAt","temp",
                                      [fn('date_format', col('createdAt'), '%d-%m-%y %hh:%mm'), 'createdAtFormatted']]
                                      ,order:[ [ 'createdAt', 'DESC' ]],limit:1}}
                                                                  ]})
                        .then(result=>{
                            res.status(200).json({result:result})
                        }).catch(err=>{
                          console.log(err)
                          res.status(422)
                        })
})
router.get('/logout', (req, res) => {
  res.send('logout');
});

module.exports=router;