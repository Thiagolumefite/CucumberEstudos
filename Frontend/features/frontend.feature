# encoding: UTF-8
# language: pt

  Funcionalidade: FRONTEND - Teste no formulário de login

    Cenário: Preencher os campos e efetuar login com sucesso
      Dado que eu acesso a url
      Quando preencho o campo "username"
      Quando preencho o campo "password"
      E efetuo click no botão "Login"
      Então deve-se receber a mensagem de "login"
      E efetuo click no botão "Logout"
      Então deve-se receber a mensagem de "logout"