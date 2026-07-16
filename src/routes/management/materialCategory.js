const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../../models");
const MaterialCategory = db.materialCategory;
const RawMaterial = db.rawMaterial;
const Op = db.Sequelize.Op;

router.get('/',async  (req, res) => {
    let materialCategory=await MaterialCategory.findAll({include: [{model: RawMaterial}]},{order:['category_name'],raw:true})
    materialCategory=JSON.parse(JSON.stringify(materialCategory))
    materialCategory.forEach(el => {
        if (el.rawMaterials.length){
            el.delRow=true
            el.rawMaterials=el.rawMaterials.length
        }else{
            el.delRow=false
            el.rawMaterials=el.rawMaterials.length
        }
    });
    res.status(200).json({materialCategories:materialCategory})
  });

router.get('/getListCanDelete',async  (req, res) => {
    let materialCategories=await MaterialCategory.findAll({include: [{model: RawMaterial}]},{order:['category_name']})
    materialCategories=JSON.parse(JSON.stringify(materialCategories))
    materialCategories.forEach(el => {
        if (el.rawMaterials.length){
            el.delRow=true
            el.rawMaterials=el.rawMaterials.length
        }else{
            el.delRow=false
            el.rawMaterials=el.rawMaterials.length
        }
    });
    res.status(200).json({materialCategories:materialCategories})
});

router.post('/newMaterialCategory', async(req,res) => {
    let category_name = req.body.category_name?req.body.category_name:false
    console.log(req.body)
    let data=req.body
    if (category_name!=false){
        await MaterialCategory.create({
                    category_name:data.category_name,
                    hum_factor:data.hum_factor,
                    dry_factor:data.dry_factor,
                    note:data.note,
                    color:data.color,
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

// Delete
router.delete('/deleteMaterialCategory',async  (req, res) => {
    let idMaterialCategory=req.query.id?req.query.id:false
    if (idMaterialCategory!=false){
        let checkUse=await RawMaterial.findAll({where:{materialCategoryId:idMaterialCategory}})
        if(checkUse.length==0){
            let result=await MaterialCategory.destroy({where:{id:idMaterialCategory}})
            res.status(200).json({checkUse:false,data:result})
        }
        else{
            res.status(200).json({checkUse:true,message:"Il la categoria è in uso e non può essere eliminata"})

        }    
    } else {
            res.status(522).json()
        }
  });

module.exports=router;
