let express = require('express');
let router = express.Router();
const converter = require('json-2-csv');

let moment=require("moment")
let db = require("../models");
let ejs=require("ejs")
let { fn, col, literal, Op } = require("sequelize");
let path=require("path")

router.get('/',async  (req, res) => {
  res.render("print")
});

router.get('/massivePrint',async (req,res)=>{
  res.render("print_massivePrint")
})
router.get('/massivePrintCSV',async (req,res)=>{
  console.log(req.query)
  let elementCodes=req.query.elementCode?req.query.elementCode.split(","):false
  if(elementCodes!=false){
    let csvObj=[]
      for (let i = 0; i < elementCodes.length; i++) {
        const el = elementCodes[i];
        let elem= await db.mushElement.findOne({where:{element_code: el},attributes:["element_code","createdAt"]})
      csvObj.push({
                  element_code:elem.element_code,
                  createAt:moment(elem.createLot).format("DD-MM-YY"),
                  qrCode:"/mushElement/mushElementLanding?elementCode="+elem.element_code
              })
      }
    console.log(csvObj)
    const csv = await converter.json2csv(csvObj,{prependHeader:false});
    res.set('Content-Type', 'application/octet-stream');
    let filename=moment().format("DDMMAA").toString()+"-massiveCsv.csv"
    res.attachment(filename);
    res.status(200).send(csv);
  } else {
    console.log("Dati mancanti")
    res.status(422)
  }
})

router.get('/getElementByType',async (req,res)=>{
  let elementType=req.query.elementType?req.query.elementType:false
  if(elementType!=false){
    switch (elementType) {
      case "INOCULUM":
        await db.inoculum.findAll({include:{model:db.mushElement,
                                           where:{type:elementType},
                                          attributes:["id","element_code"]},
                                       attributes: [['inoculum_name', 'name']]})
              .then(result=>{
                res.status(200).json({result:result})
              })
              .catch(err=> {
                console.log(err)
                res.status(422)
              })
        break;
      case "SPAWN":
        await db.spawn.findAll({include:{model:db.mushElement,
                                           where:{type:elementType},
                                          attributes:["id","element_code"]},
                                       attributes: [['spawn_name', 'name']]})
              .then(result=>{
                res.status(200).json({result:result})
              })
              .catch(err=> {
                console.log(err)
                res.status(422)
              })
        break;
      case "CULTIVATION":
        await db.propagation.findAll({include:{model:db.mushElement,
                                               where:{type:elementType,active:1},
                                               attributes:["id","element_code"]},
                                       attributes: [['propagation_name', 'name']]})
              .then(result=>{
                res.status(200).json({result:result})
              })
              .catch(err=> {
                console.log(err)
                res.status(422)
              })
        break;
    }
  }
})

router.get('/getElementToPrint',async (req,res)=>{
  let fromDate=req.query.fromDate?moment(req.query.fromDate):moment().startOf('month')
  let toDate=req.query.toDate?moment(req.query.toDate).endOf('day'):moment().endOf('day')
  let inoculi_CHK=req.query.inoculi_CHK
  let spawn_CHK=req.query.spawn_CHK
  let propagation_CHK=req.query.propagation_CHK
  let inoculum=[]
  let spawn=[]
  let propagation=[]

  console.log(req.query)

  if(inoculi_CHK==1){
    inoculum=await db.inoculum.findAll({ where:{createLot: {[Op.between]: [fromDate.toDate(), toDate.toDate()] }},
                                        include:{model:db.mushElement,
                                                where:{type:"INOCULUM",active:1,},
                                                attributes:["id","element_code"]},
                                        attributes: ['code_inoculum','inoculum_name']})
  }
  
  if(spawn_CHK==1){
    spawn=await db.spawn.findAll({where:{createLot: {[Op.between]: [fromDate.toDate(), toDate.toDate()] }},
                                  include:{model:db.mushElement,
                                          where:{type:"SPAWN",active:1},
                                          attributes:["id","element_code"]},
                                  attributes: ['code_spawn','spawn_name']})
  }

  if(propagation_CHK==1){
    propagation=await db.propagation.findAll({where:{createLot: {[Op.between]: [fromDate.toDate(), toDate.toDate()] }},
                                              include:{model:db.mushElement,
                                                      where:{type:"CULTIVATION",active:1,},
                                                      attributes:["id","element_code"]},
                                              attributes: ['code_propagation','propagation_name']})
  }
  let result={inoculum:inoculum,
              spawn:spawn,
              propagation:propagation}
  res.status(200).json({fromDate:fromDate,toDate:toDate,result:result})
})

router.get('/printElement',async (req,res)=>{
  res.render("print_printElement")
})



module.exports=router;