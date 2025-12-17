/*
Funzione di gestione dei todo
*/

const db = require("../models");
const ToDo = db.toDo;
const Op = db.Sequelize.Op;

exports.getAll =async ()=>{
    let data=await ToDo.findAll({  order: [['createdAt','DESC']], raw:true })
    return data
  }

exports.insert =async (data)=>{
    let todo=await ToDo.create({ titolo:data.titolo,
                                    descrizione:data.descrizione,
                                    priority:data.priority,
                                    sezione:data.sezione,
                                    durata:data.durata,
                                    eseguito:0 })
    return todo
}

exports.markDone =async (id,val)=>{
    let markDone=await ToDo.update({ eseguito:val },{where:{id:id}})
    return markDone
}


exports.getAllOpenClose =async (val)=>{
    let todos=await ToDo.findAll({where:{eseguito:val},order: [['updatedAt','DESC']], raw:true })
    //console.log(todos)
    return todos
}

exports.delAllDone =async ()=>{
    let result=await ToDo.destroy({where:{eseguito:1}})
    return result
}

exports.delete =async (id)=>{
    let result=await ToDo.destroy({where:{id:id}})
    return result
}