const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../models");
const dropDownGenerator=require('../module/dropDownGenerator')
const { fn, col, literal, Op } = require("sequelize");

router.get('/',async (req,res)=>{
  let requestCode=req.query.requestCode?req.query.requestCode:false
      console.log(requestCode)

    res.render("search",{searchedString:requestCode})
  
})



// Search engine
router.get('/search',async (req,res)=>{
    console.log(req.query)
    let requestCode=req.query.requestCode?req.query.requestCode:false
       
    if (!requestCode || requestCode.trim() === "") {
            return res.json({
                result: [],
                searchedString: false
            });
        }
    const result = await Promise.all([
        db.mushElement.findAll({
            attributes: [
                        "id", 
                        "type",
                        "element_code",
                        [db.Sequelize.literal("'mushElement'"), "typeSearch"] // Genera la colonna al volo con il valore 'mushElement'
                    ],
            where: { element_code: { [Op.like]: `%${requestCode}%` } }
        }),
        db.propagation.findAll({
            attributes: [ "id",
                        "code_propagation",
                        "propagation_name",
                        [db.Sequelize.literal("'propagation'"), "typeSearch"]
            ],
            where: { code_propagation: { [Op.like]: `%${requestCode}%` } }
        }),
        db.spawn.findAll({
            attributes: ["id",
                        "code_spawn",
                        "spawn_name",
                        [db.Sequelize.literal("'spawn'"), "typeSearch"]
            ],
            where: { code_spawn: { [Op.like]: `%${requestCode}%` } }
        }),
        db.inoculum.findAll({
            attributes: [
                "id",
                        "code_inoculum",
                        "inoculum_name",
                        [db.Sequelize.literal("'inoculum'"), "typeSearch"]
            ],
            where: { code_inoculum: { [Op.like]: `%${requestCode}%` } }
        }),
        db.strain.findAll({
            attributes: [
                "id",
                        "code_strain",
                        "strain_name",
                        [db.Sequelize.literal("'strain'"), "typeSearch"]
            ],
            where: { code_strain: { [Op.like]: `%${requestCode}%` } }
        })
    ]);

    recordInfo=result.flat()
    res.status(200).json({result:recordInfo,searchedString:requestCode})
})

module.exports=router;