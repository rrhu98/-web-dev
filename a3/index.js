var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

var rooms = ["room1", "room2", "room3"];

app.get('/', function(req, res){
  res.sendFile(__dirname+'/index.html');
});

io.on('connection', function(socket){
    console.log('a user connected');
    socket.on('disconnect', function(){
        console.log('user disconnected');
      });
});

io.on('connection', function(socket){
    socket.on('chat message', function(msg){
      io.emit('chat message', msg);
    });
});

io.sockets.on('connection', function(socket) {
    // once a client has connected, we expect to get a ping from them saying what room they want to join
    socket.on('room', function(room) {
        if (rooms.includes(room)) {
          socket.join(room);
          return socket.emit("success", "Successfully joined room. List of current rooms are: " + rooms);
        } else {
          rooms.push(""+room);
          socket.join(room);
          return socket.emit("created", "Room created and successfully joined. List of current rooms are: " + rooms);
        }
      
    });

});

http.listen(3000, function(){
  console.log('listening on *:3000');
});