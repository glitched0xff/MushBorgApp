/**
 * API mushElements element
 */

const express = require('express');
const router = express.Router();
const fileUpload = require('express-fileupload');
const converter = require('json-2-csv');
const fs = require('fs');
const path = require("path");
const {Jimp} = require("jimp")
const moment=require("moment")
const db = require("../../models");
const { where,fn,col } = require('sequelize');
const { type } = require('os');
const { CLIENT_RENEG_LIMIT } = require('tls');
const QRCode = require('qrcode')
const {generateSync}=require("text-to-image")
const mergeImages = require('merge-base64');
const { Json } = require('sequelize/lib/utils');
const heicConverter=require("heic-convert")
const Op = db.Sequelize.Op;

router.get('/',async  (req, res) => {
    let searchCode=req.query.searchCode?req.query.searchCode:false
    let filterCategory=req.query.filterCategory?req.query.filterCategory:false
    let pickReasonDD=await db.dDOption.findAll({where:{ddMenu:"pickReason"}})
    res.render("management/mushElement",{searchCode:searchCode,
                                        pickReasonDD:pickReasonDD,
                                        filterCategory:filterCategory})
  });

router.get('/getAll',async  (req, res) => {
    let filterCategory=req.query.filterCategory?req.query.filterCategory:false
    //console.log(req.query)
    let mushElements
    if(filterCategory!=false){
         mushElements=await db.mushElement.findAll({
        where:{type:filterCategory},
        include: [{model: db.mushElementNote,attributes:[]},
        {model: db.mushElementHarvest,attributes:[]}],
         attributes: {
            include: [[fn("SUM", col("mushElementHarvests.harvest_weight")), "totalHarvestWeight"],
                    [fn("COUNT", col("mushElementNotes.id")), "totalNote"]]
        },
        group: ["mushElement.id"] // serve il group by per fare l’aggregazione
        },{ order:[['id', 'ASC']]})
    }else{
        mushElements=await db.mushElement.findAll({
        include: [{model: db.mushElementNote,attributes:[]},{model: db.mushElementHarvest,attributes:[]}],
         attributes: {
            include: [[fn("SUM", col("mushElementHarvests.harvest_weight")), "totalHarvestWeight"],
                    [fn("COUNT", col("mushElementNotes.id")), "totalNote"]]
        },
        group: ["mushElement.id"] // serve il group by per fare l’aggregazione
        },{ order:['id', 'ASC']})
    }
    res.status(200).json({mushElements:mushElements})
});

router.put('/updateMushElement', async(req,res) => {
    //console.log(req.body)
    let idMushElement=req.body.idMushElement?req.body.idMushElement:false
    let data=req.body
    if (idMushElement!=false){
        await db.mushElement.update({
            pick_date:data.pick_date?data.pick_date:null,
            pick_reason:data.pick_reason?data.pick_reason:null,
            stato:data.stato,
            qt:data.qtElem,
            },{where:{id:idMushElement}})
        .then(result=>{
            res.status(200).json({data:result})
        })
        .catch(err =>{
            console.log(err)
            res.status(422).json({message:err}) 
        })
                
    } else {
        res.status(422).json()
    }
})

