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
        let elem= await db.mushElement.findOne({where:{element_code: el}})
      csvObj.push({
                  element_code:elem.element_code,
                  createAt:moment(elem.load_date).format("DD-MM-YY HH:mm"),
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

router.get('/printElement',async (req,res)=>{
  res.render("print_printElement")
})



module.exports=router;