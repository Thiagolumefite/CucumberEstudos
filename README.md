# Automação Cucumber + Ruby + Capybara

## Criando ambiente basico Ruby em Windows

### Instalação Ruby

Seguir os passos abaixo:
	
- Acessar a url https://rubyinstaller.org/downloads/
- Baixar o **instalador** e o **Development Kit** do Ruby (Obs: a versão deve ser >= 1.9.3 e <= 2.1.0)
- Executar o instalador (no instalador selecione todas as opções do checkbox)
- gem Intall Bundler
### Instalação Development Kit

- Descompactar o arquivo do **Development Kit** em C:\WebkitRuby.
- Abra o prompt de comando (cmd) e digitar os comandos abaixo:

	C:\Users\Usuários>cd \
	C:\>cd WebkitRuby
	C:\WebkitRuby>ruby dk.rb
	C:\WebKitRuby>ruby dk.rb init
	C:\WebKitRuby>ruby dk.rb review
	C:\WebKitRuby>ruby dk.rb install
		
**IMPORTANTE:**
Se ocorrer erro de certificado SSL:

	C:\WebkitRuby>rgem source -a http://rubygems.org
	C:\WebkitRuby>rgem source --remove https://rubygems.org


## Frontend

### Instalação Gems

caso tenha criado do arquivo Gemfile e tenha instalado com sucesso o Bundler
	- execute "bundler install"

senão execute os comandos abaixo:
	C:\WebKitRuby>gem install activesupport
	C:\WebKitRuby>gem install selenium-webdriver
	C:\WebKitRuby>gem install chromedriver-helper
	C:\WebKitRuby>gem install rspec
	C:\WebKitRuby>gem install capybara
	C:\WebKitRuby>gem install gherkin

## Backend

### Instalação Gems
caso tenha criado do arquivo Gemfile e tenha instalado com sucesso o Bundler
	- execute "bundler install"

senão execute os comandos abaixo:

	C:\WebKitRuby>gem install httparty
	C:\WebKitRuby>gem install json
	C:\WebKitRuby>gem install rails
	
## Execução

D:\Cucumber\Frontend>cucumber

D:\Cucumber\Backend>cucumber

**IMPORTANTE:** A pasta do projeto foi criada em D:\Cucumber, mas poderia ter sido criada em qualquer outro local