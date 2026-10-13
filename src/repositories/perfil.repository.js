const pool = require('../database/conexao');

async function buscarPerfil() {
  const [rows] = await pool.execute('SELECT id, nome, email, descricao FROM perfil ORDER BY id LIMIT 1');
  return rows[0] || null;
}
module.exports = { buscarPerfil };
