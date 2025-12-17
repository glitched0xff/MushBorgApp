/**
 * API containers element
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../../models");
const Container = db.container;
const Supplier = db.supplier;
const Spawn = db.spawn;
const Propagation = db.propagation;
const Op = db.Sequelize.Op;

// Container.associate(db)
// Spawn.associate(db)
// Propagation.associate(db)

router.get('/',async  (req, res) => {
    let supplier=await Supplier.findAll()
    let supplierDD=[]
    supplier.forEach(elem => {
        supplierDD.push({val:elem.id,txt:elem.supplier_name})
    });
    res.render("management/container",{supplierDD:supplierDD})
  });

router.get('/getAll',async  (req, res) => {
    let containers=await Container.findAll({include:[{model:Supplier,attributes:["supplier_name"]},
                                                    {model:Spawn,attributes:["id"]},
                                                    {model:Propagation,attributes:["id"]}]})
    containers=JSON.parse(JSON.stringify(containers))
    console.log(containers)
    for (let i = 0; i < containers.length; i++) {
        const el = containers[i];
        el.usedInSpawn=el.spawns.length
        el.usedInPropagation=el.propagations.length
    }
    
    res.status(200).json({containers:containers})
});

router.post('/newContainer', async(req,res) => {
    console.log(req.body)
    let container_name = req.body.container_name?req.body.container_name:false
    let data=req.body

    let prefix="CON"
    let month=["A","B","C","D","E","F","G","H","I","L","M","N"]
    let date=moment().format("YY")+month[moment().month()]+moment().format("DD")
    let code_container=prefix+date
    let codeCount=await db.container.count({where:{code_container:{[Op.like]:`${code_container}%`}}})
    code_container=code_container+codeCount

    if (container_name!=false){
        await Container.create({
            code_container:code_container,
            container_name:data.container_name,
            capacity:data.capacity,
            uom:data.uom,
            material:data.material,
            reusable:data.reusable?data.reusable:"0",
            type:data.type,
            supplierId:data.supplierId?data.supplierId:null,
            destination:data.destination,
            note:data.note,
            })
        .then(result=>{
            res.status(200).json({data:result})
        })
        .catch(err =>{
            console.log(err)
            res.status(422).json({message:err}) 
        })
                
    } else {
        res.status(522).json("Something wrong")
    }
})

router.put('/updateContainer', async(req,res) => {
    let idContainer=req.body.id?req.body.id:false
    let data=req.body
    let container_name = req.body.container_name?req.body.container_name:false
    if ((container_name!=false)&&(idContainer!=false)){
        await Container.update({
            code_container:data.code_container,
            container_name:data.container_name,
            capacity:data.capacity,
            uom:data.uom,
            material:data.material,
            reusable:data.reusable?data.reusable:"0",
            type:data.type,
            supplierId:data.supplierId,
            destination:data.destination,
            note:data.note,
            },{where:{id:idContainer}})
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

router.get('/getOneContainer',async  (req, res) => {
    let containersId=req.query.id?req.query.id:false
    if (containersId!=false){
        let container=await Container.findOne({where:{id:containersId},include: [{model: Supplier},
                                                                                {model:Spawn,attributes:["id","spawn_name","code_spawn"]},
                                                                                {model:Propagation,attributes:["id","propagation_name","code_propagation","substrateId"]}
                                                                            ]})
        res.status(200).json({container:container})
    } else {
            res.status(522).json()
        }
  });

router.delete('/deleteContainer',async  (req, res) => {
    let containerId=req.query.id?req.query.id:false
    if (containerId!=false){
        let container=await Container.findByPk(containerId)
        if (container.used==0){
            let result=await Container.destroy({where:{id:containerId},include:[{model: Supplier}]})
            res.status(200).json({result:result})
        } else {
            res.status(422).json({message:"Elemento utilizzato"})
        }
    } else {
            res.status(522).json()
        }
  });

router.get('/getContainerOfRecipe',async  (req, res) => {
    let idRecipe=req.query.idRecipe
    let recipeContainer=await Container.findAll({where:{recipeId:idRecipe}})
    res.status(200).json({recipeContainer:recipeContainer})
});

router.get('/getContainerCode',async  (req, res) => {
      let lastSub=await Container.findOne({
          order: [ [ 'id', 'DESC' ]],
          });
      let contCode="SUP"
      let date=moment().format("YYMM")
      let idStr=lastSub.id.toString()
      if (idStr.length==1){idStr="00"+idStr}
      if (idStr.length==2){idStr="0"+idStr}
      if (idStr.length==3){idStr=""+idStr}
      contCode=contCode+date+idStr+"00"
      res.status(200).json({contCode:contCode})
    });

module.exports=router;
