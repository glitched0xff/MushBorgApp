/**
 * @file propagation.js
 * @description Route per la gestione elementi di coltivazione
 * @module routes/management/propagation
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const codeGenerator= require("../../module/codeGenerationElement")
const {createEvent,updateEvent,deleteEvent}=require("../../module/calendarEvent")
const dropDownGenerator= require("../../module/dropDownGenerator")
const generatePdfReport= require("../../module/generatePdfReport")
const db = require("../../models");
const { where,fn,col } = require('sequelize');
const Propagation = db.propagation
const Op = db.Sequelize.Op;
const QRCode = require('qrcode')
moment.utc();

/**
 * @route GET /inoculum
 * @group Propagation - Operazioni relative agli elementi di coltivazione
 * @summary Entry-point pagina gestione elementi coltivazione
 * @returns Render ejs template "management/propagation"
 */
router.get('/',async  (req, res) => {
    //let searchCode=req.query.code?req.query.code:false
    let redirectId=req.query.redirectId?req.query.redirectId:null
    let strainDD=await dropDownGenerator("strain")
    //let containerDD=await dropDownGenerator("container","CULTIVATION")
    let storagesDD=await dropDownGenerator("storage")
    let substrateDD=await dropDownGenerator("substrate","CULTIVATION")
    let pickReasonDD=await db.dDOption.findAll({where:{ddMenu:"pickReason"}})
    let statoPropDD=await db.dDOption.findAll({where:{ddMenu:"statoProp"}})
    let spawnDD=await dropDownGenerator("spawn")
    let supplierDD=await dropDownGenerator("supplier")
    let container=await db.container.findAll({where:{
                                    [Op.or]: [
                                        { destination: "CULTIVATION" },
                                        { destination: "ALL" }
                                    ]},order:[["ID","ASC"]]})
    let containerDD=[]
    container.forEach(elem => {
        containerDD.push({val:elem.id+"|"+elem.capacity+"|"+elem.uom,txt:elem.code_container+" - "+elem.container_name})
    });

    res.render("management/propagation",{spawnDD:spawnDD,
                                            strainDD:strainDD,
                                            substrateDD:substrateDD,
                                            containerDD:containerDD,
                                            pickReasonDD:pickReasonDD,
                                            statoPropDD:statoPropDD,
                                            storagesDD:storagesDD,
                                            supplierDD:supplierDD,
                                        redirectId:redirectId})
  });

  /**
 * @route GET /propagation/getAll
 * @group Propagation - Operazioni relative agli elementi di coltivazione
 * @summary Restituisce la lista degli inoculi
 * @returns 200 - Lista inoculi con join dei dati collegati
 */
router.get('/getAll',async  (req, res) => {
let propagations=await Propagation.findAll({
    include: [
        {model:db.strain,attributes:["species","species_code","strain_name"]},
        {model: db.container,attributes:["container_name"]},
        {model: db.substrate},
            { model: db.mushElement, 
              include: [{model:db.storage},
                        {model:db.mushElementHarvest}],
                attributes:["id","element_code"]},
    ]})

    propagations=JSON.parse(JSON.stringify(propagations))
    
    for (const propagation of propagations) {
    const mushElements = propagation.mushElement || [];
    propagation.totHarvest = mushElements
        .flatMap(mu => (mu.mushElementHarvests || []))
        .reduce((sum, h) => sum + (h.harvest_weight || 0), 0);
    }
    res.status(200).json({propagations:propagations})
});

/**
 * @route POST /propagation/newPropagation
 * @group Propagation - Operazioni relative agli elementi di coltivazione
 * @summary Inserimento nuovo inoculo
 * @param {string}inoculum_name 

 * @returns 200 - Conferma inserimento con dati del nuovo elemento di coltivazione
 * @returns 400 - Errore per codice duplicato 
 */
