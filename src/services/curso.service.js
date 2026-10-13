const CursoRepository = require('../repositories/curso.repository');

async function listarCursos(perfilId) {
  if (!Number.isInteger(Number(perfilId))) return [];
  return CursoRepository.listarPorPerfil(Number(perfilId));
}
module.exports = { listarCursos };
