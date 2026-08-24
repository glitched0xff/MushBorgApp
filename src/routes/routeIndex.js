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
                [Op.between]: [moment().startOf("year").toDate(), moment()]
              }
            },
            raw: true
          });
    harvestYear=harvestYear[0].totalWeight?harvestYear[0].totalWeight:0
    harvests.push({harvest:harvestYear,year:moment().year()})

      let storage=await db.storage.findAll()

      // Last edit element
    let lastEditElement = await db.mushElement.findAll({ 
                                  subQuery: false,
                                  include: [
                                      { model: db.mushElementNote, attributes: [] },
                                      { model: db.mushElementHarvest, attributes: [] },
                                  ],
                                  attributes: [
                                      "id",
                                      "element_code",
                                      "type",
                                      "stato",
                                      "load_date",
                                      "strainId",
                                      "active",
                                      "updatedAt", // ◄ Aggiungi esplicitamente la colonna di ordinamento qui
                                      [fn("SUM", col("mushElementHarvests.harvest_weight")), "totalHarvestWeight"],
                                      [fn("COUNT", col("mushElementNotes.id")), "totalNote"]
                                  ],
                                  group: ["mushElement.id"],
                                  limit: 10,
                                  order: [["updatedAt", "DESC"]] // ◄ Controlla che sul DB si chiami "updatedAt" e non "updateAt"
                              });

    if(lastEditElement){
            lastEditElement=JSON.parse(JSON.stringify(lastEditElement))
            
            for (let i = 0; i < lastEditElement.length; i++) {
                if (lastEditElement[i].strainId){
                let strain=await db.strain.findOne({where:{id:lastEditElement[i].strainId}, attributes:["species"],raw:true})
                lastEditElement[i].strainName=strain?strain.species:null
                }
            }
        }
    
    let lastHarvest= await db.mushElementHarvest.findAll({
                                  limit:10,
                                  order:[["createdAt","DESC"]]
    })
    for (let i = 0; i < lastHarvest.length; i++) {
      const e = lastHarvest[i];
        let mushElement=await db.mushElement.findOne({where:{id:e.mushElementId},
                                                      attributes: [
                                                                "id",
                                                                "element_code",
                                                                "type",
                                                                "stato",
                                                                "load_date",
                                                                "strainId",
                                                                "active",
                                                            ],})
        let strain= await db.strain.findOne({where:{id:mushElement.strainId},attributes:["strain_name","species"]})
      lastHarvest[i].mushElement=JSON.parse(JSON.stringify(mushElement))
      lastHarvest[i].strain=JSON.parse(JSON.stringify(strain))
    }
     res.render("index", { title: "Express" ,
                           nInoculum,
                           nSpawn,
                           nCultivation,
                          storage,
                          harvests,
                          lastEditElement,
                          lastHarvest,
                          config});
});

// router.get('/getStoragesData',async (req,res)=>{
//  await db.storage.findAll({include:[{model:db.associateActuator},
//                                     {model:db.associateAllarm},                                                      
//                                     {model:db.associateSensor,
//                                       include:{model:db.sensorData,
//                                               attributes: ["id","hume","co2","hums","levl","ligh","wind","pwrQ","status","createdAt","temp",
//                                       [fn('date_format', col('createdAt'), '%d-%m-%y %hh:%mm'), 'createdAtFormatted']]
//                                       ,order:[ [ 'createdAt', 'DESC' ]],limit:1}}
//                                                                   ]})
//                         .then(result=>{
//                             res.status(200).json({result:result})
//                         }).catch(err=>{
//                           console.log(err)
//                           res.status(422)
//                         })
// })
router.get('/logout', (req, res) => {
  res.send('logout');
});

module.exports=router;