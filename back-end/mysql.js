'use strict';

const mysql = require('mysql2/promise');

require('dotenv').config();

//BASE DE DONNEE
const db = mysql.createPool({
    connectionLimit: 100,
    host     : 'localhost',
    user     : process.env.user,
    password : process.env.mp,
    waitForConnections: true,
    database: process.env.db,
    port: process.env.pt,
    charset: 'utf8mb4',
    debug: false
  
});


module.exports = db;
console.log('Vous êtes connecté à la BDD !')