router.get('/singleMushElement',async  (req, res) => {
    //console.log(req.query)
    let titoloFiltro=""
    let filterCategory
    let mushElementId
    if(req.query.elementCode){
        let findPar=await db.mushElement.findOne({where:{element_code:req.query.elementCode}, attributes:['id','type']})
        //console.log(JSON.parse(JSON.stringify(findPar)))
        mushElementId=findPar.id        
        filterCategory=findPar.type
    }else{
        filterCategory=req.query.filterCategory?req.query.filterCategory.toUpperCase():null
        mushElementId=req.query.id?req.query.id:false
    }
     
    if (mushElementId!=false){
        let mushElement=await db.mushElement.findOne({where:{id:mushElementId,type:filterCategory},
                                                    include: [
                                                        {model: db.mushElementNote,attributes:[]},
                                                        {model: db.mushElementHarvest,attributes:[]}
                                                    ],
                                                    attributes: {
                                                        include: [[fn("SUM", col("mushElementHarvests.harvest_weight")), "totalHarvestWeight"],
                                                                [fn("COUNT", col("mushElementNotes.id")), "totalNote"]]
                                                    },
                                                    group: ["mushElement.id"] // serve il group by per fare l’aggregazione
                                                        })
         let harvests= await db.mushElementHarvest.findAll({where:{mushElementId:mushElementId,type:mushElement.type}})
        mushElement=JSON.parse(JSON.stringify(mushElement))
        harvests=JSON.parse(JSON.stringify(harvests))
        mushElement.mushElementHarvests=harvests

        let stageDD=await db.dDOption.findAll({where:{ddMenu:"stageMushElement"}})
        let pickReasonDD=await db.dDOption.findAll({where:{ddMenu:"pickReason"}})
        let parentElement
        let seeds
        if (filterCategory!=null)
       { switch (filterCategory) {
            case "INOCULUM":
                parentElement=await db.inoculum.findOne({where:{id:mushElement.relatedId},
                        include: [
                            {model:db.strain},
                            {model:db.substrate,include:[{model:db.substrateElement,include:[{model:db.rawMaterial}]},{model:db.recipe}]},
                            {model:db.container}
                        ]})
                titoloFiltro="inoculi"
                seeds=await db.seed.findAll({where:{relatedId:parentElement.id,typeDestination:"INOCULUM"}})
                break;
            case "SPAWN":
            parentElement=await db.spawn.findOne({where:{id:mushElement.relatedId},
                        include: [
                            {model: db.strain},
                            {model:db.substrate,include:[{model:db.substrateElement,include:[{model:db.rawMaterial}]},{model:db.recipe}]},
                            {model:db.container}
                        ]})
                titoloFiltro="spawn"
                seeds=await db.seed.findAll({where:{relatedId:parentElement.id,typeDestination:"SPAWN"}})
            break;
            case "CULTIVATION":
                parentElement=await db.propagation.findOne({where:{id:mushElement.relatedId},
                        include: [
                            // {model: db.spawn},
                            {model: db.strain},
                            {model:db.substrate,include:[{model:db.substrateElement,include:[{model:db.rawMaterial}]},{model:db.recipe}]},
                            {model:db.container}
                        ]})
                titoloFiltro="elementi coltivazione"
                seeds=await db.seed.findAll({where:{relatedId:parentElement.id,typeDestination:"CULTIVATION"}})
                break;
        }
        
            
            //console.log("***")
        //console.log(parentElement)
            //console.log("***")

        if (parentElement!=null){
            parentElement=JSON.parse(JSON.stringify(parentElement))
            mushElement=JSON.parse(JSON.stringify(mushElement))
            stageDD=JSON.parse(JSON.stringify(stageDD))
            pickReasonDD=JSON.parse(JSON.stringify(pickReasonDD))
            let pickReasonDesc="N.D."
            let stageDesc="--"
            pickReasonDD.forEach(el => {
                if (el.val===parseInt(mushElement.pick_reason)){
                    pickReasonDesc=el.txt
                }
            });
            stageDD.forEach(el => {
                if (el.val==mushElement.stage){
                    stageDesc=el.txt
                }
            });
            mushElement.pickReasonDesc=pickReasonDesc
            mushElement.stageDesc=stageDesc
            mushElement.load_date=moment(mushElement.load_date).format("DD-MM-YY")
            mushElement.expected_maturation_date=mushElement.expected_maturation_date?moment(mushElement.expected_maturation_date).format("DD-MM-YY"):"-"
            mushElement.real_maturation_date=mushElement.real_maturation_date?moment(mushElement.real_maturation_date).format("DD-MM-YY"):"-"
            mushElement.expected_fructification_date=mushElement.expected_fructification_date?moment(mushElement.expected_fructification_date).format("DD-MM-YY"):"-"
            mushElement.real_fructification_date=mushElement.real_fructification_date?moment(mushElement.real_fructification_date).format("DD-MM-YY"):"-"
            mushElement.pick_date=moment(mushElement.pick_date).format("DD-MM-YY")
            mushElement.pick_reason=mushElement.pick_reason?mushElement.pick_reason:"--"
            mushElement.stage=mushElement.stage
            mushElement.purchased=parentElement.purchased? "Sì" : "No"

            switch (filterCategory) {
                case "INOCULUM":
                    mushElement.substrate_info=parentElement.substrate.name_substrate +" "+parentElement.substrate.recipe_name
                    mushElement.qt_info=mushElement.qt +" "+ parentElement.container.uom
                    mushElement.contenitore_info=parentElement.container.container_name
                case "SPAWN":
                    mushElement.substrate_info=parentElement.substrate.name_substrate +" "+parentElement.substrate.recipe_name
                    mushElement.qt_info=mushElement.qt +" "+ parentElement.container.uom
                    mushElement.contenitore_info=parentElement.container.container_name
                    break;
                case "CULTIVATION":
                    mushElement.cultivation_info=parentElement.spawn?parentElement.spawn.strain.species_code +" "+parentElement.spawn.strain.strain_name:"-"
                    mushElement.substrate_info=parentElement.substrate.name_substrate +" "+parentElement.substrate.recipe_name
                    mushElement.qt_info=mushElement.qt +" "+ parentElement.container.uom
                    mushElement.contenitore_info=parentElement.container.container_name
                    break;
            }
        }}
       // console.log(JSON.parse(JSON.stringify(parentElement)))

        //console.log(JSON.parse(JSON.stringify(seeds)))
        //console.log(mushElement)
        res.render("management/mushElementZoom",{mushElement:mushElement,
                                                    parentElement:parentElement,
                                                    stageDD:stageDD,
                                                    pickReasonDD:pickReasonDD,
                                                    titoloFiltro:titoloFiltro,
                                                    filterCategory:filterCategory,
                                                    seeds:seeds})
    } else {
            res.status(422).json()
        }   
  });

