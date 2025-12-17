/**
 * @file inoculum.js
 * @description Route per la gestione elementi Inoculum
 * @module routes/management/inoculum
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../../models");
const codeGenerator= require("../../module/codeGenerationElement")
const dropDownGenerator= require("../../module/dropDownGenerator")
const generatePdfReport= require("../../module/generatePdfReport")

const {createEvent,updateEvent,deleteEvent}=require("../../module/calendarEvent")
const { Op, literal, fn, col, where } = require("sequelize");
const Inoculum = db.inoculum;
const MushElement = db.mushElement;

Inoculum.associate(db)

/**
 * @route GET /inoculum
 * @group Inoculum - Operazioni relative agli elementi inoculum
 * @summary Entry-point pagina gestione inoculi
 * @returns Render ejs template "management/inoculum"
 */
router.get('/',async  (req, res) => {
    let redirectId=req.query.redirectId?req.query.redirectId:null
    let strainDD=await dropDownGenerator("strain")
    let containerDD=await dropDownGenerator("container","INOCULUM")
    //console.log(containerDD)
    let storagesDD=await dropDownGenerator("storage")
    let substrateDD=await dropDownGenerator("substrate","INOCULUM")
    //console.log(substrateDD)
    let sampleTypeDD=await dropDownGenerator("dropDown","sampleType")
    // Inoculi degli inoculi
    let inoculums=await db.inoculum.findAll({include:{model:db.mushElement, where:{type:"INOCULUM"}}})
    let inoculumDD=[]
    let supplierDD=await dropDownGenerator("supplier")
    //console.log(JSON.parse(JSON.stringify(inoculums)))
    
    inoculums.forEach(elem => {
        if (elem.mushElements.length>0){
            inoculumDD.push({val:elem.id,txt:elem.code_inoculum+" - "+ elem.inoculum_name})
        }
    });
    res.render("management/inoculum",{containerDD:containerDD,
                                      strainDD:strainDD,
                                      redirectId:redirectId,
                                      storagesDD:storagesDD,
                                      substrateDD:substrateDD,
                                      sampleTypeDD:sampleTypeDD,
                                      supplierDD:supplierDD,
                                        inoculumDD:inoculumDD})
  });

/**
 * @route GET /inoculum/getAll
 * @group Inoculum - Operazioni relative agli elementi inoculum
 * @summary Restituisce la lista degli inoculi
 * @returns 200 - Lista inoculi con join dei dati collegati
 */
router.get('/getAll',async  (req, res) => {
    // Togliererif inoculo
    let inoculum=await Inoculum.findAll({include:[{model: db.strain},
                                                    {model: db.container, attributes: ['container_name']},
                                                    {model: db.substrate, attributes: ['id','name_substrate']},
                                                  ]})   
    res.status(200).json({inoculum:inoculum})
});

 
/**
 * @route POST /inoculum/newInoculum
 * @group Inoculum - Operazioni relative agli elementi inoculum
 * @summary Inserimento nuovo inoculo
 * @param {string}inoculum_name 
 * @param {number}strainId
 * @param {number}containerId
 * @param {number}n_container
 * @param {number}substrateId
 * @param {string}cultivation_media
 * @param {string}exp_date
 * @param {string}expected_maturation_date
 * @param {number}storageId
 * @param {number}purchased
 * @param {number}fromSample
 * @param {number}sampleType
 * @param {string}note
 * @returns 200 - Conferma inserimento con dati del nuovo inoculo inserito 
 * @returns 400 - Errore per codice duplicato 
 */
