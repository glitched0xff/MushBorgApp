/**
 * @module Spawn
 * @description Questo modulo gestisce tutte le route relative elementi Spawn
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const codeGenerator= require("../../module/codeGenerationElement")
const dropDownGenerator= require("../../module/dropDownGenerator")
const generatePdfReport= require("../../module/generatePdfReport")
const {createEvent,updateEvent,deleteEvent}=require("../../module/calendarEvent")
const db = require("../../models");
const { where,fn,op } = require('sequelize');
const Strain = db.strain;
const Spawn = db.spawn;
const Substrate=db.substrate
const Storages=db.storage
const MushElement=db.mushElement
const Seed=db.seed
const Op = db.Sequelize.Op;

/**
 * @name GET /spawn/
 * @function
 * @memberof module:Spawn
 * @description Home page con la generazione dell'interfaccia
 * @returns  Restituisce il file views/management/spawn.ejs renderizzato
 */
router.get('/',async  (req, res) => {
    let redirectId=req.query.redirectId?req.query.redirectId:null
        let strainDD=await dropDownGenerator("strain")
        //let containerDD=await dropDownGenerator("container","SPAWN")
        let storagesDD=await dropDownGenerator("storage")
        let substrateDD=await dropDownGenerator("substrate","SPAWN")
        let supplierDD=await dropDownGenerator("supplier")
        let inoculums=await db.inoculum.findAll()
        let container=await db.container.findAll({where:{
                                    [Op.or]: [
                                        { destination: "SPAWN" },
                                        { destination: "ALL" }
                                    ]},order:[["ID","ASC"]]})
        let containerDD=[]
        container.forEach(elem => {
            containerDD.push({val:elem.id+"|"+elem.capacity+"|"+elem.uom,txt:elem.code_container+" - "+elem.container_name})
        });
        let inoculumDD=[]
        inoculums.forEach(elem => {
            inoculumDD.push({val:elem.id,txt:elem.code_inoculum+" - "+ elem.inoculum_name})
        });
        res.render("management/spawn",{containerDD:containerDD,
                                          strainDD:strainDD,
                                          redirectId:redirectId,
                                          storagesDD:storagesDD,
                                          substrateDD:substrateDD,
                                          supplierDD:supplierDD,
                                        inoculumDD:inoculumDD})

  });

/**
 * @name GET /spawn/getAll
 * @function
 * @memberof module:Spawn
 * @description Restituisce la lista degli spawn
 * @returns 200 - Lista inoculi con join dei dati collegati
 */
router.get('/getAll',async  (req, res) => {
    let spawns=await Spawn.findAll({include:[
                                    {model: db.strain},
                                    {model: db.container, attributes: ['container_name']},
                                    {model: db.substrate, attributes: ['id','name_substrate']},
                                    
                                    ]})   
    res.status(200).json({spawns:spawns})
});

