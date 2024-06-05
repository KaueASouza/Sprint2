var aquarioModel = require("../models/aquarioModel");

function cadastrar(req, res) {
    var temperatura = req.body.temperatura;
    var umidade = req.body.umidade;
  
    if (temperatura == undefined) {
      res.status(400).send("temperatura está undefined!");
    } else if (umidade == undefined) {
      res.status(400).send("umidade está undefined!");
    } else {
  
  
      aquarioModel.cadastrar(temperatura, umidade)
        .then((resultado) => {
          res.status(201).json(resultado);
        }
        ).catch((erro) => {
          console.log(erro);
          console.log(
            "\nHouve um erro ao realizar o cadastro! Erro: ",
            erro.sqlMessage
          );
          res.status(500).json(erro.sqlMessage);
        });
    }
  }
  
  module.exports = {
    cadastrar
  }