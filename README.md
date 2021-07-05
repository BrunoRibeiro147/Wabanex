# Wabanex

Projeto desenvolvido durante a NLW Together:

Esta aplicação é um gerenciador de atividades fisicas, sendo possível a criação de um usuário e criar para ele um treino contendo vários exercícios, apesar de simples foi possível aprender vários conceitos com a criação dessa aplicação sendo eles:

- GraphQL
- Ecto para salvamento no banco de dados
- Realização de testes 
- Migrations
- Schemas
- Roteamento

### Ferramentas Utilizadas:
- Phoenix
- Credo
- Absinthe
- Ecto


Para iniciar a aplicação:

  * Instale as dependÊncias com `mix deps.get`
  * Crie um banco de dados postgres, por padrão o database é: `wabanex_dev` com a senha: `1234`, após criar o banco rode o comando: `mix ecto.setup`
  * Inicie o servidor com`mix phx.server`

Agora é só entrar em [`localhost:4000`](http://localhost:4000) no seu navegador.
