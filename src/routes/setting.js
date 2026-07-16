/**
 * Routes to manage system setting
 */

let express = require('express');
let router = express.Router();
let moment=require("moment")
let db = require("../models");
let ejs=require("ejs")
let { fn, col, literal, Op } = require("sequelize");
let path=require("path")

router.get('/',async  (req, res) => {
  res.render("setDropDown")
});


router.get('/listDD',async (req,res)=>{
  let list=await db.dDOption.findAll({order: [
                    ['ddMenu', 'ASC'],
                    ['val', 'ASC']
                  ],
                  raw: true})
  res.status(200).json(list)
})

// router.get('/',async (req,res)=>{

// })



module.exports=router;