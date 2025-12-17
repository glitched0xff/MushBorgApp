const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../models");
const dropDownGenerator=require('../module/dropDownGenerator')
const { fn, col, literal, Op } = require("sequelize");

router.get('/',async (req,res)=>{
  let requestCode=req.query.code?req.query.code:false
    if (requestCode){
        let recordInfo=[]
        let result

        result=await db.mushElement.findAll({where:{element_code:{ [Op.like]: `%${requestCode}%` }}})
        let rJson={}
        rJson.data=JSON.parse(JSON.stringify(result))
        rJson.type="mushElement"
        recordInfo.push(rJson)

        result=await db.propagation.findAll({where:{code_propagation:{ [Op.like]: `%${requestCode}%` }}})
        rJson={}
        rJson.data=JSON.parse(JSON.stringify(result))
        rJson.type="propagation"
        recordInfo.push(rJson)

        result=await db.spawn.findAll({where:{code_spawn:{ [Op.like]: `%${requestCode}%` }}})
        rJson={}
        rJson.data=JSON.parse(JSON.stringify(result))
        rJson.type="spawn"
        recordInfo.push(rJson)

        result=await db.inoculum.findAll({where:{code_inoculum:{ [Op.like]: `%${requestCode}%` }}})
        rJson={}
        rJson.data=JSON.parse(JSON.stringify(result))
        rJson.type="inoculum"
        recordInfo.push(rJson)

        result=await db.strain.findAll({where:{code_strain:{ [Op.like]: `%${requestCode}%` }}})
        rJson={}
        rJson.data=JSON.parse(JSON.stringify(result))
        rJson.type="strain"
        recordInfo.push(rJson)

       // res.status(200).json({result:recordInfo})
        res.render("search",{result:recordInfo,searchedString:requestCode})
    }else{
        res.render("search",{result:false,searchedString:false})
    }
  
})



// Search engine
router.get('/search',async (req,res)=>{
    
})

module.exports=router;