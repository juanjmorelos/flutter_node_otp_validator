const sql  = require('mysql2/promise');

const connection = sql.createPool({
  host: 'localhost',
  user: 'root',
  database: 'xxxxxxx', //Reemplaza con el nombre de tu base de datos
});

module.exports = connection