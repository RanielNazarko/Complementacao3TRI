const PerfilService = require('../services/perfil.service');
const CursoService = require('../services/curso.service');
const CertificadoService = require('../services/certificado.service');

async function exibirPortfolio(req, res, next) {
  try {
    const perfil = await PerfilService.obterPerfil();
    const [cursos, certificados] = await Promise.all([
      CursoService.listarCursos(perfil.id),
      CertificadoService.listarCertificados(perfil.id)
    ]);
    res.render('portfolio', { dados: { perfil, cursos, certificados } });
  } catch (erro) {
    next(erro);
  }
}
module.exports = { exibirPortfolio };
