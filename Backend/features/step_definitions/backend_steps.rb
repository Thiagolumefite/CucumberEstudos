# encoding: UTF-8

require 'httparty'
require 'json'
require 'rails'
require 'test/unit/assertions'

include Test::Unit::Assertions

Dado(/^que eu informado um CEP "([^"]*)"$/) do |cep_status|
  #nova_massa = []
  #@strCep = []
  #nova_linha = 0

  # Conta linhas de massa de dados
  #for linha in 0..@massa.size-1

    # Quebra linha em colunas
    #@strCep = @massa[linha].sub!('["','').to_s.strip.split(';')
    #nova_massa = @massa[linha].split(";")

    # Se nesta linha existe o status atual (valido ou invalido)
    #if nova_massa.include? cep_status[0]
    #  puts cep_status + " - " + nova_massa[0]

    #  if @strCep[0].include? ' ["'
    #    @strCep = Array.new(nova_linha, nova_massa[0].sub!(' ["',''))
    #  else
    #    @strCep = Array.new(nova_linha, nova_massa[0])
    #  end

    #  nova_linha += 1
    #end

  #end

  case cep_status
    when "valido"
      cep = @massa[0].split(';')
      @strCep = cep[0]

   when "invalido"
      cep = @massa[1].split(';')
      @strCep = cep[0]
  end

end

Entao(/^response code igual "([^"]*)"$/) do |codigo_resposta|

  begin
    response = HTTParty.get("http://correiosapi.apphb.com/cep/" + @strCep)
    body = JSON.parse(response.body)

    codigo_resposta_atual = response.code.to_s

    if codigo_resposta == "200"
      puts "Teste de CEP válido"
    elsif codigo_resposta == "404"
      puts "Teste de CEP inválido"
    end

    puts "Código de resposta: " + codigo_resposta

    # Response code: 200 (CEP válido), 404 (CEP inválido)
    if codigo_resposta == "200"
      puts "Cep: " + body["cep"]
      puts "Tipo de Logradouro: " + body["tipoDeLogradouro"]
      puts "Logradouro: " + body["logradouro"]
      puts "Bairro: " + body["bairro"]
      puts "Cidade: " + body["cidade"]
      puts "Estado: " + body["estado"]
    end

    assert_equal codigo_resposta, codigo_resposta_atual

  rescue Exception => exc
    if codigo_resposta == "404"
      puts "Cep " + @strCep + " inválido!"
    end

    assert_equal codigo_resposta, codigo_resposta_atual
  end

end