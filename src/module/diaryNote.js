const moment=require("moment")
const db = require("../models");

const createNote=async(nota,tag,area)=>{
    await db.diaryNote.create({nota:nota,tag:tag,area:area})   
}


module.exports={createNote}