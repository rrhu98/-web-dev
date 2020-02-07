const express = require('express');
const mysql = require('mysql');

const db = mysql.createConnection({
    host      : 'localhost',
    user      : 'root',
    password  : '123456',
    database  : 'socialmedia'
});


const app = express();


app.listen('3000', () => {
    console.log('http server started on port 3000');
});

db.connect(function(err){ 
    if (err) {
        throw err;
    }
    db.query("SELECT * FROM UserInfo", function (err, result, fields) { if (err) throw err;
    console.log(result);
});
});

app.get('/',(req,res) => {
    res.send('Database connected, HTML server successful.')
});

app.get('/user',(req,res) => {
    var user = "SELECT * FROM UserInfo";
    db.query(user, function(err, result,fields) {
        if (err) throw err;
        res.json(result);
    });

});

app.get('/contact',(req,res) => {
    var user = "SELECT * FROM contact";
    db.query(user, function(err, result,fields) {
        if (err) throw err;
        res.json(result);
    });

});

app.get('/messages',(req,res) => {
    var user = "SELECT * FROM Messages";
    db.query(user, function(err, result,fields) {
        if (err) throw err;
        res.json(result);
    });

});

app.get('/likes',(req,res) => {
    var user = "SELECT * FROM Likes";
    db.query(user, function(err, result,fields) {
        if (err) throw err;
        res.json(result);
    });

});