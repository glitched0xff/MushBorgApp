const { Telegraf } = require('telegraf')
const bot = new Telegraf('8271087402:AAF6hb7IHYVmOCCD3a3nbT12rA2yJxswQsE')
bot.start((context) => {
	console.log('Servizio avviato...')
	context.reply('Servizio ECHO avviato')
})
bot.on('text', context=>{
	text=context.update.message.text
  	context.reply('Hai scritto: '+text)
})
bot.launch()