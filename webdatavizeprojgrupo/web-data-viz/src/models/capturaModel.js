var database = require("../database/config");

function cadastrar() {
  
    var instrucaoSql = ` SELECT * FROM historico WHERE umidade = ${umidade} AND temperatura = ${temperatura}`;
  
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
  }
  
  
  module.exports = {
    cadastrar
  }