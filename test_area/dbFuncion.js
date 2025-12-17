  // Print association
  // const generateERD = require('sequelize-erd');
  // for (const property in db) {
  //    console.log(`${property}: ${db[property]}`);
  //    if(db[property].associations){
  //       console.log(Object.keys(db[property].associations));
  //     }
  // }
  
  //clearDb()
  // Print db schema
  // (async () => {
  //   const svg = await generateERD({ source: db.sequelize });
  //   require('fs').writeFileSync('diagram.svg', svg);
  // })();


  async function clearDb() {
    let mushElement=await db.mushElement.findAll()
    console.log("---- inizio")
    for (let i = 0; i < mushElement.length; i++) {
      const el = mushElement[i];
      let parentElem
      switch (el.type) {
        case "INOCULUM":
          parentElem=await db.inoculum.count({where:{id:el.relatedId}})
          console.log(el.id,parentElem,el.type)
      if (parentElem==0){
        let result=await db.inoculum.destroy({logging:true,where:{id:el.relatedId}})
        console.log(result)
      }
          break;
      case "SPAWN":
          parentElem=await db.spawn.count({where:{id:el.relatedId}})
          console.log(el.id,parentElem,el.type)
      if (parentElem==0){
        let result=await db.spawn.destroy({where:{id:el.relatedId}})
        console.log(result)
      }
          break;
      case "CULTIVATION":
          parentElem=await db.propagation.count({where:{id:el.relatedId}})
          console.log(el.id,parentElem,el.type)
      if (parentElem==0){
        let result=await db.propagation.destroy({where:{id:el.relatedId}})
        console.log(result)
      }
          break;
      }
      
    }
    console.log("---- fine")
    
  }
  
  