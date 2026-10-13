const express = require('express');
const path = require('path');
require('dotenv').config();
const pool = require('./database/conexao');
const portfolioRoutes = require('./routes/portfolio.routes');

const app = express();
const PORT = Number(process.env.PORT || 3000);

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(express.urlencoded({ extended: false }));
app.use('/imagens', express.static(path.join(__dirname, '..', 'imagens')));
app.use(portfolioRoutes);

app.get('/health', async (req, res) => {
  try {
    await pool.query('SELECT 1');
    res.status(200).json({ status: 'ok', banco: 'conectado' });
  } catch (erro) {
    res.status(503).json({ status: 'erro', banco: 'indisponivel' });
  }
});

app.use((req, res) => res.status(404).send('Página não encontrada. Acesse /portifolio.'));
app.use((erro, req, res, next) => {
  console.error('Erro na aplicação:', erro.message);
  res.status(erro.status || 500).send(
    `<h1>Não foi possível abrir o portfólio</h1><p>${String(erro.message).replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]))}</p><p>Confira o MySQL, o arquivo .env e o script src/database/banco.sql.</p>`
  );
});

if (require.main === module) {
  app.listen(PORT, () => console.log(`Servidor iniciado em http://localhost:${PORT}/portifolio`));
}
module.exports = app;
