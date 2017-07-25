# encoding: UTF-8
# language: pt

  Funcionalidade: BACKEND - Teste API Correios

    Cenário: Teste API Correios CEP válido
      Dado que eu informado um CEP "valido"
      Entao response code igual "200"

    Cenário: Teste API Correios CEP inválido
      Dado que eu informado um CEP "invalido"
      Entao response code igual "404"