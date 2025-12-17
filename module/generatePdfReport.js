/**
 * Funzione di generazione pdf
 * 
 * Parametri
 * data = Dati della query da mettere nel template
 * ejsTemplate=File di tempalte
 * headerText=
 */
const ejs=require("ejs")
const moment=require("moment")
const puppeteer=require("puppeteer")
const fs=require("fs")
const path=require("path")

module.exports=async (data,ejsTemplate,headerText=false,footerText=false)=>{
    //console.log(data)
    //Converto il logo in Base64
    const logoPath = path.join(process.cwd(), "public/dist/img/", "LogoMushborgReport.png");
    const logoBuffer = fs.readFileSync(logoPath);
    const logoBase64 = `data:image/png;base64,${logoBuffer.toString("base64")}`;

    const html = await ejs.renderFile("views/report/"+ejsTemplate, { data: data,logoBase64:logoBase64 });
    const headerTemplate= await ejs.renderFile("views/report/reportHeader.ejs", { today: moment().format("DD-MM-YY HH:MM") });
    const footerTemplate= await ejs.renderFile("views/report/reportFooter.ejs",{logoBase64:logoBase64});
    const browser = await puppeteer.launch({
                    headless: true,
                    args: ["--no-sandbox", "--disable-setuid-sandbox"],
                    });
    const page = await browser.newPage();
    await page.setContent(html, { waitUntil: "networkidle0" });
    
    const pdf = await page.pdf({ format: "A4", 
                                    printBackground: true,
                                displayHeaderFooter: true,
                                headerTemplate,
                                footerTemplate,
                                margin: { top: "1.5cm", bottom: "1.5cm", left: "1cm", right: "1cm" }, 
                            });
    await browser.close();
    return pdf
}