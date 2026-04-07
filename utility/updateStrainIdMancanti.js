/**
 * Script for list table
 * V0 - 28.01.2026
 * Glitched
 */

const { DataTypes } = require('sequelize');
const db = require("../models");

async function updateStrainIdMushborg() {
  try {
    const mushElements= await db.mushElement.findAll({where:{strainId:null}})
    for (let i = 0; i < mushElements.length; i++) {
      let relatedElement
      switch (mushElements[i].type) {
        case "INOCULUM":
          relatedElement=await db.inoculum.findOne({where:{id:mushElements[i].relatedId}})
          break;
        case "SPAWN":
          relatedElement=await db.spawn.findOne({where:{id:mushElements[i].relatedId}})
          break;
        case "CULTIVATION":
          relatedElement=await db.propagation.findOne({where:{id:mushElements[i].relatedId}})
          break;
      }
      console.log(JSON.parse(JSON.stringify(relatedElement)))
      await db.mushElement.update({strainId:relatedElement.strainId},{where:{id:mushElements[i].id}}).then(result=>{console.log(JSON.parse(JSON.stringify(result)))})
    }
  } catch (error) {
    console.error('Errore ', error);
  } 
}

updateStrainIdMushborg();