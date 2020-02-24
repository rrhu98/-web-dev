const io = require("socket.io-client");
var opn = require('opn');
var readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

let connection = io.connect("http://localhost:3000/");

rl.question('Please type room name you wish to join/create ', (answer) => {

    console.log(`Thank you for your input: ${answer}`);
    connection.emit("room", answer);
    opn("http://localhost:3000")
    rl.close();
  });

connection.on("success", (res) => console.log(res));
connection.on("created", (res) => console.log(res));