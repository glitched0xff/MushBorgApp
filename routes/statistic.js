let express = require('express');
let router = express.Router();
let moment=require("moment")
let db = require("../models");
let ejs=require("ejs")
let { fn, col, literal, Op, where } = require("sequelize");
let path=require("path")

router.get('/',async  (req, res) => {
  res.render("statistic")
});

/** Check weight ok */
router.get('/checkWeigth01',async (req,res)=>{
  console.log(res.query)
    let fromDate=req.query.fromDate?moment(req.query.fromDate,"YYYY-MM-DD"):moment().subtract(10,"days")
    let toDate=req.query.toDate?moment(req.query.toDate,"YYYY-MM-DD"):moment()
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
    let harvestsData=JSON.parse(JSON.stringify(harvests))
    let strainList=[]
    for (let i = 0; i < harvestsData.length; i++) {
        let el = harvestsData[i];
        let mushElementData=await db.mushElement.findAll({where:{id:el.mushElementId},include:db.propagation})
      
        if (!strainList.includes(mushElementData[0].strainId)){
          strainList.push(mushElementData[0].strainId)
        }
        harvestsData[i].mushElementData=JSON.parse(JSON.stringify(mushElementData))
    }
      let harvestsGroupedByDay = harvestsData.reduce((acc, item) => {
        let { day } = item;
        if (!acc[day]) {
          acc[day] = [];
        }
        acc[day].push(item);
        return acc;
      }, {});
    harvestsGroupedByDay = Object.values(harvestsGroupedByDay);
    
    // ogni elemento contiene il totale, l'indice è uguale all'array precedente
    let arrayTotalWeight=[]
    for (let i = 0; i < harvestsGroupedByDay.length; i++) {
      let day = harvestsGroupedByDay[i];
      let tot=0
      for (let y = 0; y < day.length; y++) {
        let elem = day[y];
        tot=tot+elem.total_harvest_weight
      }
      arrayTotalWeight.push(tot)
    }
    strainList=await db.strain.findAll({where:{id: {
      [Op.in]: strainList
    }}})
    let speciesList=[]
    for (let i = 0; i < strainList.length; i++) {
      const el = strainList [i];
      console.log(el)
      if(!speciesList.includes(el.speciesId)){
        speciesList.push(el.speciesId)
      }
    }
    speciesList=await db.species.findAll({where:{id: {
      [Op.in]: speciesList
    }}})
    console.log(JSON.parse(JSON.stringify(speciesList)))
    res.render("stat_checkWeight",{harvests:harvestsGroupedByDay,arrayTotalWeight:arrayTotalWeight,
                                  fromDate:fromDate,toDate:toDate,strainList:strainList,speciesList:speciesList})

})

