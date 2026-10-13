const pool = require('../database/conexao');

async function listarPorPerfil(perfilId) {
  const [rows] = await pool.execute(
    'SELECT id, fk_perfil, nome, horas FROM cursos WHERE fk_perfil = ? ORDER BY id',
    [perfilId]
  );
  return rows;
}
module.exports = { listarPorPerfil };
