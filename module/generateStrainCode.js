const moment=require("moment")
const {  Op } = require("sequelize");
const db = require("../models");
module.exports=async (species_code,buy_date,subCode)=>{
    let code=""
    let month=["A","B","C","D","E","F","G","H","I","L","M","N"]
    console.log(buy_date)
    let date=moment(buy_date,"DD-MM-YY").format("YY")+month[moment(buy_date,"DD-MM-YY").month()]+moment(buy_date,"DD-MM-YY").format("DD")
    
    code=species_code+date+subCode
    let checkCode=await db.strain.count({where: {
                                        code_strain: { [Op.like]: '%'+code+'%' },
                                    }})
    
    let idStr=checkCode.toString()
    if (checkCode>0){
        idStr=checkCode+1
    }
    code=species_code+date+subCode+idStr
    return code    
}