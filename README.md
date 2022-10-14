# README

Projeto da disciplina de GPTI(Gestão de Projetos de Tecnologia da Informação) do curso de graduação de Sistemas de Informação. O projeto trata de uma aplicação para o gerenciamento de disciplinas. Desta forma, como principal funcionalidade do sistema, temos a criação de exames para aplicação online aos alunos matriculados em disciplinas.

O framework utilizado para o desenvolvimento desta aplicação é o Ruby on Rails, que é um framework para desenvolvimento web e que utiliza a linguagem de programação Ruby. Para banco de dados foi escolhido o Postgres, já que para aplicações em ruby ele é bastante confiável, além disso, a integração deste banco de dados na plataforma de hospedagem Heroku é de fácil implementação. 

Para o design da interface decidimos utilizar do framework bootstrap, desta forma facilitando a criação de elementos de interface no geral. Com o bootstrap, é possível criar interfaces de forma rápida e precisa com relação aos wireframes e protótipos criados.

Durante o desenvolvimento é importante que o código seja testado, por conta disso e do Ruby on Rails ser um framework que tem muitas bibliotecas para facilitar a criação de testes automatizados, utilizamos de algumas bibliotecas para auxiliarmos na criação de testes de aceitação.

## Ruby on Rails Version

Ruby Version - 3.1.2 

Rails Version - 7.0.4

## Principais dependências 

| Dependência  | Versão          | Fonte                                                           | Descrição                                              |
|--------------|-----------------|-----------------------------------------------------------------|--------------------------------------------------------|
| Postgresql   | 14              | https://www.postgresql.org/                                     | Banco de dados utilizado para produção.                |
| Bootstrap    | 5.2             | https://getbootstrap.com/docs/5.2/getting-started/introduction/ | Framework para desenvolvimento front-end.              |
| SQLite3 Gem  | 1.5.3 or newer  | https://rubygems.org/gems/sqlite3                               | Banco de dados utilizado para desenvolvimento e teste. |
| Capybara Gem | 3.37.1 or newer | https://rubygems.org/gems/capybara/versions/3.37.1              | Gem utilizada para teste.                              |
| Selenium Gem | 0.2.11 or newer | https://rubygems.org/gems/selenium                              | Gem utilizada para teste.                              |
| Cucumber Gem | 8.0.0 or newer  | https://rubygems.org/gems/cucumber                              | Framework de testes de aceitação.                      |

## Como fazer o setup do ambiente de desenvolvimento?

É recomendado que o ambiente de desenvolvimento utilizado seja um sistema unix based, pois a instalação do framework Ruby on Rails é mais fácil em sistemas do tipo. Após a instalação do ruby e do rails nas versões especificicadas, basta rodar os seguintes comandos para ter um ambiente de desenvolvimento funcional:

1. Estando na pasta raiz do projeto, execute este comando: $bundle install. Desta forma todas as gems necessárias serão instaladas na sua máquina.

2. Pronto, agora caso queira rodar o servidor web para testar a aplicação, basta digitar este comando: $rails server. Através da porta 3000 no ip de loopback(127.0.0.1) será possível acessar a aplicação.

## Deploy

Como principal plataforma de deploy temos o Heroku, pelo qual o deploy foi automatizado. Desta forma, ao subir alterações no Github para a branch principal, no caso a branch main, essas alterações passam por deploy no Heroku automaticamente, onde é gerado uma nova build e todos os passos necessários para possuir a aplicação em produção são executados. Por conta das alterações na branch main irem diretamente para produção é de extrema importância que seja executado um suite de testes antes que qualquer alteração possa ser inserida na branch main. Portanto, estamos utilizando de GitHub Actions que testa se a aplicação está buildando e executa um suite de testes de aceitação, assim garantindo que nossa aplicação está funcionando antes de um deploy. 
Assim, para enviar qualquer nova alteração para produção, só é necessário subir esta alteração para a branch main. Contanto que não haja erros adicionados pela alteração, as alterações poderão ser mergeadas na branch main e passaram por deploy para produção.