router.post('/newInoculum', async(req,res) => {
    let data=req.body
    console.log(req.body)
    let species_code=data.strainId.split("|")[1]
    let strainSubcode=data.strainId.split("|")[2]
    let recipeSubCode=data.substrateId.split("|")[1]
    let type="I"
    let nrContiner=0
    let duplicateCodeIndex=0
    
    let codeGen=await codeGenerator(data.createLot,species_code,strainSubcode,recipeSubCode,type,nrContiner,duplicateCodeIndex)
    let code_inoculum=codeGen.element_code
    duplicateCodeIndex=codeGen.duplicateCodeIndex
    
    await Inoculum.create({    
        code_inoculum: code_inoculum,
        inoculum_name: data.inoculum_name,
        strainId: data.strainId.split("|")[0],
        containerId: data.containerId,
        n_container: data.n_container,
        substrateId: data.substrateId.split("|")[0],
        supplierId:data.supplierId?data.supplierId:null,
        cultivation_media: data.cultivation_media,
        exp_date: data.expected_maturation_date?moment(data.exp_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
        expected_maturation_date:data.expected_maturation_date?moment(data.expected_maturation_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
        storageId: data.storageId,
        purchased: data.purchased,
        purchased_date: data.purchased_date?moment(data.purchased_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
        fromSample: data.fromSample,
        sampleType: data.sampleType,
        createLot:moment(data.createLot,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
        note: data.note
    })
    .then(async result=>{
            // Inserimento dei seeds se l'elemento non è acquistato
            if ((result.purchased==0)&&(result.fromSample==0))
            {
                // Split array
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
                //console.log("---")
                //console.log(data.inoculumElementId)
                
                for (let i = 0; i < data.inoculumElementId.length; i++) {
                    let elem=data.inoculumElementId[i]
                    
                    await db.seed.create({
                                relatedId:result.id,
                                mushElementId:elem[1],
                                mushElementCode:elem[0],
                                perc:elem[2],
                                typeDestination:"INOCULUM",
                            })
                    if (parseFloat(elem[3])==0){
                        await db.mushElement.update({pick_reason:7,pick_date:moment(),stato:"Usato come seed", active:0 ,perc:elem[3]},{where:{element_code:elem[0]}})
                    }else{
                        await db.mushElement.update({perc:elem[3]},{where:{element_code:elem[0]}})
                    }
                }
            }
            let nrContiner=parseInt(data.n_container)
            //console.log(nrContiner)
            for (let i = 0; i < nrContiner; i++) {
                let codeGen=await codeGenerator(data.createLot,species_code,strainSubcode,recipeSubCode,type,nrContiner,duplicateCodeIndex,i)
                let element_code=codeGen.element_code
                await db.mushElement.create({
                    element_code:element_code,
                    relatedId:result.id,
                    stato:"Buono",
                    qt:nrContiner,
                    load_date:moment(),
                    storageId:data.storageId,
                    purchased:data.purchased,
                    expected_maturation_date:data.expected_maturation_date?moment(data.expected_maturation_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):NULL,
                    createLot:moment(data.createLot,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
                    type:"INOCULUM"
                })
                .then(async result=>{
                    await createEvent(result,"Maturazione","Maturazione elemento ","INOCULUM",data.expected_maturation_date,4)
                })
                .catch(err=>{
                    console.log(err)
                })  
            }
            await db.diaryNote.create({nota:`Creato lotto di inoculo ${result.code_inoculum} con n° ${data.n_container} elementi di inoculo`,tag:"",area:""})  
            res.status(200).json({data:result})
        })
    .catch(err =>{
        console.log(err)
        res.statusMessage = err;
        res.status(422).send(err.message)
    })
})

router.put('/updateInoculum', async(req,res) => {
    let idInoculum=req.body.id?req.body.id:false
    let data=req.body
    if ((inoculum_name!=false)&&(idInoculum!=false)){
        await Inoculum.update({
            strainId:data.strainId,
            qt:data.qt,
            container:data.container,
            nr_container:data.nr_container,
            qt_container:data.qt_container,
            uom_conmtainer:data.uom_conmtainer,
            expected_maturation_date:moment(data.expected_maturation_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
            used:data.used,
            note:data.note
            },{where:{id:idInoculum}})
        .then(result=>{
            res.status(200).json({data:result})
            db.mushElement.update({dexpected_maturation_date:ata.expected_maturation_date},{where:{relatedId:idInoculum}})
            let mushElement= db.mushElement.findAll({where:{relatedId:result.id}})

        })
        .catch(err =>{
            res.status(522).json({message:err.errors[0].message}) 
        })
                
    } else {
        res.status(522).json()
    }
})

/**
 * @route DELETE /inoculum/deleteInoculum
 * @group Inoculum - Operazioni relative agli elementi inoculum
 * @summary Eliminazione lotto di inoculo
 * @param {string}inoculumId Id del lotto di inoculo da cancellare
 * @param {string}forceDelete Flag di forzatura che può essere "true" o "false"
 * @returns 200 - Conferma eliminazione lotto di inoculo
 * @returns 422 - Richiesta non processabile perchè numero elementi > 0
 */
router.delete('/deleteInoculum',async  (req, res) => {
    let {inoculumId,forceDelete}=req.query
   // console.log(inoculumId,forceDelete)
    let inoculumCount=await MushElement.count({where:{relatedId:inoculumId, type:"INOCULUM"}})
    if (inoculumCount==0){
         result= await db.seed.destroy({where:{relatedId:inoculumId, typeDestination:"INOCULUM"}})
        result=await Inoculum.destroy({where:{id:inoculumId}})
        res.status(200).json({result:result})
    }
    else if ((inoculumCount>0)&&(forceDelete=="true")){
        let mushElement=await MushElement.findAll({where:{relatedId:inoculumId,type:"INOCULUM"}})
        mushElement.forEach(async e => {
            await deleteEvent(e.id)
        });
        let result=await MushElement.destroy({where:{relatedId:inoculumId, type:"INOCULUM"}})
        result= await db.seed.destroy({where:{relatedId:inoculumId, typeDestination:"INOCULUM"}})
        result=await Inoculum.destroy({where:{id:inoculumId}})
        res.status(200).json({result:result})
    }
    else {
        res.status(422).json({message:"Elemento utilizzato"})
    }
   
  });

/**
 * @route /inoculum/getOneInoculum?id=
 * @group Inoculum - Operazioni relative agli elementi inoculum
 * @param  {String} id dell'utente
 * @summary Restituisce un lotto di inoculo per id
 * @returns 200 - Inoculo trovato
 * @returns {Error} 404 - Lotto non trovato
 */
router.get('/getOneInoculum',async  (req, res) => {    
          //console.log(req.query)
    let inoculumId=req.query.id?req.query.id:false
    if (inoculumId!=false){
        let inoculum=await Inoculum.findOne({
            where:{id:inoculumId},
            include: [
            {model: db.strain, attributes: ['strain_name','species','code_strain','species_code','strain_name']},
             {model: db.container, attributes: ['container_name']},
             {model: db.substrate, attributes: ['id','name_substrate']},
             {model: db.storage, attributes: ['name_storage','code_storage']},
             {model: db.supplier, attributes: ['supplier_name']},
            {
                model:db.mushElement,
                where:{type:"INOCULUM"},
                include:[{model:db.storage,attribute:["id","code_storage","storage_name"]},
                            {model:db.mushElementNote,attributes:["id"]} ]}
          ]})
         //console.log(JSON.parse(JSON.stringify(inoculum)))
          let seeds=await db.seed.findAll({where:{relatedId:inoculum.id,typeDestination:"INOCULUM"}})
        res.status(200).json({inoculum:inoculum,seeds:seeds})
    } else {
            res.status(404).json()
        }
});

/**
 * @route GET /inoculum/liveSearch
 * @group Inoculum - Operazioni relative agli elementi inoculum
 * @summary Ricerca rapida per elementi di seeding
 * @param {string} str Stringa da ricercare
 * @returns 200 - Elenco primi 50 risultati
 */
router.get('/liveSearch',async (req,res)=>{
    let str=req.query.str
    let list=await db.mushElement.findAll({where:{element_code:{[Op.like]:str+"%"},active:1},
                                            limit:50,
                                        order:[["element_code","DESC"],["type","DESC"]]})
    res.status(200).json({list:list})
})

/**
 * @route GET /inoculum/pdf
 * @group Inoculum - Operazioni relative agli elementi inoculum
 * @summary Esporta scheda in PDF dell'elemento con le informazioni relative
 * @param {string} idInoculum Id da ricercare
 * @param {bool} getHtml Può avere valore true - false e renderizza il form in html
 * @returns 200 - File pdf/html
 */
router.get('/pdf',async (req,res)=>{        
    let inoculumId=req.query.idInoculum?req.query.idInoculum:false
    let getHtml=req.query.getHtml?req.query.getHtml:false
    if (inoculumId!=false){
          let inoculum=await Inoculum.findOne({
            where:{id:inoculumId},
            include: [
            {model: db.strain, attributes: ['strain_name','species','code_strain','species_code','strain_name']},
             {model: db.container, attributes: ['container_name']},
             {model: db.substrate, attributes: ['id','name_substrate']},
             {model: db.storage, attributes: ['name_storage','code_storage']},
             {model: db.supplier, attributes: ['supplier_name']},

            {
                model:db.mushElement,
                where:{type:"INOCULUM"},
                include:[{model:db.storage,attribute:["id","code_storage","storage_name"]},
                            {model:db.mushElementNote,attributes:["id"]} ]}
          ]})
         //console.log(JSON.parse(JSON.stringify(inoculum)))
          let seeds=await db.seed.findAll({where:{relatedId:inoculum.id,typeDestination:"INOCULUM"}})
        let sampleTypeDD=await dropDownGenerator("dropDown","sampleType")
        inoculum=JSON.parse(JSON.stringify(inoculum))
        inoculum.buyed=inoculum.buyed?moment(inoculum.buyed).format("DD-MM-YY"):""
        inoculum.updatedAt=moment(inoculum.updatedAt).format("DD-MM-YY HH:MM")
        inoculum.exp_date=inoculum.exp_date?moment(inoculum.exp_date).format("DD-MM-YY"):""
        inoculum.purchased_date=inoculum.purchased_date?moment(inoculum.purchased_date).format("DD-MM-YY"):""
        inoculum.expected_maturation_date=inoculum.expected_maturation_date?moment(inoculum.expected_maturation_date).format("DD-MM-YY"):""
        inoculum.createLot=inoculum.createLot?moment(inoculum.expected_maturation_date).format("DD-MM-YY"):""

        inoculum.purchased=inoculum.purchased==1?"Sì":"No"
        inoculum.fromSample=inoculum.fromSample===1?"Sì":"No"
        let stElem=sampleTypeDD.find(e=>{return e.val==inoculum.sampleType})
        console.log(stElem)
        inoculum.sampleType=stElem?stElem.txt:"-"
        try {
            const pdf=await generatePdfReport({inoculum:inoculum,seeds:JSON.parse(JSON.stringify(seeds))},"inoculumReport.ejs")
            if (getHtml==false){
                res.setHeader("Content-Type", "application/pdf");
                res.setHeader("Content-Disposition", "inline; filename=report_"+inoculum.code_inoculum+".pdf");
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