router.post('/newPropagation', async(req,res) => {
    let data=req.body
    console.log(data)
    let species_code=data.strainId.split("|")[1]
        let strainSubcode=data.strainId.split("|")[2]
        let recipeSubCode=data.substrateId.split("|")[1]
        let type="C"
        let nrContiner=0
        let duplicateCodeIndex=0
        let codeGen=await codeGenerator(data.createLot,species_code,strainSubcode,recipeSubCode,type,nrContiner,duplicateCodeIndex)
        let code_propagation=codeGen.element_code
        duplicateCodeIndex=codeGen.duplicateCodeIndex
    
        await Propagation.create({
            code_propagation:code_propagation,
            propagation_name:data.propagation_name,
            strainId: data.strainId.split("|")[0],
            containerId: data.containerId.split("|")[0],
            n_container: data.n_container,
            substrateId:data.substrateId.split("|")[0],
            strainPerc:data.strainPerc?data.strainPerc:0,
            strainWeight:data.strainWeight?data.strainWeight:0,
            supplierId:data.supplierId?data.supplierId:null,
            qt:data.qt,
            exp_date:data.exp_date?moment(data.exp_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
            expected_maturation_date:data.expected_maturation_date?moment(data.expected_maturation_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
            expected_fructification_date:data.expected_fructification_date?moment(data.expected_fructification_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null, 
            purchased_date: data.purchased_date?moment(data.purchased_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
            storageId: data.storageId,
            purchased: data.purchased?data.purchased:0,
            substrateQt:data.substrateQt?data.substrateQt:0,
            createLot:moment(data.createLot,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
            note:data.note,
            })
        .then(async (result)=>{
            //console.log(JSON.parse(JSON.stringify(result)))

            /** Seeds */
            if (result.purchased==0)
            {
                let tempArray=[]
                if(!Array.isArray(data.inoculumElementId)){
                                data.inoculumElementId=[data.inoculumElementId]
                                let dataSeed=data.inoculumElementId[0].split("|")
                                tempArray.push(dataSeed)
                            }
                else{
                    for (let i = 0; i < data.inoculumElementId.length; i++) {
                        const elem = data.inoculumElementId[i];
                        tempArray.push(elem.split("|"))
                    }
                }
                data.inoculumElementId=tempArray

                for (let i = 0; i < data.inoculumElementId.length; i++) {
                    let elem=data.inoculumElementId[i]
                    await db.seed.create({  relatedId:result.id,
                                            mushElementId:elem[1],
                                            mushElementCode:elem[0],
                                            perc:elem[2],
                                            typeDestination:"CULTIVATION",
                                        })
                    if (parseFloat(elem[3])==0){
                        await db.mushElement.update({pick_reason:7,pick_date:moment(), active:0,stato:"Usato come seed" ,perc:elem[3]},{where:{element_code:elem[0]}})
                    }else{
                        await db.mushElement.update({perc:elem[3]},{where:{element_code:elem[0]}})
                    }
                }
            }
             nrContiner=parseInt(data.n_container)
             /** Create element */
            for (let i = 0; i < nrContiner; i++) {
                let codeLotto= result.code_propagation.slice(0,-2)
                //let codeGen=await codeGenerator(data.createLot,species_code,strainSubcode,recipeSubCode,type,nrContiner,duplicateCodeIndex,i)
                let seriale=0
                if (i<=9){
                    seriale="0"+i
                }else{
                    seriale=i
                }
                //let element_code=codeGen.element_code
                let element_code=codeLotto+seriale
                await db.mushElement.create({
                    element_code:element_code,
                    relatedId:result.id,
                    stato:"Buono",
                    qt:nrContiner,
                    storageId:result.storageId,
                    stage:1,
                    load_date:moment(),
                    expected_maturation_date:moment(data.expected_maturation_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
                    expected_fructification_date:moment(data.expected_fructification_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
                    createLot:moment(data.createLot,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
                    type:"CULTIVATION"
                })
                .then(async result=>{
                    /** Create event */
                    await createEvent(result,"Mat. ","Maturazione elemento COLTIVAZIONE","CULTIVATION",data.expected_maturation_date,4)
                    await createEvent(result,"Frut. ","Fruttificazione elemento COLTIVAZIONE","CULTIVATION",data.expected_fructification_date,3)
                })
                .catch(err=>{
                    console.log(err)
                })  
            }
            /** Create diary */
            await db.diaryNote.create({nota:`Creato lotto di coltivazione ${result.code_propagation} con n° ${data.n_container} elementi di coltivazione`,tag:"",area:""})   
            res.status(200).json({data:result})
            })
        .catch(err=>{
            console.log(err)
            res.statusMessage = err;
            res.status(422).send(err.message) 
        })  
})

router.get('/getSpawnElementRelId',async (req,res)=>{
    let relatedId=req.query.relatedId?req.query.relatedId:false
        if (relatedId!=false){
            await db.mushElement.findAll({where:{relatedId:relatedId,type:"SPAWN"}})
            .then(result=>{
                res.status(200).json({data:result})
            })
            .catch(err =>{
                console.log(err)
                res.status(522).json() 
            })

        } else {
            res.status(522).json()
        }
})

router.put('/updatePropagation', async(req,res) => {
    let idPropagation=req.body.id?req.body.id:false
    let data=req.body
    //console.log(req.body)
    if (idPropagation!=false){
        await Propagation.update({
            code_propagation:data.code_propagation,
            propagation_name:data.propagation_name,
            containerId:data.containerId,
            nr_container:data.nr_container,
            spawnId:data.spawnId,
            substrateId:data.substrateId,
            note:data.note,
            },{where:{id:idPropagation}})
        .then(async (result)=>{
            res.status(200).json({data:result})
        })
        .catch(err =>{
            res.status(522).json({message:err.errors[0].message}) 
        })
                
    } else {
        res.status(522).json()
    }
})

router.get('/getOnePropagation',async  (req, res) => {
    let propagationsId=req.query.id?req.query.id:false
    if (propagationsId!=false){
        let propagation=await Propagation.findOne({where:{id:propagationsId},
                                                    include: [
                                                    {model:db.strain,attributes:["species","species_code","strain_name"]},
                                                    { model: db.container,attributes:["code_container","container_name","capacity","uom","type"]},
                                                    //{ model: db.mushElement, include: [{model:db.storage},{model:db.mushElementHarvest},{model:db.mushElementNote}] },
                                                    {model: db.substrate,attributes:["name_substrate","cod_substrate"]},
                                                    {model:db.storage},
                                                    {model:db.supplier},
                                                    {
                                                    model: db.mushElement,
                                                    where: {type:"CULTIVATION"},
                                                    include: [
                                                        { model: db.storage },
                                                        { model: db.mushElementHarvest,attributes:["harvest_weight"] },
                                                        { model: db.mushElementNote, attributes:["id"] }]                                                    
                                                    }]   
                                                    }
                                                )
        //console.log(propagation)
                let storage= await db.storage.findOne({where:{id:propagation.storageId}})
                  let seeds=await db.seed.findAll({where:{relatedId:propagation.id,typeDestination:"CULTIVATION"}})
        
        res.status(200).json({propagation:propagation,storage:storage,seeds:seeds})
    } else {
            res.status(522).json()
        }
  });

router.delete('/deletePropagation',async  (req, res) => {
    let propagationId=req.query.id?req.query.id:false
    if (propagationId!=false){
        let seeds=await db.seed.findOne({where:{relatedId:propagationId}})
                //console.log(seeds)
        
                if ((seeds!=null)&&(seeds.length>0)){
                    for (let i = 0; i  < seeds.length; i++) {
                        const elem = seeds[i];
                        await db.mushElement.update({pick_reason:null,pick_date:null},{where:{id:elem.propagationId,type:"CULTIVATION"}})
                    }
                }
               let mushElement=await db.mushElement.findAll({where:{relatedId:propagationId,type:"CULTIVATION"}})
                       mushElement.forEach(async e => {
                           await deleteEvent(e.id)
                       });
                await db.seed.destroy({ where: { relatedId: propagationId } });
                await db.mushElement.destroy({ where: { relatedId: propagationId,type:"CULTIVATION" } });
                await Propagation.destroy({ where: { id: propagationId } });
        
                res.status(200).json({data:"ok"})
    } else {
            res.status(522).json()
        }
  });

router.get('/getPropagationCode',async  (req, res) => {
      let lastElement=await Propagation.findOne({
          order: [ [ 'id', 'DESC' ]],
          });
      let code="PROP"
      let date=moment().format("YYMM")
      let idStr
      if (lastElement==null){
        idStr=0
      }else{
        idStr=lastElement.id.toString()
      }
      if (idStr.length==1){idStr="00"+idStr}
      if (idStr.length==2){idStr="0"+idStr}
      if (idStr.length==3){idStr=""+idStr}
      code=code+date+idStr+"00"
      res.status(200).json({code:code})
    });

router.get('/getQrElement',async  (req, res) => {
    let elementId=req.query.id
    let element=await db.mushElement.findOne({where:{id:elementId,type:"CULTIVATION"}})
    //console.log(JSON.parse(JSON.stringify(element)))
    QRCode.toDataURL(JSON.stringify(element), function (err, url) {
       // console.log(url)
        res.status(200).json({qrCode:url})
      })
    
});

/**
 * @route GET /propagation/pdf
 * @group Propagation - Operazioni relative agli elementi propagation
 * @summary Esporta scheda in PDF dell'elemento con le informazioni relative
 * @param {string} idPropagation Id da ricercare
 * @param {bool} getHtml Può avere valore true - false e renderizza il form in html
 * @returns 200 - File pdf/html
 */
router.get('/pdf',async (req,res)=>{        
    let propagationId=req.query.idPropagation?req.query.idPropagation:false
    let getHtml=req.query.getHtml?req.query.getHtml:false
    console.log(propagationId)
    if (propagationId!=false){
        let propagation=await Propagation.findOne({where:{id:propagationId},
                                                    include: [
                                                    {model:db.strain,attributes:["species","species_code","strain_name"]},
                                                    { model: db.container,attributes:["code_container","container_name","capacity","uom","type"]},
                                                    //{ model: db.mushElement, include: [{model:db.storage},{model:db.mushElementHarvest},{model:db.mushElementNote}] },
                                                    {model: db.substrate,attributes:["name_substrate","cod_substrate"]},
                                                    {model:db.storage},
                                                    {
                                                    model: db.mushElement,
                                                    where: {type:"CULTIVATION"},
                                                    include: [
                                                        { model: db.storage },
                                                        { model: db.mushElementHarvest,attributes:["harvest_weight"] },
                                                        { model: db.mushElementNote, attributes:["id"] }]                                                    
                                                    }]   
                                                    }
                                                )

        propagation=JSON.parse(JSON.stringify(propagation))
        console.log(propagation)
        for (let i = 0; i  < propagation.mushElements.length; i++) {
            const element = propagation.mushElements[i];
            if (Array.isArray(element.mushElementHarvests)){
                let totHarvest=0
                for (let i = 0; i < element.mushElementHarvests.length; i++) {
                    const el = element.mushElementHarvests[i];
                    totHarvest+=el.harvest_weight 
                }
                propagation.mushElements[i].totHarvest=totHarvest
            }
        }
        propagation.updatedAt=propagation.updatedAt?moment(propagation.updatedAt).format("DD-MM-YY"):""
        propagation.exp_date=propagation.exp_date?moment(propagation.exp_date).format("DD-MM-YY"):""
        propagation.purchased_date=propagation.purchased_date?moment(propagation.purchased_date).format("DD-MM-YY"):""
        propagation.expected_maturation_date=propagation.expected_maturation_date?moment(propagation.expected_maturation_date).format("DD-MM-YY"):""
        propagation.createLot=moment(propagation.createLot).format("DD-MM-YY")
        let storage= await db.storage.findOne({where:{id:propagation.storageId}})
        storage=JSON.parse(JSON.stringify(storage))
        propagation.purchased=propagation.purchased==1?"Sì":"No"
        
        let seeds=await db.seed.findAll({where:{relatedId:propagation.id,typeDestination:"CULTIVATION"}})
        console.log(JSON.parse(JSON.stringify(propagation)))
        try {
            const pdf=await generatePdfReport({propagation:propagation,seeds:JSON.parse(JSON.stringify(seeds))},"propagationReport.ejs")
            if (getHtml==false){
                res.setHeader("Content-Type", "application/pdf");
                res.setHeader("Content-Disposition", "inline; filename=report_"+propagation.code_propagation+".pdf");
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

module.exports=router;
