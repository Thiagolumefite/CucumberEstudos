# encoding: UTF-8
require 'capybara/cucumber'
require 'selenium-webdriver'


# Acessa url so sistema
Dado(/^que eu acesso a url$/) do
  visit @massa[0]
end

# Preenche Campos
Quando(/^preencho o campo "([^"]*)"$/) do |nome_campo|

  case nome_campo
    when "username"
      fill_in(nome_campo,:with => @massa[1])
    when "password"
      fill_in(nome_campo,:with => @massa[2])
  end
end

# Botão login e logout
E(/^efetuo click no botão "([^"]*)"$/) do |nome_botao|
  case nome_botao
	when "Login"
		find_button(nome_botao).click
	when "Logout"
		#find(:css,'button secondary radius').click
		find(:xpath,'//*[@id="content"]/div/a').click
	end

end

# Valida mensagem de login e logout
Então(/^deve\-se receber a mensagem de "([^"]*)"$/) do |msg|

  case msg
    when "login"
      page.has_content?(@massa[3])
    when "logout"
      page.has_content?(@massa[4])
  end
end