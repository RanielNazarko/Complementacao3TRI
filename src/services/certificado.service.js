const CertificadoRepository = require('../repositories/certificado.repository');

async function listarCertificados(perfilId) {
  if (!Number.isInteger(Number(perfilId))) return [];
  return CertificadoRepository.listarPorPerfil(Number(perfilId));
}
module.exports = { listarCertificados };