router.get('/getSingleMushElement',async  (req, res) => {
    //console.log(req.query)
    
    let mushElementId=req.query.id?req.query.id:false
    if (mushElementId!=false){
        let mushElement=await db.mushElement.findOne({where:{id:mushElementId},
                include: [
                    {model: db.mushElementNote},
                   // {model: db.mushElementHarvest}
                ]})
        let harvests= await db.mushElementHarvest.findAll({where:{mushElementId:mushElementId,type:mushElement.type}})
        
        mushElement=JSON.stringify(mushElement)
        harvests=JSON.stringify(harvests)
        //console.log("---")
        //console.log(harvests)
        mushElement.mushElementHarvests=harvests
        let propagationData=mushElement.relatedId?await db.propagation.findOne({where:{id:mushElement.relatedId},
            include: [
                {model: db.spawn,include:[{model: db.strain}]},
                {model:db.substrate,include:[{model:db.substrateElement,include:[{model:db.rawMaterial}]}]},
                {model:db.container}
            ]}):false

        res.status(200).json({mushElement:mushElement,
            propagationData:propagationData})
    } else {
            res.status(422).json()
        }   
  });

router.get('/changeStage',async (req,res)=>{
    let {stage,idElement,codElement}=req.query
    //console.log(req.query)
    await db.mushElement.update({stage:stage,real_maturation_date:moment()},{where:{id:idElement}})
    .then(async result=>{ 
        await db.diaryNote.create({nota:`Elemento ${codElement} messo in fruttificazione`,tag:"",area:""}) 
        res.status(200).json({result:result})
    })
})

