const PerfilRepository = require('../repositories/perfil.repository');

async function obterPerfil() {
  const perfil = await PerfilRepository.buscarPerfil();
  if (!perfil) {
    const erro = new Error('Nenhum perfil foi encontrado. Execute o script src/database/banco.sql no MySQL Workbench.');
    erro.status = 404;
    throw erro;
  }
  return perfil;
}
module.exports = { obterPerfil };
