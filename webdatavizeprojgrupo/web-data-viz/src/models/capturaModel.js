var database = require("../database/config");

function capturar() {
  
    var instrucaoSql = `SELECT * FROM historico;`;
  
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
  }
  
  
  module.exports = {
    capturar
  }