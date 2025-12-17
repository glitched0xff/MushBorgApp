/*
Funzione di gestione dei device
*/

const db = require("../models");
const Device = db.device;
//const Op = db.Sequelize.Op;
const { fn, col, literal, Op } = require("sequelize");

/** Controlla che il cod_device esista nel sistema */
exports.checkSensorExist = async (device) => {
    let dev=await Device.findOne({ where: { cod_device: device } })
    if (dev === null) {
      return false
    } else {
      return true
    }
  };

