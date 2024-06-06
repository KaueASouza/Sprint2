var capturaModel = require("../models/capturaModel");

function capturar(req, res) {
  
    
  
  
      capturaModel.capturar()
        .then((resultado) => {

          for(i = 0 ; i <= resultado.length; i++ ){
            console.log(resultado[i]);
          }



          res.json({
            temperatura: resultado.temperatura,
            umidade: resultado.umidade
          })
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

  
  module.exports = {
    capturar
  }