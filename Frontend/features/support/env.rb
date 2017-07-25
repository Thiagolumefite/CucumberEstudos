# encoding: UTF-8
require 'csv'
require 'capybara/cucumber'
require 'selenium-webdriver'

Before do
# arrays
  linhas = []

# arquivo csv "massa_dados_teste.csv"
  path = File.dirname(__FILE__) + "/massa_teste/massa_dados_teste.csv"

# lê arquivo e monta array de massa de dados
  CSV.foreach(File.path(path)) do |row|
    # linhas do arquivo
    linhas << row
  end

# colunas da linha atual
  campos = linhas.to_s.sub!('[["','').sub!('"]]','').to_s.split(";")

  @massa = campos
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 60
