-- Banco de dados do portfólio escolar.
-- No MySQL Workbench, selecione o banco escola_backend antes de executar este script.
USE escola_backend;

CREATE TABLE IF NOT EXISTS perfil (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  email VARCHAR(180) NULL,
  descricao TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS cursos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fk_perfil INT NOT NULL,
  nome VARCHAR(180) NOT NULL,
  horas INT NULL,
  CONSTRAINT fk_cursos_perfil FOREIGN KEY (fk_perfil) REFERENCES perfil(id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS certificados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fk_perfil INT NOT NULL,
  titulo VARCHAR(255) NOT NULL,
  ano YEAR NULL,
  imagem VARCHAR(255) NULL,
  CONSTRAINT fk_certificados_perfil FOREIGN KEY (fk_perfil) REFERENCES perfil(id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insere os dados de exemplo somente quando as tabelas ainda estão vazias.
INSERT INTO perfil (id, nome, email, descricao)
SELECT 1, 'Raniel De Jesus Nazarko', 'raniel.nazarko@escola.pr.gov.br',
'Olá! Meu nome é Raniel de Jesus Nazarko e atualmente estou cursando o 2º ano do Ensino Médio juntamente com o curso Técnico em Desenvolvimento de Sistemas. Pretendo futuramente cursar Engenharia de Software e construir uma carreira na área da tecnologia. Gosto de praticar diversos esportes como tênis de mesa, basquete, queimada e vôlei; entre todos eles, o vôlei é meu esporte favorito.'
WHERE NOT EXISTS (SELECT 1 FROM perfil WHERE id = 1);

INSERT INTO cursos (fk_perfil, nome, horas)
SELECT 1, 'Técnico em Desenvolvimento de Sistemas', NULL
WHERE NOT EXISTS (SELECT 1 FROM cursos WHERE fk_perfil = 1 AND nome = 'Técnico em Desenvolvimento de Sistemas');

INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Agrinho: crie seu projeto e se destaque', NULL, 'certificado1.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Agrinho: crie seu projeto e se destaque');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Arquitetura de computadores: por trás de como seu programa funciona', NULL, 'certificado2.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Arquitetura de computadores: por trás de como seu programa funciona');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Autômatos: criando uma simulação de um Robô em Marte', NULL, 'certificado3.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Autômatos: criando uma simulação de um Robô em Marte');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'BI com Excel: criando bancos de dados com planilhas', NULL, 'certificado4.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='BI com Excel: criando bancos de dados com planilhas');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'C: avançando na linguagem', NULL, 'certificado5.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='C: avançando na linguagem');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'C: conhecendo a Linguagem das Linguagens', NULL, 'certificado6.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='C: conhecendo a Linguagem das Linguagens');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Começando em Programação: carreira e primeiros passos', NULL, 'certificado7.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Começando em Programação: carreira e primeiros passos');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Decomposição: desenvolvendo um quiz sobre reciclagem', NULL, 'certificado8.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Decomposição: desenvolvendo um quiz sobre reciclagem');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Git e GitHub: compartilhando e colaborando em projetos', NULL, 'certificado9.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Git e GitHub: compartilhando e colaborando em projetos');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Introdução à computação: navegando pelo mundo digital', NULL, 'certificado10.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Introdução à computação: navegando pelo mundo digital');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Linguagem de programação: criando projetos artísticos com JavaScript', NULL, 'certificado11.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Linguagem de programação: criando projetos artísticos com JavaScript');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Linux: gerenciando diretórios, arquivos, permissões e processos', NULL, 'certificado12.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Linux: gerenciando diretórios, arquivos, permissões e processos');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Listas: criando o seu jogo de cartas com listas e padrões', NULL, 'certificado13.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Listas: criando o seu jogo de cartas com listas e padrões');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Lógica de programação: comece em lógica com o jogo Pong e JavaScript', NULL, 'certificado14.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Lógica de programação: comece em lógica com o jogo Pong e JavaScript');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Lógica de programação: mergulhe em programação com JavaScript', NULL, 'certificado15.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Lógica de programação: mergulhe em programação com JavaScript');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Minha janela: programando seu mundo', NULL, 'certificado16.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Minha janela: programando seu mundo');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Ordenando listas: brincando com dados estatísticos', NULL, 'certificado17.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Ordenando listas: brincando com dados estatísticos');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Praticando Python: condicionais if, elif e else', NULL, 'certificado18.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Praticando Python: condicionais if, elif e else');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Praticando Python: laços for e while', NULL, 'certificado19.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Praticando Python: laços for e while');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Projetos com programação: gerador inteligente de artigos', NULL, 'certificado20.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Projetos com programação: gerador inteligente de artigos');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Scratch 3: recursos avançados de um jogo 2D - parte 2', NULL, 'certificado21.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Scratch 3: recursos avançados de um jogo 2D - parte 2');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Scratch: arte generativa', NULL, 'certificado22.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Scratch: arte generativa');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Scratch: Programando seu jogo 2D Parte 1', NULL, 'certificado23.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Scratch: Programando seu jogo 2D Parte 1');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Troco 1: O jogo da venda', NULL, 'certificado24.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Troco 1: O jogo da venda');
INSERT INTO certificados (fk_perfil, titulo, ano, imagem)
SELECT 1, 'Troco 2: Desafios com decimais na computação', NULL, 'certificado25.jpg' WHERE NOT EXISTS (SELECT 1 FROM certificados WHERE fk_perfil=1 AND titulo='Troco 2: Desafios com decimais na computação');
