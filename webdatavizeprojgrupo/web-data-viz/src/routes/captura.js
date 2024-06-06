var express = require("express");
var router = express.Router();

// var aquarioController = require("../controllers/aquarioController");
 var capturaController = require("../controllers/capturaController")

// router.get("/:empresaId", function (req, res) {
//   aquarioController.buscarAquariosPorEmpresa(req, res);
// });

router.get("/capturar", function (req, res) {
  capturaController.capturar(req, res);
})

module.exports = router;