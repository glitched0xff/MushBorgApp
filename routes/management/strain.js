/**
 * Strain
 * @name Strain
 * @module Strain
 * @description Route per la gestione delle strain
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../../models");
const Strain = db.strain;
const { Sequelize, Op, fn, col } = require("sequelize");
const dropDownGenerator= require("../../module/dropDownGenerator")
const generatePdfReport= require("../../module/generatePdfReport")
const generateStrainCode= require("../../module/generateStrainCode")
const {createNote}=require("../../module/diaryNote")
const puppeteer = require("puppeteer");
const { Readable } = require("stream");
const ejs=require("ejs")
const fs=require("fs")
const path=require("path")
//Strain.associate(db)

/**
 * Route serving login form.
 * @name /
 * @memberof Strain
 * @param {string} path - Express path
 * @param {callback} middleware - Express middleware.
 */
router.get('/',async  (req, res) => {
    let redirectId=req.query.redirectId?req.query.redirectId:null
    let strainDD=await  dropDownGenerator("strain")
    let supplierDD=await dropDownGenerator("supplier")
    let speciesDD=await dropDownGenerator("species")
    let strainMediaDD=await db.dDOption.findAll({where:{ddMenu:"strainMedia"}})
    //console.log(speciesDD)
    res.render("management/strain",{strainDD:strainDD,
                                    redirectId:redirectId,
                                    supplierDD:supplierDD,
                                    speciesDD:speciesDD,
                                    strainMediaDD:strainMediaDD
                                })
  });

router.get('/getAll',async  (req, res) => {
let strains=await Strain.findAll({attributes: [ "id",
                                                "code_strain",
                                                "strain_name",
                                                "species",
                                                "generation",
                                                [fn("COUNT", col("spawns.id")), "spawnCount"],
                                                [fn("COUNT", col("inoculums.id")), "inoculumCount"],
                                                [fn("COUNT", col("propagations.id")), "propagationCount"],
                                            ],
                                  include: [{
                                            model: db.supplier,
                                            attributes:["id","supplier_name"]
                                            },
                                            {
                                            model: db.spawn,
                                            attributes: [],
                                            },
                                            {
                                            model: db.inoculum,
                                            attributes: [],
                                            },
                                            {
                                            model: db.propagation,
                                            attributes: [],
                                            }],
                                  group: ["strain.id"],
                                  order:[["createdAt","DESC"]]})
    res.status(200).json({strains:strains})
});

router.post('/newStrain', async(req,res) => {
    let data=req.body
    delete data.idStrain
    let code=await generateStrainCode(data.species_code,data.buyed,data.sub_code)
    data.code_strain=code
    data.buyed=moment(data.buyed,"DD-MM-YY").utc()
    console.log(data)
    data.species_code=data.species_code
    await db.strain.create(data)
        .then(async(result)=>{
            await createNote(`Inserito nuovo strain: ${result.code_strain}`,"Strain","Strain")
            res.status(200).json(result)
        })
        .catch(err =>{
            console.log(err)
            res.status(522).json({message:err}) 
        })
})

router.put('/updateStrain', async(req,res) => {
    let idStrain=req.body.idStrain?req.body.idStrain:false
    let data=req.body
    //console.log("update")
    delete data.idStrain
    //console.log(data)
    data.buyed=moment(data.buyed,"DD-MM-YY").utc()
    await db.strain.update(data,{where:{id:idStrain}})
        .then(result=>{
            res.status(200).json(result)
        })
        .catch(err =>{
            console.log(err)
            res.status(522).json({message:err}) 
        })
})

router.put('/updateParameters',async (req,res)=>{
    let data=req.body
    let ins={}
    ins=data
    let idStrain=data.idStrainParameter
    delete data.idStrainParameter;
    if (ins.indoor== undefined) {
          ins.indoor=0
        }
    if (ins.outdoor== undefined) {
          ins.outdoor=0
        }
    
    await Strain.update(data,{where:{id:idStrain}})
            .then(result=>{
                res.status(200).json(result)
            })
            .catch(err=>{
                console.log(err)
            })
    
})
router.get('/getParameterStrain',async  (req, res) => {
    let strainId=req.query.idStrain?req.query.idStrain:false
    if (strainId!=false){
        let strain=await Strain.findOne({where:{id:strainId},attributes:["incubation_temp",
                                                                        "incubation_hum",
                                                                        "incubation_len",
                                                                        "incubation_co2",
                                                                        "incubation_airExch",
                                                                        "incubation_light",
                                                                        "primordia_temp",
                                                                        "primordia_hum",
                                                                        "primordia_len",
                                                                        "primordia_co2",
                                                                        "primordia_airExch",
                                                                        "primordia_light",
                                                                        "fructification_temp",
                                                                        "fructification_hum",
                                                                        "fructification_len",
                                                                        "fructification_co2",
                                                                        "fructification_airExch",
                                                                        "fructification_light",
                                                                        "outdoor",
                                                                        "indoor",
                                                                        "liked_substrate"]})
        res.status(200).json({strain:strain})
    } else {
            res.status(522).json()
        }
  });

