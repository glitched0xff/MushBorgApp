const TelegramBot = require('node-telegram-bot-api');

// replace the value below with the Telegram token you receive from @BotFather
const token = '8271087402:AAF6hb7IHYVmOCCD3a3nbT12rA2yJxswQsE';

// Create a bot that uses 'polling' to fetch new updates
const bot = new TelegramBot(token, {polling: true});
let idChat=119318540
bot.sendMessage(idChat,"Comando mushborg")


bot.onText(/\/start/, (msg) => {
	bot.sendMessage(msg.chat.id, "Welcome");
});

// Matches "/echo [whatever]"
bot.onText(/\/version/, (msg, match) => {

  const chatId = msg.chat.id;
  let resp="Mushborg V0.0"
  bot.sendMessage(chatId, resp);
});

// Listen for any kind of message. There are different kinds of
// messages.
// bot.on('message', (msg) => {
//   const chatId = msg.chat.id;
//   idChat=chatId
  
//   // send a message to the chat acknowledging receipt of their message
//   bot.sendMessage(chatId, idChat);
// });