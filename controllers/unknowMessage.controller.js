/*
Funzione di gestione dei dati derivanti dai sensori
*/

const db = require("../models");
const UnknowMessage = db.unknowMessage;
const Device=require("./device.controller")
//const Op = db.Sequelize.Op;
const { fn, col, literal, Op } = require("sequelize");


exports.insert = async(from,message) => {
        const unknowMessage = {
            from:from,
            message:message 
        };
  
      // Save sensor data
      await UnknowMessage.create(unknowMessage)
        .then(data => {
          console.log(data)
          console.log("stored unknow")
        })
        .catch(err => {
          console.log(err)
        });
    };