router.delete('/deleteStrain',async  (req, res) => {
    let strainId=req.query.id?req.query.id:false
    if (strainId!=false){
        result=await Strain.destroy({where:{id:strainId}})
        res.status(200).json({result:result})
    } else {
            res.status(522).json()
        }
  });

router.get('/getOneStrain',async  (req, res) => {
    let strainId=req.query.id?req.query.id:false
    if (strainId!=false){
         let strain=await Strain.findOne({where:{id:strainId},
                                        include: [{model: db.supplier,attributes:["id","supplier_name"]},
                                                {model: db.inoculum,attributes:["id","inoculum_name","code_inoculum"]},
                                                {model: db.spawn,attributes:["id","spawn_name","code_spawn"]},
                                                {model: db.propagation,attributes:["id","propagation_name","code_propagation"]}]
                                        })
        res.status(200).json({strain:strain})
    } else {
            res.status(522).json()
        }
  });

router.get('/pdf',async (req,res)=>{        
    let strainId=req.query.idStrain?req.query.idStrain:false
    let getHtml=req.query.getHtml?req.query.getHtml:false
    if (strainId!=false){
         let strain=await Strain.findOne({where:{id:strainId},
                                        include: [{model: db.supplier,attributes:["id","supplier_name"]},
                                                {model: db.inoculum,attributes:["id","inoculum_name","code_inoculum"]},
                                                {model: db.spawn,attributes:["id","spawn_name","code_spawn"]},
                                                {model: db.propagation,attributes:["id","propagation_name","code_propagation"]}]})
        
        strain=JSON.parse(JSON.stringify(strain))
        strain.buyed=moment(strain.buyed).format("DD-MM-YY")
        strain.updatedAt=moment(strain.updatedAt).format("DD-MM-YY HH:MM")
        try {
            const pdf=await generatePdfReport(strain,"strainReport.ejs")
            if (getHtml==false){
                res.setHeader("Content-Type", "application/pdf");
                res.setHeader("Content-Disposition", "inline; filename=report.pdf");
                res.end(pdf); 
            } else {
                res.send(html)
            }
        } catch (err) {
            console.error(err);
            res.status(500).send("Errore durante la generazione del PDF");
        }
    } else {
            res.status(522).json()
        }
})


/**
 * Area gestione species
 */
router.get('/species',async (req,res)=>{
    let redirectId=req.query.redirectId?req.query.redirectId:null
   
    res.render("management/species",{
                                    redirectId:redirectId,
                                })
})
router.get('/species/getAll',async (req,res)=>{
    let species=await db.species.findAll()
    species=JSON.parse(JSON.stringify(species))
    for (let i = 0; i < species.length; i++) {        
        let strain= await db.strain.count({where:{species_code:species[i].shortCode}})
        species[i].strains=JSON.parse(JSON.stringify(strain))
    }
    res.status(200).json({species:species})
})
router.get('/species/getOneSpecie',async (req,res)=>{
    let speciesId=req.query.id?req.query.id:false
    if (speciesId!=false){
        let specie=await db.species.findOne({where:{id:speciesId}})
        specie=JSON.parse(JSON.stringify(specie))       
        let strain= await db.strain.findAll({where:{species_code:specie.shortCode}})
        specie.strains=JSON.parse(JSON.stringify(strain))
        res.status(200).json({specie:specie})
    }
})
router.post('/species/newSpecie', async(req,res) => {
    let data=req.body
    delete data.idSpecie
    console.log(data)
    await db.species.create(data)
        .then(async(result)=>{
            res.status(200).json(result)
        })
        .catch(err =>{
            console.log(err)
            res.status(522).json({message:err}) 
        })
})

router.delete('/species/deleteSpecie',async  (req, res) => {
    let specieId=req.query.id?req.query.id:false
    if (specieId!=false){
        result=await db.species.destroy({where:{id:specieId}})
        res.status(200).json({result:result})
    } else {
            res.status(522).json()
        }
  });
module.exports=router;
