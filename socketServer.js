module.exports = function initSocket(server) {
  const { Server } = require('socket.io');

  const io = new Server(server, {
    cors: {
      origin: '*'
    }
  });

  io.on('connection', socket => {
    console.log('🌐 Browser or MDC connected:', socket.id);
    
    socket.on('test',data=>{
        console.log(data)
    })
    socket.on('data', data => {
      console.log('📩 MQTT event from MDC', JSON.stringify(data));
      // broadcast to all browsers
      io.emit('storage:'+data.storageId, data);
    });
  });
  return io;
};
