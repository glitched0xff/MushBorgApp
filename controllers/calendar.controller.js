/*
Funzione di gestione dei device
*/

const moment = require("moment");
const db = require("../models");
const Calendar = db.calendar;
const CalendarCategory = db.calendarCategory;
const Op = db.Sequelize.Op;



  exports.getAll =async ()=>{
    // Associaizone per Join SQL
    CalendarCategory.hasMany(Calendar,{ foreignKey: 'category'});
    Calendar.belongsTo(CalendarCategory);
    let data=await Calendar.findAll({
      include: CalendarCategory
    },{ raw:true, order: ['start'] })
    // console.log(JSON.parse(JSON.stringify(data))) 
    return data
  }

  exports.newEvent= async (data)=>{
    console.log(data)
    console.log("---")
    const event = await Calendar.create({ title:data.titolo,
                                          description:data.descrizione,
                                          start:data.start,
                                          end:data.stop,
                                          allDay:data.allDay?data.allDay:0,
                                          category:data.category,
                                          calendarCategoryId:data.category,
                                          completed:0 });
    //console.log(event);
    return (event)
  }

  exports.isComplete =async (idEvent)=>{
    const result= await Calendar.update({completed:1},{where:{id:idEvent}})
    return result
  }

  exports.getAllCategory =async ()=>{
    const result= await CalendarCategory.findAll()
    return result
  }

    
  exports.deleteEvent =async (idEvent)=>{
    const result= await Calendar.destroy({where:{id:idEvent}})
    return result
  }

  exports.updateDate =async (idEvent,start,stop)=>{
      const result= await Calendar.update({start:start,stop:stop},{where:{id:idEvent}})
      return result
    }