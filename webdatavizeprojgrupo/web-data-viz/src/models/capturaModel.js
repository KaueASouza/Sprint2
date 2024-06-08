var database = require("../database/config");

function capturar(limite_linhas) {
  
    var instrucaoSql = ` SELECT 
    DATE_FORMAT(data_hora,'%H:%i') as data_hora,
    temperatura, 
        umidade
                    FROM historico
                    ORDER BY idHistorico DESC LIMIT ${limite_linhas};
`;
  
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
  }
  
  
  module.exports = {
    capturar
  }