router.get('/getMoviementation',async (req,res)=>{
    let mushElementId=req.query.id?req.query.id:false
    let filterCategory=req.query.filterCategory?req.query.filterCategory:false
    if (mushElementId!=false){
        let mushElement= await db.mushElement.findAll({where:{id:mushElementId,type:filterCategory}})
        let movimentation= await db.movimentation.findAll({where:{relatedId:mushElementId,type:filterCategory}})
        let storages=await db.storage.findAll({include:{model:db.device}})
        let storageStory=[]
        if (movimentation.length==0){
            let to
            let from=mushElement[0].createdAt
            if (mushElement[0].active==1){
                to=moment().toISOString()
            }else{
                to=mushElement.pick_date
            }
            storageStory.push({storageId:mushElement[0].storageId,from:from,to:to})
        }else{
            for (let i = 0; i < movimentation.length; i++) {
                const el = movimentation[i];
                let to
                let from
                // gestione ultima movimentazione
                if (i==movimentation.length-1){
                    if (mushElement[0].active==1){
                        to=moment().toISOString()
                    }else{
                        to=mushElement[0].pick_date
                    }
                    from=movimentation[i-1].createdAt
                    //console.log(movimentation[i-1].createdAt)
                    //console.log(from,to)
                    storageStory.push({storageId:el.to,from:from,to:to})
                } 
                else if(i==0){
                    from=mushElement[0].createdAt
                    to=el.createdAt
                    storageStory.push({storageId:el.to,from:from,to:to})
                }
                else{
                    from=movimentation[i-1].createdAt
                    to=el.createdAt
                    storageStory.push({storageId:el.to,from:from,to:to})
                }
            }
        }
        res.status(200).json({storageStory:storageStory,storages:storages})
    } else {
            res.status(422).json()
        } 
})

async function getSampledData(data,sampleSize) {
            if (data.length <= sampleSize) return data;
            let step = data.length / sampleSize;
            let sampled = [];
             for (let i = 0; i < sampleSize; i++) {
                sampled.push(data[Math.floor(i * step)]);
            }
            return sampled
        }


router.get('/getSensorData',async (req,res)=>{
    let {storageId,from,to,sampleSize}=req.query
    //console.log(req.query)
    let data=await db.sensorData.findAll({where:{storageId:storageId,
                                                        createdAt: {
                                                                [Op.between]: [from, to]
                                                                }
                                                    },
                                                    order: [['createdAt', 'ASC']]
                                                        });
    let sensorData=await getSampledData(data,sampleSize)
    res.status(200).json({sensorData:sensorData})
})


  router.get('/getMushElementByRelated',async  (req, res) => {
    let relatedId=req.query.relatedId?req.query.relatedId:false
    if (relatedId!=false){
        await db.mushElement.findAll({where:{relatedId:relatedId},include: [{model: db.mushElementNote}]})
            .then((result)=>{
                res.status(200).json({mushElement:result})})
            .catch(err=>{
                console.log(err)
            })
    } else {
            res.status(422)
        }
  });

router.delete('/deleteMushElement',async  (req, res) => {
    let fructificationId=req.query.id?req.query.id:false
    if (fructificationId!=false){
        let result=await db.mushElementNote.destroy({where:{fructificationId:fructificationId}})
        result=await db.mushElement.destroy({where:{id:fructificationId},include:[{model: db.mushElementNote}]})
        res.status(200).json({result:result})
    } else {
            res.status(422).json()
        }
  });

router.get('/getMushElementOfRecipe',async  (req, res) => {
    let idRecipe=req.query.idRecipe
    let recipeMushElement=await db.mushElement.findAll({where:{recipeId:idRecipe}})
    res.status(200).json({recipeMushElement:recipeMushElement})
});

