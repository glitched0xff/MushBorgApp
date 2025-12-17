const express = require('express');
const router = express.Router();
const moment=require("moment")
const dropDownGenerator= require("../../module/dropDownGenerator")
const db = require("../../models");
const { Op, literal } = require("sequelize");
const MaterialCategory = db.materialCategory;
const RawMaterial = db.rawMaterial;
const Supplier = db.supplier;
const SubstrateElement = db.substrateElement;
const Substrate = db.substrate;

// MaterialCategory.associate(db)
// RawMaterial.associate(db)
// SubstrateElement.associate(db)
// Substrate.associate(db)

router.get('/',async  (req, res) => {
    let redirectId=req.query.redirectId?req.query.redirectId:null
    let supplierDD=await dropDownGenerator("supplier")
    let materialCategoryDD= await dropDownGenerator("materialCategory")
    let storageDD= await dropDownGenerator("storage")
    let destinationDD= await dropDownGenerator("destination")
    let materialCategory=await MaterialCategory.findAll({include: [{model: RawMaterial}]},{order:['category_name'],raw:true})
        let udmDD=await db.dDOption.findAll({where:{ddMenu:"udmSelect"}})
    
    res.render("management/rawMaterial",{
        udmDD:udmDD,
         materialCategory:materialCategory
        ,supplierDD:supplierDD
        ,materialCategoryDD:materialCategoryDD
        ,storageDD:storageDD
        ,destinationDD:destinationDD
        ,redirectId:redirectId
    })
  });
  
router.get('/getAll',async  (req, res) => {
let rawMaterials=await RawMaterial.findAll({
    logging: console.log,
    include: [{
            model: MaterialCategory,
        },{
            model: Supplier,
        },{
            model:SubstrateElement,attributes:["id"],include:[{model: Substrate,attributes:["id","cod_substrate","name_substrate"]}]
        },{
            model: db.storage,attributes:["name_storage","code_storage"]
        }]
                },{raw:true, order:['createdAt']})
    rawMaterials=JSON.parse(JSON.stringify(rawMaterials))
    for (let i = 0; i < rawMaterials.length; i++) {
        const elem = rawMaterials[i];
        elem.usedElement=elem.substrateElements.length
    }
    res.status(200).json({rawMaterials:rawMaterials})
});

router.post('/newRawMaterial', async(req,res) => {
    let material_name = req.body.material_name?req.body.material_name:false
    let data=req.body
    if (material_name!=false){
        await RawMaterial.create({
            material_name:data.material_name,
            materialCategoryId:data.materialCategoryId,
            supplierId:data.supplierId,
            fornitore:data.fornitore,
            date_storage:data.date_storage,
            quantity:data.quantity,
            hum_factor:data.hum_factor,
            uom:data.uom,
            storageId:data.storageId,
            destination:data.destination,
            note:data.note,
            })
        .then(result=>{
            res.status(200).json({data:result})
        })
        .catch(err =>{
            console.log(err)
            res.status(522).json({message:err}) 
        })
                
    } else {
        res.status(522).json()
    }
})

router.get('/getOneRawMaterial',async  (req, res) => {
    let idMaterial=req.query.id?req.query.id:false
    if (idMaterial!=false){
        let material=await RawMaterial.findOne({where:{id:idMaterial},
                                                include: [{model: MaterialCategory}
                                                        ,{model: Supplier}
                                                        ,{ model:SubstrateElement,
                                                            attributes:["id"],
                                                            include:[{model: Substrate,attributes:["id","cod_substrate","name_substrate"]}]
                                                        }]
                                                    })
    material=JSON.parse(JSON.stringify(material))
    let substrates=[]
    material.substrateElements.forEach(elem => {
        substrates.push(elem.substrate)
    });
    material.substrates=substrates
    material.usedElement=material.substrates.length
    let storageDD=await dropDownGenerator("storage")
    let storageMaterial
    storageDD.forEach((el)=>{
        if (el.val==material.storageId){
            storageMaterial= el.txt
        }
    })
    material.storageName=storageMaterial
    res.status(200).json({material:material})
    } else {
            res.status(522).json()
        }
  });
// Delete
router.delete('/deleteRawMaterial',async  (req, res) => {
    let idMaterial=req.query.id?req.query.id:false
    if (idMaterial!=false){
        let checkUse=await SubstrateElement.findAll({where:{id:idMaterial}})
        if(checkUse.length==0){
            let result=await db.rawMaterial.destroy({where:{id:idMaterial}})
            res.status(200).json({checkUse:false,data:result})
        }
        else{
            res.status(200).json({checkUse:true,message:"Il materiale è in uso in qualche substrato e non può essere aggiornato"})

        }    
    } else {
            res.status(522).json()
        }
  });
// Update
router.put('/updateRawMaterial', async(req,res) => {
    let idMaterial=req.body.idRawMaterial?req.body.idRawMaterial:false
    let material_name=req.body.material_name?req.body.material_name:false
    let data=req.body
    console.log(data)
    if ((material_name!=false)&&(idMaterial!=false)){
        
        let checkUse=await SubstrateElement.findAll({where:{id:idMaterial}})
        if(checkUse.length==0){
            await RawMaterial.update({
                material_name:data.material_name,
                materialCategoryId:data.materialCategoryId,
                quantity:data.quantity,
                uom:data.uom,
                supplierId:data.supplierId,
                hum_factor:data.hum_factor,
                storageId:data.storageId,
            destination:data.destination,
                note:data.note
                },{where:{id:idMaterial}})
        .then(result=>{
            res.status(200).json({checkUse:false,data:result})
        })
        .catch(err =>{
            console.log(err)
            res.status(422).json({message:err}) 
        })
        }
        else{
            res.status(200).json({checkUse:true,message:"Il materiale è in uso in qualche substrato e non può essere aggiornato"})
        }      
    } else {
        res.status(422).json()
    }
})

// Check if material is used in substrate. If true update and delete will be forbidden
router.get('/checkUseRawMaterial',async  (req, res) => {
    let idMaterial=req.query.id?req.query.id:false
    if (idMaterial!=false){
        let checkUse=await SubstrateElement.findAll({where:{id:idMaterial}})
        if(checkUse.length==0){
            res.status(200).json({checkUse:false})
        }
        else{
            let inSubstrate=[]
            for (let i = 0; i < checkUse.length; i++) {
                const el = checkUse[i];
                let sub= await Substrate.findAll({where:{id:el.substrateId}})
                inSubstrate.push(sub)
            }
            res.status(200).json({checkUse:true,where:inSubstrate})
        }    
    } else {
            res.status(522).json()
        }
  });

  router.get("/getMaterialByCategory",async (req,res)=>{
    console.log(req.query.idCategory)
    let idCategory=req.query.idCategory
    let material=await RawMaterial.findAll({where:{materialCategoryId:idCategory},include:[{model:MaterialCategory,attributes:["category_name","hum_factor"]}]})
    console.log(material)
    res.status(200).json({material:material})
  })

module.exports=router;