/** Check weight ok */
router.get('/checkWeigth',async (req,res)=>{
  console.log(req.query)
  console.log("check")
    let fromDate=req.query.fromDate?moment(req.query.fromDate,"YYYY-MM-DD"):moment().subtract(10,"days")
    let toDate=req.query.toDate?moment(req.query.toDate,"YYYY-MM-DD"):moment()
    let propId=req.query.propId?req.query.propId:""
    let specie=req.query.specie?req.query.specie:false
    let admitStrain=[]
    if(specie!=false){
      admitStrain=(await db.strain.findAll({where:{speciesId:specie},
                                           attributes: ['id'],
                                            raw: true
                                          })).map(u => u.id)
    }
    
    let harvests = await db.mushElementHarvest.findAll({
  attributes: [
    "mushElementId",
    [fn("DATE", col("createdAt")), "day"],
    [fn("SUM", col("harvest_weight")), "total_harvest_weight"]
  ],
  where: {
    // mushElementId: {
    //   [Op.like]: `%${propId}%`
    // },
    //  type: "CULTIVATION",
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
    let harvestsData=JSON.parse(JSON.stringify(harvests))
    let strainList=[]
    let spliceId=[]
    for (let i = 0; i < harvestsData.length; i++) {
        let el = harvestsData[i];
        let mushElementData=await db.mushElement.findOne({where:{id:el.mushElementId},include:db.propagation})
        //console.log(JSON.parse(JSON.stringify(mushElementData)))
        if (specie!=false){
          console.log(admitStrain)
          console.log(mushElementData.strainId)
          if (admitStrain.includes(mushElementData.strainId)){
            harvestsData[i].mushElementData=JSON.parse(JSON.stringify(mushElementData))
            // inserisco nella strainlist per menu a discesa
            if (!strainList.includes(mushElementData.strainId)){
              strainList.push(mushElementData.strainId)
            }
          }
        } else {
          harvestsData[i].mushElementData=JSON.parse(JSON.stringify(mushElementData))
          // inserisco nella strainlist per menu a discesa
            if (!strainList.includes(mushElementData.strainId)){
              strainList.push(mushElementData.strainId)
            }
        }  
    }
    //console.log("..inizio")
    //console.log(harvestsData)
    console.log(".."+harvestsData.length)
    harvestsData = harvestsData.filter(item => item.mushElementData);
console.log("..."+harvestsData.length)
      let harvestsGroupedByDay = harvestsData.reduce((acc, item) => {
        let { day } = item;
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
      let day = harvestsGroupedByDay[i];
      let tot=0
      for (let y = 0; y < day.length; y++) {
        let elem = day[y];
        tot=tot+elem.total_harvest_weight
      }
      arrayTotalWeight.push(tot)
    }

    // List
    strainList=await db.strain.findAll({where:{id: {
      [Op.in]: strainList
    }}})
    let speciesList=[]
    for (let i = 0; i < strainList.length; i++) {
      const el = strainList [i];
      if(!speciesList.includes(el.speciesId)){
        speciesList.push(el.speciesId)
      }
    }
    speciesList=await db.species.findAll({where:{id: {
      [Op.in]: speciesList
    }}})
    res.render("stat_checkWeight",{harvests:harvestsGroupedByDay,arrayTotalWeight:arrayTotalWeight,
                                  fromDate:fromDate,toDate:toDate,strainList:strainList,speciesList:speciesList})

})

/**
 * @api {get} /statistic/getWeigthGraph Elenco reparti
 * @apiDescription Restituisce un grafico linea basato su Json inviato
 * @apiName getWeigthGraph
 * @apiGroup statistic
 * @apiParam {String} JSON stringify ([xAxis:number/string,val:Number])
 * @apiParam {String} order  if set to reverse API reverse the order of Json
 * @apiSuccess {String} renderGraph Html rendered graph
 * @apiVersion 1.0.0
 */
router.get('/getWeigthGraph',async (req,res)=>{
    let dataArray=req.query.dataArray?JSON.parse(req.query.dataArray):false
    dataArray=req.query.order=="reverse"?dataArray.reverse():dataArray
    if(dataArray!=false){
      let renderGraph=await ejs.renderFile(path.join(__dirname, "../views/include/chartJs.ejs"), {
        dataArray: dataArray
      });
      res.status(200).send(renderGraph)
    }else{
      res.status(422)
    }
    
})

/* Last Note */
router.get('/lastNote',async (req,res)=>{
  let fromDate=req.query.fromDate?moment(req.query.fromDate,"YYYY-MM-DD"):moment().subtract(10,"days")
  let toDate=req.query.toDate?moment(req.query.toDate,"YYYY-MM-DD"):moment()
  
})

/* Picked eleemnt list */
router.get('/pickElementList',async (req,res)=>{
  let fromDate=req.query.fromDate?moment(req.query.fromDate,"YYYY-MM-DD"):moment().subtract(10,"days")
  let toDate=req.query.toDate?moment(req.query.toDate,"YYYY-MM-DD"):moment()
   let pickReasonDD=await db.dDOption.findAll({where:{ddMenu:"pickReason"}})
  let pickedElement= await db.mushElement.findAll({where:{pick_date: {
      [Op.gte]: fromDate,
      [Op.lte]: toDate,
    }},
    order:[["pick_date","ASC"]]})
  pickedElement=JSON.parse(JSON.stringify(pickedElement))
  let pE=[]
  for (let i = 0; i < pickedElement.length; i++) {
    for (let r = 0; r < pickReasonDD.length; r++) {
      if (pickedElement[i].pick_reason==pickReasonDD[r].val){
        pickedElement[i].pick_reason_text=pickReasonDD[r].txt
      }
    }
  }
  res.render("stat_pickElementList",{pickedElement:pickedElement,
                                     fromDate:fromDate,
                                     toDate:toDate,
                                     pickReasonDD:pickReasonDD,
                                    moment})
})

module.exports=router;