router.put('/modMushElement', async(req,res) => {
    //console.log(req.body)
    let idMushElement=req.body.idMushElement?req.body.idMushElement:false
    let data=req.body
    if (idMushElement!=false){
        await db.mushElement.update({
            stage:data.stage?data.stage:null,
            pick_date:data.pickDate?moment(data.pickDate,"DD-MM-YY hh:mm:ss").format("YYYY-MM-DD hh:mm:ss"):null,
            pick_reason:data.pickReason?data.pickReason:null,
            expected_maturation_date:data.expectedMatDate?moment(data.expectedMatDate,"DD-MM-YY").format("YYYY-MM-DD"):null,
            real_maturation_date:data.realMatDate?moment(data.realMatDate,"DD-MM-YY").format("YYYY-MM-DD"):null,
            expected_fructification_date:data.expectedFructDate?moment(data.expectedFructDate,"DD-MM-YY").format("YYYY-MM-DD"):null,
            real_fructification_date:data.realFructDate?moment(data.realFructDate,"DD-MM-YY").format("YYYY-MM-DD"):null,
            note:data.note,
            },{where:{id:idMushElement}})
        .then(async result=>{
            let obj=await db.mushElement.findOne({where:{id:idMushElement}})
                res.status(200).json({data:obj})
        })
        
        .catch(err =>{
            console.log(err)
            res.status(422).json({message:err}) 
        })            
    } else {
        res.status(422).json()
    }
})


router.put('/pickElement', async(req,res) => {
    //console.log(req.body)
    let idMushElement=req.body.idMushElement?req.body.idMushElement:false
    let data=req.body
    if (idMushElement!=false){
        let mushElement=await db.mushElement.findOne({where:{id:idMushElement}})
        if ((req.body.deleteElem!= undefined)&&(req.body.deleteElem=="1")){
            // await db.mushElementNote.destroy({where:{mushElementId:idMushElement}})
            await db.mushElement.destroy({where:{id:idMushElement}})
            .then(()=>{
                res.status(200).json({message:"ok"})
            })
            .catch(err =>{
                console.log(err)
                res.status(422).json({message:err}) 
            }) 
        } else {
            await db.mushElement.update({
                pick_date:moment(data.pickDate,"DD-MM-YY hh:mm:ss").format("YYYY-MM-DD hh:mm:ss"),
                pick_reason:data.pickReason,
                active:0
            },{where:{id:idMushElement}})
            .then(async result=>{
                await db.diaryNote.create({nota:`Pick dell'elemento ${mushElement.element_code} motivazione: ${data.pickReason}`,tag:"",area:""}) 
                res.status(200).json({message:"ok"})
            })
            .catch(err =>{
                console.log(err)
                res.status(422).json({message:err}) 
            }) 
        }
                   
    } else {
        res.status(422).json()
    }
})

router.put('/movimentazioneElement',async (req,res)=>{
    //console.log(req.body)
    let movimentaAll_Ckb=req.body.movimentaAll_Ckb?req.body.movimentaAll_Ckb:false
    let movimentaTypeElement=req.body.movimentaTypeElement
    let movimentaIdElement=req.body.movimentaIdElement
    //console.log(movimentaAll_Ckb)
    if (movimentaAll_Ckb=="moveAll"){
        let movimentaAll_Sel=req.body.movimentaAll_Sel
        let movimentaFrom_Sel=req.body.movimentaFrom_Sel
        let mushElement=await db.mushElement.findAll({where:{relatedId:movimentaIdElement,type:movimentaTypeElement,}})
        for (let i = 0; i < mushElement.length; i++) {
            const elem = mushElement[i];
            let insertMove=await db.mushElement.update({storageId:movimentaAll_Sel},
                                                       {where:{
                                                        id:elem.id,
                                                        type:movimentaTypeElement,
                                                        active:1,
                                                        storageId: { [Op.ne]: movimentaAll_Sel }}})
            if(insertMove[0]!=0){
                //console.log(movimentaIdElement,movimentaFrom_Sel,movimentaAll_Sel,movimentaTypeElement)
                await db.movimentation.create({relatedId:elem.id,
                                                from:movimentaFrom_Sel,
                                                to:movimentaAll_Sel,
                                                type:movimentaTypeElement})
            }
        }
        switch (movimentaTypeElement) {
            case "INOCULUM":
                await db.inoculum.update({storageId:movimentaAll_Sel},{where:{id:movimentaIdElement}})
                break;
            case "SPAWN":
                await db.spawn.update({storageId:movimentaAll_Sel},{where:{id:movimentaIdElement}})
                break;
            case "CULTIVATION":
                await db.propagation.update({storageId:movimentaAll_Sel},{where:{id:movimentaIdElement}})
                break;
        }
    }else{
        let destinationDD=req.body.destinationDD
        for (let i = 0; i < destinationDD.length; i++) {
            const elem = destinationDD[i];
            let idElement=elem.split("|")[1]
            let toStorageId=elem.split("|")[0]
            let fromStorageId=elem.split("|")[2]
            let insertMove=await db.mushElement.update({storageId:toStorageId},
                                                       {where:{
                                                        id:idElement,
                                                        active:1,
                                                        type:movimentaTypeElement,
                                                        storageId: { [Op.ne]:toStorageId  }}})  
            if(insertMove[0]!=0){
                //console.log(movimentaIdElement,fromStorageId,toStorageId,movimentaTypeElement)
                await db.movimentation.create({relatedId:idElement,
                                                from:fromStorageId,
                                                to:toStorageId,
                                                type:movimentaTypeElement})
            }
        }
    }
    res.status(200).json(req.body)
})