router.get('/getInoculumElementRelId',async (req,res)=>{
    let relatedId=req.query.relatedId?req.query.relatedId:false
    //console.log(relatedId)
        if (relatedId!=false){
            await MushElement.findAll({where:{relatedId:relatedId,type:"INOCULUM"}})
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

router.put('/updateSpawn', async(req,res) => {
    let idSpawn=req.body.id?req.body.id:false
    let data=req.body
    if ((spawn_name!=false)&&(idSpawn!=false)){
        await Spawn.update({
            strainId:data.strainId,
            qt:data.qt,
            container:data.container,
            nr_container:data.nr_container,
            qt_container:data.qt_container,
            uom_conmtainer:data.uom_conmtainer,
            note:data.note
            },{where:{id:idSpawn}})
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

router.delete('/deleteSpawn',async  (req, res) => {
    let spawnId=req.query.id?req.query.id:false
    //console.log(spawnId)
    if (spawnId!=false){
        // let spawn=await Spawn.findOne({where:{id:spawnId}})
        // let result=await SpawnElement.destroy({where:{spawnId:spawnId}})
        //result=await Spawn.destroy({where:{id:spawnId}})
        let seeds=await Seed.findOne({where:{relatedId:spawnId}})
        //console.log(seeds)

        if ((seeds!=null)&&(seeds.length>0)){
            for (let i = 0; i  < seeds.length; i++) {
                const elem = seeds[i];
                await MushElement.update({pick_reason:null,pick_date:null},{where:{id:elem.spawnId,type:"SPAWN"}})
            }
        }
       let mushElement=await MushElement.findAll({where:{relatedId:spawnId,type:"SPAWN"}})
        mushElement.forEach(async e => {
            await deleteEvent(e.id)
        });
        await Seed.destroy({ where: { relatedId: spawnId } });
        await MushElement.destroy({ where: { relatedId: spawnId,type:"SPAWN" } });
        await Spawn.destroy({ where: { id: spawnId } });
        res.status(200).json({data:"ok"})
        
    } else {
            res.status(522).json()
        }
  });

router.get('/getOneSpawn',async  (req, res) => {    
    let spawnId=req.query.id?req.query.id:false
    if (spawnId!=false){
            let spawn=await Spawn.findOne({where:{id:spawnId},include: [
                //{model: db.spawnElement},
                {model: db.strain, attributes: ['strain_name','species','species_code','strain_name']},
                {model: db.container, attributes: ['container_name','uom']},
                {model: db.storage, attributes: ['name_storage','code_storage']},
                {model: db.supplier, attributes: ['supplier_name']},
                {model: db.substrate},
                {
                    model:db.mushElement,
                    where:{type:"SPAWN"},
                    include:[{model:db.storage,attribute:["id","code_storage","storage_name"]},
                             {model:db.mushElementNote,attributes:["id"]} ]},
            ]})
        let storage= await Storages.findOne({where:{id:spawn.storageId}})
                  let seeds=await db.seed.findAll({where:{relatedId:spawn.id,typeDestination:"SPAWN"}})
        
       //   let mushElement= await MushElement.findAll({where:{relatedId:spawnId}})
        res.status(200).json({spawn:spawn,storage:storage,seeds:seeds})
    } else {
            res.status(522).json()
        }
});


router.get('/getSpawnCode',async  (req, res) => {
    let month=["A","B","C","D","E","F","G","H","I","L","M","N"]
    let species_code=req.query.species_code?req.query.species_code:false
    if (species_code!=false){
        let subCode=req.query.subCode
        let type="S" // S=spawn C=Coltivo
        let lastSpawn=await Spawn.findOne({
            order: [ [ 'id', 'DESC' ]],
            });
       // console.log(lastSpawn.id)
        let date=moment().format("YY")+month[moment().month()]+moment().format("DD")
        let idStr=lastSpawn.id.toString()
        if (idStr.length==1){idStr="00"+idStr}
        if (idStr.length==2){idStr="0"+idStr}
        if (idStr.length==3){idStr=""+idStr}
        spawnCode="SP"+date+species_code+type+idStr
        res.status(200).json({spawnCode:spawnCode})
    } else {
        res.status(422).json("Please select or insert the species for generate spawn code")
    }
});

router.post('/newSpawn', async(req,res) => {
    let data=req.body
    //console.log(data)
    let species_code=data.strainId.split("|")[1]
    let strainSubcode=data.strainId.split("|")[2]
    let recipeSubCode=data.substrateId.split("|")[1]
    let type="S"
    let nrContiner=0
    let duplicateCodeIndex=0
    let codeGen=await codeGenerator(data.createLot,species_code,strainSubcode,recipeSubCode,type,nrContiner,duplicateCodeIndex)
    let code_spawn=codeGen.element_code
    duplicateCodeIndex=codeGen.duplicateCodeIndex
    
         await Spawn.create({    
            code_spawn: code_spawn,
            spawn_name: data.spawn_name,
            strainId: data.strainId.split("|")[0],
            containerId: data.containerId.split("|")[0],
            n_container: data.n_container,
            substrateId:data.substrateId.split("|")[0],
            strainPerc:data.strainPerc?data.strainPerc:0,
            strainWeight:data.strainWeight?data.strainWeight:0,
            supplierId:data.supplierId?data.supplierId:null,
            qt:data.qt,
            exp_date: data.expected_maturation_date?moment(data.exp_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
            expected_maturation_date:data.expected_maturation_date?moment(data.expected_maturation_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
            purchased_date: data.purchased_date?moment(data.purchased_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"):null,
            storageId: data.storageId,
            purchased: data.purchased?data.purchased:0,
            substrateQt:data.substrateQt?data.substrateQt:0,
            createLot:moment(data.createLot,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
            note: data.note
        })
        .then(async result=>{
            //console.log(JSON.stringify(result))
                // Inserimento dei seeds se l'elemento non è acquistato
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
                        await db.seed.create({
                                                relatedId:result.id,
                                                mushElementId:elem[1],
                                                mushElementCode:elem[0],
                                                perc:elem[2],
                                                typeDestination:"SPAWN",
                                            })
                        if (parseFloat(elem[3])==0){
                            await db.mushElement.update({pick_reason:7,pick_date:moment(), active:0 ,stato:"Usato come seed",perc:elem[3]},{where:{element_code:elem[0]}})
                        }else{
                            await db.mushElement.update({perc:elem[3]},{where:{element_code:elem[0]}})
                        }
                        }
                }
                
                nrContiner=parseInt(data.n_container)
                for (let i = 0; i < nrContiner; i++) {
                    //  let codeGen=await codeGenerator(data.createLot,species_code,strainSubcode,recipeSubCode,type,nrContiner,duplicateCodeIndex,i)
                    // let element_code=codeGen.element_code
                     let codeLotto= result.code_spawn.slice(0,-2)
                    let serial=0
                    if (i<=9){
                        serial="0"+i
                    }else{
                        serial=i
                    }
                    let element_code=codeLotto+serial
                    await db.mushElement.create({
                        element_code:element_code,
                        relatedId:result.id,
                        stato:"Buono",
                        qt:nrContiner,
                        load_date:moment(),
                        storageId:result.storageId,
                        expected_maturation_date:moment(data.expected_maturation_date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
                        createLot:moment(data.createLot,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
                        type:"SPAWN"
                    })
                    .then(async result=>{
                        await createEvent(result,"Mat. spawn","Maturazione elemento SPAWN","SPAWN",data.expected_maturation_date,4)
                    })
                    .catch(err=>{
                        console.log(err)
                    })  
                }
                await db.diaryNote.create({nota:`Creato lotto di coltivazione ${result.code_spawn} con n° ${data.n_container} elementi di spawn`,tag:"",area:""}) 
                res.status(200).json({data:result})
            })
        .catch(err =>{
            console.log(err)
            //res.status(422).json({message:err}) 
        })
})

/**
 * @route GET /spawn/liveSearch
 * @group Spawn - Operazioni relative agli elementi spawn
 * @summary Ricerca rapida per elementi di seeding
 * @param {string} str Stringa da ricercare
 * @returns 200 - Elenco primi 50 risultati
 */
router.get('/liveSearch',async (req,res)=>{
    let str=req.query.str
    let strainFilerterId=req.query.strainFilterId?req.query.strainFilterId:null
    // let whereSql={element_code:{[Op.like]:str+"%"},active:1,strainId:strainFilerterId}
    // if (strainFilerterId==null){
    //     whereSql={element_code:{[Op.like]:str+"%"},active:1}
    // }
    let list=await db.mushElement.findAll({where:{element_code:{[Op.like]:str+"%"},active:1},
                                            limit:50,
                                        order:[["element_code","DESC"],["type","DESC"]]})
    res.status(200).json({list:list})
})

/**
 * @route GET /spawn/pdf
 * @group Spawn - Operazioni relative agli elementi spawn
 * @summary Esporta scheda in PDF dell'elemento con le informazioni relative
 * @param {string} idSpawn Id da ricercare
 * @param {bool} getHtml Può avere valore true - false e renderizza il form in html
 * @returns 200 - File pdf/html
 */
router.get('/pdf',async (req,res)=>{        
    let spawnId=req.query.idSpawn?req.query.idSpawn:false
    let getHtml=req.query.getHtml?req.query.getHtml:false
    if (spawnId!=false){
          let spawn=await Spawn.findOne({where:{id:spawnId},include: [
                //{model: db.spawnElement},
                {model: db.strain, attributes: ['strain_name','species','species_code','strain_name']},
                {model: db.container, attributes: ['container_name']},
                {model: db.container, attributes: ['container_name']},
                {model: db.storage, attributes: ['name_storage','code_storage']},
                {model: db.substrate},             
                {model: db.supplier, attributes: ['supplier_name']},
                {
                    model:db.mushElement,
                    where:{type:"SPAWN"},
                    include:[{model:db.storage,attribute:["id","code_storage","storage_name"]},
                             {model:db.mushElementNote,attributes:["id"]} ]},
            ]})
        spawn=JSON.parse(JSON.stringify(spawn))
        spawn.buyed=spawn.buyed?moment(spawn.buyed).format("DD-MM-YY"):""
        spawn.updatedAt=moment(spawn.updatedAt).format("DD-MM-YY HH:MM")
        spawn.exp_date=spawn.exp_date?moment(spawn.exp_date).format("DD-MM-YY"):""
        spawn.purchased_date=spawn.purchased_date?moment(spawn.purchased_date).format("DD-MM-YY"):""
        spawn.expected_maturation_date=spawn.expected_maturation_date?moment(spawn.expected_maturation_date).format("DD-MM-YY"):""
        spawn.createLot=moment(spawn.createLot).format("DD-MM-YY")
        let storage= await Storages.findOne({where:{id:spawn.storageId}})
        storage=JSON.parse(JSON.stringify(storage))
        spawn.purchased=spawn.purchased==1?"Sì":"No"
        
        let seeds=await db.seed.findAll({where:{relatedId:spawn.id,typeDestination:"SPAWN"}})
        //console.log(JSON.parse(JSON.stringify(spawn)))
        try {
            const pdf=await generatePdfReport({spawn:spawn,seeds:JSON.parse(JSON.stringify(seeds))},"spawnReport.ejs")
            if (getHtml==false){
                res.setHeader("Content-Type", "application/pdf");
                res.setHeader("Content-Disposition", "inline; filename=report_"+spawn.code_spawn+".pdf");
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
