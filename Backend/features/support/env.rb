# encoding: UTF-8

require 'httparty'
require 'json'
require 'rails'

# Le arquivo de massa de dados
Before do
  # arrays
  linhas = []

  # arquivo csv "massa_dados_teste.csv"
  path = File.dirname(__FILE__) + "/massa_teste/cep.csv"

  # lê arquivo e monta array de massa de dados
  CSV.foreach(File.path(path)) do |row|
    # linhas do arquivo
    linhas << row
  end

  # colunas da linha atual
  campos = linhas.to_s.sub!('[["','').sub!('"]]','').sub!('"]','').sub!('["','').sub!(' ','').split(',')
  #campos = linhas.inspect.to_s.sub!('[["','').sub!('"]]','').split(",")

  @massa = campos
end