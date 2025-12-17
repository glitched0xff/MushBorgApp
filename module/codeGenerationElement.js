/**
 * Modulo di generazione del codice degli elementi
 * @name codeGenerationElement
 * @module codeGeneration
 * @description Oltre la generazione del codice il modulo controlla eventuali duplicati e aggiorna il counter con il numero corretto di duplicati 
 */
const {Op}=require("sequelize")
const db=require("../models")
const moment=require("moment")

/**
 * Modulo di generezione del codice degli elementi
 * @memberof codeGeneration
* @param {string} species_code - Codice della specie
* @param {string} strainSubcode - Sub-code strain
* @param {string} recipeSubCode - Codice ricetta
* @param {string} type - Tipo di elemento "I"= inoculo "S"=spawn "C"=coltivo
* @param {int} nrContiner - Numero container, se 0 crea il codice del lotto se maggiore crea i codici degli elementi 
* @param {int} duplicateCodeIndex - Indice di copia del codice
* @param {int} counter - Contatore per elementi, per il lotto è 0
 */

module.exports=async (createdDate,species_code,strainSubcode,recipeSubCode,type,nrContiner,duplicateCodeIndex,counter=0)=>{
    let code=""
    let month=["A","B","C","D","E","F","G","H","I","L","M","N"]
    let date=moment(createdDate,"DD-MM-YY").format("YY")+month[moment(createdDate,"DD-MM-YY").month()]+moment(createdDate,"DD-MM-YY").format("DD")
    console.log("----")
    console.log(date)
    if (duplicateCodeIndex==0){
        let tempCode=type+species_code+date+strainSubcode
    // Test univocità codice
        switch (type) {
            case "I":
                codeCount=await db.inoculum.count({where:{code_inoculum:{[Op.like]: `%${tempCode}_${recipeSubCode}%`}}})
                console.log(JSON.parse(JSON.stringify(codeCount)))
                duplicateCodeIndex=codeCount
                break;
            case "S":
                codeCount=await db.spawn.count({where:{code_spawn:{[Op.like]: `%${tempCode}_${recipeSubCode}%`}}})
                duplicateCodeIndex=codeCount
                break;
            case "C":
                codeCount=await db.propagation.count({where:{code_propagation:{[Op.like]: `%${tempCode}_${recipeSubCode}%`}}})
                duplicateCodeIndex=codeCount
                break;
        }
    }

    let idStr=nrContiner
    if (nrContiner>0){
            idStr=counter.toString()
            console.log(idStr)
            if (idStr.length==1){idStr="0"+idStr}
            if (idStr.length==2){idStr=""+idStr}
    }else{
        idStr="XX"
    }
    code=type+species_code+date+strainSubcode+duplicateCodeIndex+recipeSubCode+idStr
    return {element_code:code,duplicateCodeIndex:duplicateCodeIndex}
 
}