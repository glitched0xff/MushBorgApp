const express = require('express');
const router = express.Router();
const moment=require("moment")

// Search engine
router.get('/',async (req,res)=>{
    res.status(200).json({ok:"ok"})
    
})

module.exports=router;