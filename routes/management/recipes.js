/**
 * API recipes element
 */

const express = require('express');
const router = express.Router();
const moment=require("moment")
const db = require("../../models");
const dropDownGenerator= require("../../module/dropDownGenerator")

const RecipeElement = db.recipeElement;
const Recipe = db.recipe;
const MaterialCategory = db.materialCategory;
const RawMaterial= db.rawMaterial
const Op = db.Sequelize.Op;
const Substrate=db.substrate

RecipeElement.associate(db)
Recipe.associate(db)
Substrate.associate(db)

router.get('/',async  (req, res) => {
    let destinationDD=await dropDownGenerator("destination")
    let materialCategory=await MaterialCategory.findAll({order:['category_name'],raw:true})
   res.render("management/recipes",{materialCategory:materialCategory,destinationDD})
  });

router.get('/getAll',async  (req, res) => {
let recipes=await Recipe.findAll({
    include: [{model: RecipeElement},
        {model:Substrate}
    ]
    },{raw:true, order:['createdAt']})
    res.status(200).json({recipes:recipes})
});

router.post('/newRecipe', async(req,res) => {
    console.log(req.body)
    let recipe_name = req.body.recipe_name?req.body.recipe_name:false
    let data=req.body
    if (recipe_name!=false){
        let prefix="RIC"
        let recipeSubCode=data.sub_code
        let month=["A","B","C","D","E","F","G","H","I","L","M","N"]
        let date=moment().format("YY")+month[moment().month()]+moment().format("DD")
        let cod_recipe=prefix+date+recipeSubCode
        let codeCount=await db.recipe.count({where:{cod_recipe:{[Op.like]:`${cod_recipe}%`}}})
        cod_recipe=cod_recipe+codeCount

        await Recipe.create({
            cod_recipe:cod_recipe,
            recipe_name:data.recipe_name,
            sub_code:data.sub_code,
            destination:data.destination,
            forPurchased:data.forPurchased,
            note:data.note
            })
        .then(result=>{
            res.status(200).json({data:result})
        })
        .catch(err =>{
            res.status(522).json({message:err.errors[0].message}) 
        })
                
    } else {
        res.status(522).json()
    }
})

router.put('/updateRecipe', async(req,res) => {
    let idRecipe=req.body.id?req.body.id:false
    let recipe_name = req.body.recipe_name?req.body.recipe_name:false
    let data=req.body
    if ((recipe_name!=false)&&(idRecipe!=false)){
        await Recipe.update({
            cod_recipe:data.cod_recipe,
            recipe_name:data.recipe_name,
            sub_code:data.sub_code,
            destination:data.destination,
            note:data.note
            },{where:{id:idRecipe}})
        .then(result=>{
            res.status(200).json({data:result})
        })
        .catch(err =>{
            res.status(522).json({message:err.errors[0].message}) 
        })
                
    } else {
        res.status(522).json()
    }
})

router.get('/getOneRecipes',async  (req, res) => {
    let recipesId=req.query.id?req.query.id:false
    if (recipesId!=false){
        let recipe=await Recipe.findOne({where:{id:recipesId},
            include: [{model: RecipeElement,include:[{model:db.materialCategory,attributes:["hum_factor","category_name"]}]},
        {model:Substrate}]})
        res.status(200).json({recipe:recipe})
    } else {
            res.status(522).json()
        }
  });

router.delete('/deleteRecipe',async  (req, res) => {
    let recipesId=req.query.id?req.query.id:false
    if (recipesId!=false){
        let result=await RecipeElement.destroy({where:{recipeId:recipesId}})
        result=await Recipe.destroy({where:{id:recipesId},include:[{model: RecipeElement}]})
        res.status(200).json({result:result})
    } else {
            res.status(522).json()
        }
  });



  // Cod recipe generation
  // 13 char 
  // R= recipe + Date + id +2 emptychar used in other category
  router.get('/getRecipesCode',async  (req, res) => {
    let lastRecipe=await Recipe.findOne({
        order: [ [ 'id', 'DESC' ]],
        });
    let recipeCode="R"
    let date=moment().format("YYMMDD")
    let idStr=lastRecipe.id.toString()
    if (idStr.length==1){idStr="00"+idStr}
    if (idStr.length==2){idStr="0"+idStr}
    if (idStr.length==3){idStr=""+idStr}
    recipeCode=recipeCode+date+idStr+"00"

    res.status(200).json({recipeCode:recipeCode})
  });

module.exports=router;
