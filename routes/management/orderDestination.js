/**
 * @module orderDestination
 * @description Questo modulo gestisce i contatti per la richiesta di ordini e per la consegna
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const dropDownGenerator= require("../../module/dropDownGenerator")
const generatePdfReport= require("../../module/generatePdfReport")
const db = require("../../models");

const OrderDestination = db.orderDestination;
const Op = db.Sequelize.Op;

/**
 * @name GET /orderDestination/
 * @function
 * @memberof module:OrderDestination
 * @description Home page con la generazione dell'interfaccia
 * @returns  Restituisce il file views/management/orderDestination.ejs renderizzato
 */
router.get('/',async  (req, res) => {
        let redirectId=req.query.redirectId?req.query.redirectId:null
        res.render("management/destination",{redirectId:redirectId})

  });

/**
 * @name GET /orderDestination/getAll
 * @function
 * @memberof module:OrderDestination
 * @description Restituisce la lista degli spawn
 * @returns 200 - Lista inoculi con join dei dati collegati
 */
router.get('/getAll',async  (req, res) => {
    let orderDestination=await OrderDestination.findAll({include:[
                                        {model: db.productionOrder},
                                    ]})   
    res.status(200).json({orderDestination:orderDestination})
});


router.put('/updateDestination', async(req,res) => {
    let data=req.body
    let destinationId=req.query.id?req.query.id:false
    console.log(data)
    if (destinationId!=false){
        // await Spawn.update({
        //     strainId:data.strainId,
        //     qt:data.qt,
        //     container:data.container,
        //     nr_container:data.nr_container,
        //     qt_container:data.qt_container,
        //     uom_conmtainer:data.uom_conmtainer,
        //     note:data.note
        //     },{where:{id:idSpawn}})
        // .then(result=>{
        //     res.status(200).json({data:result})
        // })
        // .catch(err =>{
        //     res.status(522).json({message:err.errors[0].message}) 
        // })
                
    } else {
        res.status(522).json()
    }
})

router.delete('/deleteDestination',async  (req, res) => {
    let destinationId=req.query.id?req.query.id:false
    //console.log(destinationId)
    if (destinationId!=false){
        res.status(200).json({data:"ok"})
    } else {
            res.status(522).json()
        }
  });

router.get('/getOneDestination',async  (req, res) => {    
    let destinationId=req.query.id?req.query.id:false
    if (destinationId!=false){
        res.status(200).json()
    } else {
            res.status(522).json()
        }
});


router.post('/newDestination', async(req,res) => {
    let data=req.body
    console.log(data)
    
})



module.exports=router;
