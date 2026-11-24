
const db = require("../models");
const {fn,col}=require("sequelize")
module.exports=async (propagationId)=>{
    let propagation= await db.propagation.findOne({where:{id:propagationId}})
        let substrateInfo= await db.substrate.findOne({where:{id:propagation.substrateId},attributes:["qt","recipeId"]})
        let recipeDrain= await db.recipe.findOne({where:{id:substrateInfo.recipeId},attributes:["drain"]})
        let substrateElement= await db.substrateElement.findAll({where:{substrateId:propagation.substrateId},attributes:["qt_dry"]})
        substrateElement=JSON.parse(JSON.stringify(substrateElement)).map(item => item.qt_dry)
        console.log(substrateElement)
        if (recipeDrain==0){
            substrateElement.sort((a, b) => a - b)
        }
        let totalQtDry=substrateElement.reduce((acc, valore) => acc + valore, 0);
        let totalHarvest=await db.mushElement.findAll({
                    where: {
                        relatedId: propagationId,
                        type: "CULTIVATION"
                    },
                    attributes: [
                        [fn('SUM', col('mushElementHarvests.harvest_weight')), 'totalHarvestWeight']
                    ],
                    include: [{
                        model: db.mushElementHarvest,
                        attributes: []
                    }],raw: true,
        });
        totalHarvest=totalHarvest[0].totalHarvestWeight/1000
       let bEf=totalHarvest/totalQtDry*100

        return {substrateInfo:substrateInfo,
                totalQtDry:totalQtDry,
                totalHarvest:totalHarvest,
                propagation:propagation.n_container,
                bEf:bEf.toFixed(2)}    
}