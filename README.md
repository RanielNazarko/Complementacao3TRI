# Portfólio escolar com MySQL

Projeto escolar em Node.js, Express, EJS e MySQL. A aparência foi baseada no portfólio original e os arquivos de imagem foram reunidos em `imagens/`.

## Requisitos
- Node.js e npm instalados.
- MySQL Server em execução.
- MySQL Workbench.

## 1. Preparar o banco
1. Abra o MySQL Workbench e conecte-se ao servidor local.
2. Crie o banco, caso ainda não exista, executando:

```sql
CREATE DATABASE IF NOT EXISTS escola_backend CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. Abra `src/database/banco.sql` e execute o script inteiro. Ele cria as tabelas e insere o perfil, o curso e os 25 certificados. Os anos dos certificados e a carga horária do curso ficam.

> Se as tabelas já existirem, o script usa `CREATE TABLE IF NOT EXISTS`. Os dados de exemplo são inseridos apenas quando ainda não há um registro correspondente.

## 2. Configurar a conexão
Na pasta do projeto, crie um arquivo `.env` copiando o `.env.example`. Preencha `DB_USER` e `DB_PASSWORD` com as credenciais locais do MySQL. Não envie `.env` ao GitHub.

Exemplo de configuração (substitua a senha de exemplo pela sua senha local):

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=sua_senha_local
DB_NAME=escola_backend
PORT=3000
```

## 3. Instalar e iniciar
Abra o terminal do VS Code na pasta que contém `package.json` e execute:

```bash
npm install
npm start
```

Depois, abra no navegador: http://localhost:3000/portifolio

Para verificar se a conexão com o banco funciona, abra http://localhost:3000/health. Uma resposta com `"status":"ok"` indica que o servidor conseguiu consultar o MySQL.

## Estrutura principal

```text
src/
  app.js
  database/
    conexao.js
    banco.sql
  routes/
    portfolio.routes.js
  controllers/
    portfolio.controller.js
  services/
    perfil.service.js
    curso.service.js
    certificado.service.js
  repositories/
    perfil.repository.js
    curso.repository.js
    certificado.repository.js
  views/
    portfolio.ejs
imagens/
docs/
  mer.png
.env.example
.gitignore
README.md
package.json
```

## Arquitetura
- **Router:** define os caminhos HTTP.
- **Controller:** recebe a requisição e prepara os dados da página.
- **Service:** concentra a lógica da aplicação.
- **Repository:** executa consultas SQL parametrizadas.
- **Database:** `conexao.js` fornece o pool de conexões MySQL; `banco.sql` cria as tabelas e os dados iniciais.

As consultas SQL da aplicação ficam nos arquivos de repository. A view EJS apenas apresenta os dados recebidos.

## Tabelas
- `perfil`: dados básicos e descrição.
- `cursos`: cursos ligados a um perfil por `fk_perfil`.
- `certificados`: títulos, ano opcional e nome do arquivo de imagem, ligados ao perfil por `fk_perfil`.

A coluna `imagem` foi adicionada à tabela `certificados` para relacionar cada certificado à imagem original. A coluna `ano` aceita `NULL`, pois o projeto antigo não continha o ano de conclusão.