/** Mushroom element note */
router.post('/newMushElementNote', async(req,res) => {
    const data=req.body
    console.log(req.body)
    let imgMushElementNote=null
    let nomeFile= null
    
    const array_of_allowed_file_types = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif','image/heic'];
    const allowed_file_size = 5;
    let letterElement="" // identifica il postfisso della cartella in base alla tipologia di elemento
    switch (req.query.type) {
        case "INOCULUM":
            letterElement="_I"
            break;
        case "SPAWN":
            letterElement="_S"
            break;
        case "CULTIVATION":
            letterElement="_C"
            break;
        
    }
    const dirname=data.idMushElementNote+letterElement
    const pathToDir = path.join(__dirname, "../../public/imgMushEleNote",dirname);
    let uploadFlag=true
    let uploadError=""

    if (req.files!=null){
        imgMushElementNote  = req.files.imgMushElementNote?req.files.imgMushElementNote:null;
        nomeFile = imgMushElementNote.name
        //console.log(uploadFlag,uploadError)
        if (!array_of_allowed_file_types.includes(imgMushElementNote.mimetype)) {
            uploadFlag=false
            uploadError="Il tipo di file non è consentito"
        }
        //console.log(uploadFlag,uploadError)
        // if ((imgMushElementNote.size / (1024 * 1024)) > allowed_file_size) {                  
        //      uploadFlag=false
        //     uploadError="File troppo grande, dimensione massima 2Mb"
        // }
        if( (uploadFlag)&&(!fs.existsSync(pathToDir))) {
                    fs.mkdirSync(pathToDir);
                    if (fs.existsSync(pathToDir+"/"+nomeFile)) {
                        uploadFlag=false
                        uploadError="E' già presente un file con questo nome nella directory dell'elemento"
                        }           
                } 
        //console.log(uploadFlag,uploadError)
        
    }
    if(uploadFlag==true){
        if (imgMushElementNote!=null){
                if (imgMushElementNote.mimetype=="image/heic"){
                    const outputBuffer = await heicConverter({
                            buffer: imgMushElementNote.data, // the HEIC file buffer
                            format: 'JPEG',      // output format
                            quality: 1           // the jpeg compression quality, between 0 and 1
                        });
                        console.log("BUF")
                        console.log(outputBuffer)
                    imgMushElementNote.data=outputBuffer
                    imgMushElementNote.mimetype = "image/jpeg";
                    imgMushElementNote.name = imgMushElementNote.name.replace(/\.heic$/i, ".jpg");
                }
            }
        await db.mushElementNote.create({
            mushElementId:data.idMushElementNote,
            check_date:data.check_date?moment(data.check_date,"DD-MM-YYYY"):null,
            stato:data.statoMushElementNote,
            pict:imgMushElementNote.name,
            note:data.noteMushElementNote,
            type:data.filterCategoryNote.trim()
            })
        .then(async result=>{
            //console.log(result)
            await db.mushElement.update({stato:data.statoMushElementNote},{where:{id:result.mushElementId,type:result.type}})
            .then(result=>{
                console.log(result)
            })
            let err=false
            if (imgMushElementNote!=null){
                // if (imgMushElementNote.mimetype=="image/heic"){
                //     const outputBuffer = await heicConverter({
                //             buffer: imgMushElementNote.data, // the HEIC file buffer
                //             format: 'JPEG',      // output format
                //             quality: 1           // the jpeg compression quality, between 0 and 1
                //         });
                //         console.log("BUF")
                //         console.log(outputBuffer)
                //     imgMushElementNote.data=outputBuffer
                //     imgMushElementNote.mimetype = "image/jpeg";
                //     imgMushElementNote.name = imgMushElementNote.name.replace(/\.heic$/i, ".jpg");
                // }
                const outputPath = path.join(pathToDir, imgMushElementNote.name);
                let image = await Jimp.read(imgMushElementNote.data)
                image.resize({
                            w: 1024,
                            })
                image.write(outputPath);
            }
            res.status(200).json({error:false,data:result})
        })
        .catch(err =>{
            console.log(err)
            res.status(422).json({message:err}) 
        })}
    else{
        res.status(200).json({error:true,data:uploadError})
    }
})

