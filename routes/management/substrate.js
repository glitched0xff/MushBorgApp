/**
 * API substrates element
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const dropDownGenerator= require("../../module/dropDownGenerator")
const db = require("../../models");
const sequelize=require("sequelize")
const SubstrateElements = db.substrateElement;
const Substrate = db.substrate;
const RawMaterial = db.rawMaterial;
const MaterialCategory = db.materialCategory;
const Spawn=db.spawn
const Propagation=db.propagation
const Op = db.Sequelize.Op;

// SubstrateElements.associate(db)
// Substrate.associate(db)
// Spawn.associate(db)
// Propagation.associate(db)

router.get('/',async  (req, res) => {
    let recipeDD=await dropDownGenerator("recipe")
    let pretreatmentDD=await dropDownGenerator("pretreatment")
    let redirectId=req.query.redirectId?req.query.redirectId:null
    let recipes=await db.recipe.findAll({order:["createdAt"],raw:true})
    let destinationDD=await dropDownGenerator("destination")
    let storageDD=await dropDownGenerator("storage")
    let udmDD=await db.dDOption.findAll({where:{ddMenu:"udmSelect"}})
    
    res.render("management/substrate",{recipes:recipes,
                                        udmDD:udmDD,
                                       recipeDD:recipeDD,
                                       pretreatmentDD:pretreatmentDD,
                                       redirectId:redirectId,
                                        destinationDD:destinationDD,
                                        storageDD:storageDD})
  });

router.get('/getAll',async  (req, res) => {
let substrates=await Substrate.findAll({
    include: [{
        model: SubstrateElements,
        include:[{model:db.rawMaterial,attributes:["material_name"]}
                ,{model:db.materialCategory}]
        },
        {model:Spawn,attributes:["id","spawn_name","code_spawn"]},
        {model:Propagation,attributes:["id","propagation_name","code_propagation","substrateId"]},
        {model:db.inoculum,attributes:["id"]}
    ]
    },{raw:true, order:['id']})
    let udmDD=await db.dDOption.findAll({where:{ddMenu:"udmSelect"}})
    
    res.status(200).json({substrates:substrates,udmDD:udmDD})
});

router.post('/newSubstrate', async(req,res) => {
    let data=req.body
    console.log(data)
    // CodeGen
    let prefix="SUB"
    let recipeSubCode=data.recipeSubCode
    let month=["A","B","C","D","E","F","G","H","I","L","M","N"]
    let date=moment().format("YY")+month[moment().month()]+moment().format("DD")
    let cod_substrate=prefix+date+recipeSubCode
    let codeCount=await db.substrate.count({where:{cod_substrate:{[Op.like]:`${cod_substrate}%`}}})
    cod_substrate=cod_substrate+codeCount
    //
        await Substrate.create({
            cod_substrate:cod_substrate,
            name_substrate:data.name_substrate,
            recipeId:data.recipeId ,
            pretreatmentId:data.pretreatmentId,
            sub_code:data.sub_code,
            qt:data.qt,
            uom:data.uom,
            storageId:data.storageId,
            destination:data.destination,
            note:data.note
            })
        .then(result=>{
            console.log(JSON.parse(JSON.stringify(result)))
            res.status(200).json({data:result})
        })
        .catch(err =>{
            console.log(err)

            res.status(522).json({message:err}) 
        })
})

router.put('/updateSubstrate', async(req,res) => {
    let idSubstrate=req.body.id?req.body.id:false
    let data=req.body
    if ((substrate_name!=false)&&(idSubstrate!=false)){
        await Substrate.update({
            recipeId:data.recipeId ,
            recipe_name:data.recipe_name ,
            pretreatment:data.pretreatment ,
            pretreatmentId:data.pretreatmentId ,
            pretreatmentNote:data.pretreatmentNote ,
            note:data.note
            },{where:{id:idSubstrate}})
        .then(result=>{
            res.status(200).json({data:result})
        })
        .catch(err =>{
            res.status(522).json({message:err.errors[0].message}) 
        })
                
    } else {
        res.status(522).json()
    }
})

router.get('/getOneSubstrate',async  (req, res) => {
    let substratesId=req.query.id?req.query.id:false
    if (substratesId!=false){
        let substrate=await Substrate.findOne({
            where:{id:substratesId},
            include: [{model: SubstrateElements,
                       include:[
                            { model:RawMaterial,
                                include:[{model:db.supplier,attributes:["supplier_name"]}],
                                attributes:["material_name","hum_factor"]
                            },
                            { model:MaterialCategory,attributes:["category_name"]}
                        ]
                    },
                    {model:db.recipe,include:[{model:db.recipeElement}]},
                    {model:Spawn,attributes:["id","spawn_name","code_spawn"]},
                    {model:Propagation,attributes:["id","propagation_name","code_propagation"]},
                    {model:db.inoculum,attributes:["id","inoculum_name","code_inoculum"]}
                ]})
        
        res.status(200).json({substrate:substrate})
    } else {
            res.status(522).json()
        }
  });

router.delete('/deleteSubstrate',async  (req, res) => {
    let substrateId=req.query.id?req.query.id:false
    if (substrateId!=false){
        let result=await SubstrateElements.destroy({where:{substrateId:substrateId}})
        result=await Substrate.destroy({where:{id:substrateId},include:[{model: SubstrateElements}]})
        res.status(200).json({result:result})
    } else {
            res.status(522).json()
        }
  });

router.get('/getSubstrateOfRecipe',async  (req, res) => {
    let idRecipe=req.query.idRecipe
    let recipeSubstrate=await Substrate.findAll({where:{recipeId:idRecipe}})
    res.status(200).json({recipeSubstrate:recipeSubstrate})
});

router.get('/getSubstrateCode',async  (req, res) => {
    let lastSub=await Substrate.findOne({
        order: [ [ 'id', 'DESC' ]],
        });
    let subCode="SU"
    let date=moment().format("YYMM")
    let idStr=lastSub.id.toString()
    if (idStr.length==1){idStr="00"+idStr}
    if (idStr.length==2){idStr="0"+idStr}
    if (idStr.length==3){idStr=""+idStr}
    subCode=subCode+date+idStr+"00"
    res.status(200).json({subCode:subCode})
  });

module.exports=router;
