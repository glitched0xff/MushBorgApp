const moment=require("moment")
const db = require("../models");

const createEvent=async(element,titlePfx,descriptionPfx,filterCategory,date,evntCat)=>{
    await db.calendar.create({
                                title:`${titlePfx} ${element.element_code}`,
                                description:`${descriptionPfx}
                                            <a href="/mushElement/singleMushElement?id=${element.id}&filterCategory=${filterCategory}" target="_blank"> 
                                            ${element.element_code}
                                            </a>`,
                                start:moment(date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
                                end:moment(date,"DD-MM-YY").format("YYYY-MM-DD hh:mm:ss"),
                                allDay:1,
                                relatedElement:element.id,
                                calendarCategoryId:evntCat
                            })
}

const updateEvent=async(relatedElement)=>{

}

const deleteEvent=async(relatedElement)=>{
    await db.calendar.destroy({where:{relatedElement:relatedElement}})
}

module.exports={createEvent,updateEvent,deleteEvent}