router.get('/getMushElementNote',async  (req, res) => {
    let idElement=req.query.idElement
    let filterCategoryNote=req.query.filterCategoryNote
    let mushElementNotes=await db.mushElementNote.findAll({where:{mushElementId:idElement,type:filterCategoryNote}})
    res.status(200).json({mushElementNotes:mushElementNotes})
});

router.delete('/deleteMushElementNote',async  (req, res) => {
    let mushElementNoteId=req.query.id?req.query.id:false
    //console.log("delete")
    //console.log(req.query)
    if (mushElementNoteId!=false){
        let elemData=await db.mushElementNote.findOne({where:{id:mushElementNoteId}})
        //console.log(JSON.parse(JSON.stringify(elemData)))
        if (elemData.pict){
             const pathToDir = path.join(__dirname, "../../public/imgMushEleNote",elemData.mushElementId.toString(),elemData.pict);
            fs.unlink(pathToDir, (err) => {
                    if (err) {
                        console.error(`Error removing file: ${err}`);
                        return;
                    }console.log(`File "../../public/imgMushEleNote/${elemData.mushElementId.toString()}" has been successfully removed.`);
                    });
        }
        let result=await db.mushElementNote.destroy({where:{id:mushElementNoteId}})
        res.status(200).json({result:result})
    } else {
            res.status(422).json()
        }
  });

/** Mushroom element harvest */
router.post('/insertHarvest',async (req,res)=>{
    let data=req.body
    //console.log(data)
    await db.mushElementHarvest.create({mushElementId:data.idMushElementHarvest,
                        harvest_date:moment(data.harvest_date,"DD-MM-YY"),
                        harvest_weight:data.harvest_weight,
                        type:data.filterCategoryHarvest,
                    note:data.harvest_note?data.harvest_note:""})
                    .then(async result=>{
                        //console.log(result)
                        let harvest=await db.mushElementHarvest.findAll({where:{mushElementId:data.idMushElementHarvest,type:data.filterCategoryHarvest},limit: 300})
                        res.status(200).json({harvest:harvest})
                    })
})

router.post('/insertBulkHarvest',async (req,res)=>{
    let {weightBulk,elementCode,filterCategoryHarvest,harvestBulk_date_DT,harvest_note}=req.body
    let weightSingle=weightBulk/elementCode.length
    weightSingle=Number(weightSingle.toFixed(2))

    elementCode.forEach(async elem=>{
        await db.mushElementHarvest.create({mushElementId:elem,
                            harvest_date:moment(harvestBulk_date_DT),
                            harvest_weight:weightSingle,
                            type:filterCategoryHarvest,
                            note:harvest_note?harvest_note:""})
    })
    res.status(200).json({result:true})
    
})

