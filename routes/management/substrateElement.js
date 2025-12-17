/**
 * API substrate element
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../../models");
const SubstrateElement = db.substrateElement;
const Substrate = db.recipe;
const Op = db.Sequelize.Op;

SubstrateElement.associate(db)
Substrate.associate(db)

router.get('/',async  (req, res) => {
    let substrateElements=await SubstrateElement.findAll()
    res.status(200).json({result:"Welcome recipe Element API"})
  });

router.get('/getAll',async  (req, res) => {
    let substrateElements=await SubstrateElement.findAll()
    res.status(200).json({substrateElements:substrateElements})
});
  
router.post('/newSubstrateElement', async(req,res) => {
    //console.log(req.body)
    let substrateId = req.body.substrateId?req.body.substrateId:false
    let materialCategoryId = req.body.materialCategoryId?req.body.materialCategoryId:false
    let rawMaterialId = req.body.rawMaterialId?req.body.rawMaterialId:false
    let qt_dry = req.body.qt_dry?req.body.qt_dry:false
    let qt_hum = req.body.qt_hum?req.body.qt_hum:false
    let data=req.body
    if ((substrateId!=false)&&(materialCategoryId!=false)&&(rawMaterialId!=false))
    {
        await SubstrateElement.create({
                    substrateId:data.substrateId,
                    materialCategoryId:data.materialCategoryId,
                    rawMaterialId:data.rawMaterialId,
                    materialName:data.materialName,
                    qt_dry:data.qt_dry,
                    qt_hum:data.qt_hum,
                })
                .then(result=>{
                    res.status(200).json({data:result})
                })
                .catch(err =>{
                    console.log(err)
                    res.status(522).json({message:err.errors.message}) 
                })
                
    } else {
        res.status(522).json()
    }
})

router.put('/updateSubstrateElementsQt', async(req,res) => {
    let substrateId = req.body.substrateId?req.body.substrateId:false
    let substrateElementId = req.body.id?req.body.id:false
    let data=req.body
    if ((substrateId!=false)&&(substrateElementId!=false)){
        await SubstrateElement.update({
                    qt:data.qt
                },{where:{id:substrateElementId}})
                .then(result=>{
                    res.status(200).json({data:result})
                })
                .catch(err =>{
                    res.status(522).json({message:err.errors.message}) 
                })
                
    } else {
        res.status(522).json()
    }
})

router.delete('/deleteSubstrateElements',async  (req, res) => {
    let id=req.query.id?req.query.id:false
    if (id!=false){
        let result=await SubstrateElement.destroy({where:{id:id}})
        res.status(200).json({result:result})
    } else {
            res.status(522).json()
        }
  });



module.exports=router;
