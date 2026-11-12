
const { where,Op } = require("sequelize");
const db = require("../models");

/**
 * @function /module/dropDownGenerator.js
 * @summary Restituisce la lista degli elementi nameDD per creare le dropDown
 * @param nameDD {string} Nome DD codificato [device,selectDevice,container,storage,species,strain,substrate,supplier,materialCategory,recipe,pretreatment,spawn,supplier,destination,dropDown]
 * @param filter {string} Inserisce un filtro
 * @param order {string} Inserisci un'ordine per data di creazione o creazione lotto in base allam query
 * @param limitDate {number} Restituisce solo i record più giovani di x giorni, default 360
 * @returns 200 - Lista egli elementi
 */

/* 
Funzione generazione elenco per dropdown
- LimitDate espresso in giorni e ritorna solo i record degli ultimi X giorni.
*/
module.exports=async (nameDD,filter=false,order=false,limitDate=360)=>{
//    console.log("nameDD:", nameDD, " filter:", filter)
    let queryResult
    let interval
    switch (nameDD) {
        case "device":
            queryResult=await db.device.findAll()
            break;
        case "selectDevice":
            queryResult=await db.device.findAll(filter)
            break;
        case "container":
            queryResult=await db.container.findAll({
                    where: {
                            [Op.or]: [
                                { destination: filter },
                                { destination: "ALL" }
                            ]},
                            order:[["destination","DESC"]]
                        })
            break;
        case "storage":
            queryResult=await db.storage.findAll()
            break;
        case "species":
            queryResult=await db.species.findAll()
            break;
        case "strain":
            queryResult=await db.strain.findAll()
            break;
        case "substrate":
            
            if (order){
                order=[['createdAt', order]]
            }
            interval= new Date()
            interval.setDate(interval.getDate()-limitDate)
            queryResult=await db.substrate.findAll({
                    where: {[Op.or]: [
                                { destination: filter },
                                { destination: "ALL" }
                            ],
                            createdAt: {
                                [Op.gte]: interval
                            }},
                            include:[{model:db.recipe}],
                            order:order,     
                        })
            break;
        case "supplier":
            if (filter){
                queryResult=await db.supplier.findAll({where: {
                                                                field: {
                                                                [Op.like]: `%"${filter}"%` 
                                                                }
                                                            }})
            }else{
                queryResult=await db.supplier.findAll()
            }
            break;
        case "materialCategory":
            queryResult=await db.materialCategory.findAll()
            break;
        case "recipe":
             if (order){
                order=[['createdAt', order]]
            }
            queryResult=await db.recipe.findAll({order:order})
            break;
        case "pretreatment":
            queryResult=await db.pretreatment.findAll()
            break;
        case "spawn":
            queryResult=await db.spawn.findAll({include:[{model:db.container}]})
            break;
        case "destination":
            queryResult=[["INOCULUM","Inoculo"],["SPAWN","Spawn"],["CULTIVATION","Coltivazione"],["ALL","Generico"]]
            break;
        case "dropDown":
            queryResult=await db.dDOption.findAll({where:{ddMenu:filter}, order:order?order:[["val","ASC"]]})
            break;
        default:
            queryResult=null
            break;
    }
    let optionDD=[]
    // console.log(JSON.parse(JSON.stringify(queryResult)))

    if ((queryResult.length>0)&&(queryResult!=null)){
        queryResult.forEach(el => {
            let obj
            switch (nameDD) {
                case "device":
                    obj={val:el.id,txt:el.cod_device}
                break;
                case "selectDevice":
                    obj={val:el.id,txt:el.cod_device}
                break;
                
                case "container":
                    obj={val:el.id,txt:el.code_container+" - "+el.container_name}
                break;
                case "storage":
                   obj={val:el.id,txt:el.code_storage+" - "+el.name_storage}
                break;
                case "species":
                    obj={val:el.shortCode+"|"+el.id,txt:el.description}
                break;
                case "strain":
                    obj={val:el.id+"|"+el.species_code+"|"+el.sub_code,txt:el.strain_name+" - "+el.species_code}
                break;
                case "substrate":
                    obj={val:el.id+"|"+el.recipe.sub_code+"|"+el.forPurchased,txt:el.cod_substrate+" - "+el.name_substrate}
                break;
                case "supplier":
                    obj={val:el.id,txt:el.supplier_name}
                break;
                case "materialCategory":
                    obj={val:el.id,txt:el.category_name}
                break;
                case "recipe":
                    obj={val:el.id,txt:el.cod_recipe+" - "+el.recipe_name}
                break;
                case "spawn":
                    obj={val:el.id,txt:el.code_spawn+" - "+ el.spawn_name+"-"+el.container.type+" "+el.container.capacity+" "+el.container.uom}
                break;
                case "pretreatment":
                    obj={val:el.id,txt:el.pretreatment_name}
                break;
                case "destination":
                    obj={val:el[0],txt:el[1]}
                break;
                case "dropDown":
                    obj={val:el.val,txt:el.txt}
                break;
                }
            
            optionDD.push(obj)
        });
        return optionDD
    } else {
        return null
    }
}