router.get('/getHarvest',async (req,res)=>{
    let data=req.query
    //console.log(data)
    let harvest=await db.mushElementHarvest.findAll({where:{mushElementId:data.id,type:data.filterCategoryHarvest},limit: 300})
    res.status(200).json({harvest:harvest})
})

router.delete('/deleteHarvest',async (req,res)=>{
    let idMushElementHarvest=req.query.idMushElementHarvest?req.query.idMushElementHarvest:false
    if(idMushElementHarvest!=false){
        await db.mushElementHarvest.destroy({where:{id:idMushElementHarvest}})
        .then(result=>{
            res.status(200).json({result})
        })
    }
})


//   DEPRECATE
router.put("/changeVal",async (req,res)=>{
    let field=req.query.field
    let val=req.query.val
    let id=req.query.id
    let result = await db.mushElement.update({ [field]: moment(val,"YYYY-MM-DD HH:mm:ss") },{where: {id: id}});
     result = await db.mushElement.findOne({where: {id: id},attributes:[field]});
    //console.log(result)
    res.status(200).json({result:JSON.parse(JSON.stringify(result))})

})


router.get('/csv',async (req,res)=>{
    let mushElements=await db.mushElement.findAll()
    const csv = await converter.json2csv(mushElements);
    res.set('Content-Type', 'application/octet-stream');
    res.attachment('filename.csv');
    res.status(200).send(csv);
}) 

router.get('/csvLotto',async (req,res)=>{
    //console.log(req.query)
    let {relatedId,filterCategory}=req.query
    let mushElements=await db.mushElement.findAll({where:{relatedId:relatedId,type:filterCategory},attributes:["element_code","createdAt"]})
    mushElements=JSON.parse(JSON.stringify(mushElements))
    let csvObj=[]
    for (let i = 0; i < mushElements.length; i++) {
        let elem=mushElements[i]
        csvObj.push({
            element_code:elem.element_code,
            createAt:moment( elem.createAt).format("DD-MM-YY HH:mm"),
            qrCode:"/mushElement/mushElementLanding?elementCode="+elem.element_code
        })
    }
    const csv = await converter.json2csv(csvObj,{prependHeader:false});
    res.set('Content-Type', 'application/octet-stream');
    res.attachment('filename.csv');
    res.status(200).send(csv);
}) 
// Creazione QR code
router.get('/getQrElement',async  (req, res) => {
    let elementCode=req.query.elementCode
    let element=await db.mushElement.findOne({where:{element_code:elementCode}})
    //console.log(JSON.parse(JSON.stringify(element)))
    //console.log(element )
    let string="/mushElement/mushElementLanding?elementCode="+elementCode
    let url=await QRCode.toDataURL(string)
    let textDAta = generateSync(elementCode,{
                maxWidth: 164,
                fontSize: 16,
                fontFamily: 'Arial',
                lineHeight: 16,
                });
    textDAta=textDAta.replace(/^data:image\/[a-z]+;base64,/, "")
    url=url.replace(/^data:image\/[a-z]+;base64,/, "")
    const mergedImage = await mergeImages([url, textDAta],{direction:true});
    res.status(200).json({qrCode:mergedImage})
    // QRCode.toDataURL(JSON.toString(string), function (err, url) {
    //     console.log(url)
    //     res.status(200).json({qrCode:url})
    //   })
    
});
// Landing page qr code
router.get('/mushElementLanding',async (req,res)=>{
    let elementCode=req.query.elementCode?req.query.elementCode:false
    if (elementCode){
        let mushElement=await db.mushElement.findOne({where:{element_code:elementCode}})
        res.render("management/mushElementLanding",{mushElement:mushElement})
    } else {
                res.status(422).json()
            }
    
})





module.exports=router;
