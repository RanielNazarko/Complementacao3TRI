const express = require('express');
const PortfolioController = require('../controllers/portfolio.controller');
const router = express.Router();

router.get(['/','/portifolio','/portfolio'], PortfolioController.exibirPortfolio);
module.exports = router;
