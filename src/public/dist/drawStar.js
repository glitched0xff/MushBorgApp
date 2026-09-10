/** Funzione di disegno delle stelle di rating negli elenchi
 *
 * @param {number} ratingStarValue - Array degli elementi star.
 * @param {number} rank - Rank dell'elemento da rappresentare
 * @returns {number} Star - è l'html da inserire nella tabella
 * 
 * @snippet
 * NODEJS
 *  let ratingStarValue=await db.dDOption.findAll({where:{ddMenu:"rankElement"},raw:true})
 *  ratingStarValue: ratingStarValue //    Variabile da inviare a ejs.Render 
 * 
 * FRONTEND EJS
 *   let ratingStarValue= <%- JSON.stringify(ratingStarValue) %> // Caricare id ati da db o passarla dalla route load page
 *  let star=drawStar(ratingStarValue,elem.rank) // Eseguo la funzione per ogni elemento
 * 
 * <td>
 *   <div class="row">
 *     <div class="col-5">${elem.stato}</div> 
 *     ${star}
 *   </div>                        
 * </td>
 */
function drawStar(ratingStarValue,rank)
{
    let star=`<div class="col m-0 p-0">`
    const indexStar = ratingStarValue.findIndex(e => e.val == rank);
    if (indexStar==-1){
    for (let i = 0; i < ratingStarValue.length; i++) {
        star+=`<i class="far fa-star" style="font-size:0.5rem"></i>`
    }
    }else{
    for (let i = 0; i < indexStar; i++) {
    star+=`<i class="fas fa-star" style="font-size:0.5rem"></i>`}
    for (let i = 0; i < ratingStarValue.length-indexStar; i++) {
    star+=`<i class="far fa-star" style="font-size:0.5rem"></i>`}
    }
    star+="</div>"
    return star
}
                