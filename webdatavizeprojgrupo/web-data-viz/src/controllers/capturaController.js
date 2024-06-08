var capturaModel = require("../models/capturaModel");

function capturar(req, res) {
  const limite_linhas = 10;

  console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

  capturaModel.capturar(limite_linhas).then(function (resultado) {
    if (resultado.length > 0) {
        res.status(200).json(resultado);
    } else {
        res.status(204).send("Nenhum resultado encontrado!")
    }
}).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
});
    }

  
  module.exports = {
    capturar
  }