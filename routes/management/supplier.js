// rout supplier
// Todo: GUI CRUD

const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../../models");
const Supplier = db.supplier;
const MaterialCategory=db.materialCategory;
const RawMaterial=db.rawMaterial;
const Op = db.Sequelize.Op;

Supplier.associate(db)

router.get('/',async  (req, res) => {
    let suppliers=await Supplier.findAll({order:['supplier_name']})
    let materialCategory=await MaterialCategory.findAll({order:['category_name'],raw:true})
    res.render("management/supplier",{suppliers:suppliers,materialCategory:materialCategory})
  });
  
router.post('/newSupplier', async(req,res) => {
    let supplier_name = req.body.supplier_name?req.body.supplier_name:false
    let data=req.body
    if (supplier_name!=false){
        await Supplier.create({
                    supplier_name:data.supplier_name,
                    address:data.address,
                    phone:data.phone,
                    mail:data.mail,
                    note:data.note,
                })
                .then(result=>{
                    res.status(200).json({data:result})
                })
                .catch(err =>{
                    console.log(err)
                    res.status(522).json({message:err.errors[0].message}) 
                })
                
    } else {
        res.status(522).json()
    }
})

router.get('/getAll',async  (req, res) => {
    let suppliers=await Supplier.findAll({order:['supplier_name']})
    res.status(200).json({suppliers:suppliers})
  });

  router.get('/getOneSupplier',async  (req, res) => {
    let supplierId=req.query.id?req.query.id:false
    if (supplierId!=false){
        let supplier=await Supplier.findOne({where:{id:supplierId}},{raw:"true"})
        supplier=JSON.parse(JSON.stringify(supplier))
        let material=await RawMaterial.findAll({where:{supplierId:supplier.id}})
        material=JSON.parse(JSON.stringify(material))
        supplier.material=material
        console.log(material)
        res.status(200).json({supplier:supplier})
    } else {
            res.status(522).json()
        }
  });

  router.put('/updateSupplier', async(req,res) => {
    console.log(req.body)
    let idSupplier=req.body.id?req.body.id:false
    let data=req.body
    if (idSupplier!=false){
        await Supplier.update({
            supplier_name:data.supplier_name,
            address:data.address,
            phone:data.phone,
            mail:data.mail,
            note:data.note,
            },{where:{id:idSupplier}})
        .then(result=>{
            res.status(200).json({data:result})
        })
        .catch(err =>{
            res.status(522).json({message:err}) 
        })
                
    } else {
        res.status(522).json()
    }
})

  router.delete('/deleteSupplier',async  (req, res) => {
    let supplierId=req.query.id?req.query.id:false
    if (supplierId!=false){
        result=await Supplier.destroy({where:{id:supplierId}})
        res.status(200).json({result:result})
    } else {
            res.status(522).json()
        }
  });

  router.get('/getSupplierCode',async  (req, res) => {
      let lastSub=await Supplier.findOne({
          order: [ [ 'id', 'DESC' ]],
          });
      let subCode="SUP"
      let date=moment().format("YYMM")
      let idStr=lastSub.id.toString()
      if (idStr.length==1){idStr="00"+idStr}
      if (idStr.length==2){idStr="0"+idStr}
      if (idStr.length==3){idStr=""+idStr}
      subCode=subCode+date+idStr+"00"
      res.status(200).json({subCode:subCode})
    });
module.exports=router;
