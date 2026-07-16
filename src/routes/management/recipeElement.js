const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../../models");
const RecipeElement = db.recipeElement;
const Recipes = db.recipe;
const Op = db.Sequelize.Op;

RecipeElement.associate(db)
Recipes.associate(db)

router.get('/',async  (req, res) => {
    let recipesElements=await RecipeElement.findAll()
    res.status(200).json({result:"Welcome recipe Element API"})
  });

router.get('/getAll',async  (req, res) => {
    let recipesElements=await RecipeElement.findAll()
    res.status(200).json({recipesElements:recipesElements})
});
  
router.post('/newRecipeElement', async(req,res) => {
    let recipesId = req.body.recipesId?req.body.recipesId:false
    let data=req.body
    console.log(data)
    if (recipesId!=false){
        await RecipeElement.create({
                    recipeId:data.recipesId,
                    materialCategoryId:data.materialCategoryId,
                    categoryName:data.categoryName,
                    percentage:data.percentage,
                    position:data.position
                })
                .then(result=>{
                    res.status(200).json({data:result})
                })
                .catch(err =>{
                    console.log(err)
                    res.status(522).json({message:err}) 
                })
                
    } else {
        res.status(522).json()
    }
})

router.put('/updateRecipeElement', async(req,res) => {
    let idRecipeElement=req.body.id?req.body.id:false
    let data=req.body
    if (idRecipeElement!=false){
        await RecipeElement.update({
                    materialCategoryId:data.materialCategoryId,
                    percentage:data.percentage,
                    position:data.position
                },{where:{id:idRecipeElement}})
                .then(result=>{
                    res.status(200).json({data:result})
                })
                .catch(err =>{
                    res.status(522).json({message:err}) 
                })
                
    } else {
        res.status(522).json()
    }
})

router.delete('/deleteRecipeElement',async  (req, res) => {
    let id=req.query.id?req.query.id:false
    if (id!=false){
        let result=await RecipeElement.destroy({where:{id:id}})
        res.status(200).json({result:result})
    } else {
            res.status(522).json()
        }
  });

router.get('/getElementsOfRecipe',async  (req, res) => {
    let idRecipe=req.query.idRecipe
    let recipesElements=await RecipeElement.findAll({where:{recipeId:idRecipe}})
    res.status(200).json({recipesElements:recipesElements})
});



module.exports=router;
