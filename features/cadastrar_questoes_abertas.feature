#language: pt

Funcionalidade: Cadastrar questões abertas
Como professor
Eu quero cadastrar questões abertas no banco de dados
De modo que eu possa usá-las nas provas

Cenário: Cadastro de questão aberta com sucesso
Dado que estou na página de cadastro de questão
Quando preencho o campo "Description" com "Descrição de teste"
Quando preencho o campo "PossibleReply" com "Possível resposta"
E clico em 'Salvar'
Então a questão deve ter sido salva no banco de dados
E deverei ver ela na página de listagem de questões abertas

Cenário: Cadastro de aluno com erro
Dado que estou na página de cadastro de aluno
Quando preencho o campo "Email" com "miguel.vasconcelos@usp.br"
E deixo o campo "Nome" vazio
E clico em salvar
Então deverei ver a mensagem de erro "É obrigatório informar o nome!"

Cenário: Cadastro de aluno com erro - sem e-mail
Dado que estou na página de cadastro de aluno
Quando preencho o campo "Nome" com "Miguel Vasconcelos"
E deixo o campo "Email" vazio
E clico em salvar
Então deverei ver a mensagem de erro "É obrigatório informar o email!"

Cenário: Cadastro de aluno com erro - e-mail inválido
Dado que estou na página de cadastro de aluno
Quando preencho o campo "Nome" com "Miguel Vasconcelos"
E preencho o campo "Email" com "a!1ç....,,,´/ ? @a"
E clico em salvar
Então deverei ver a mensagem de erro "Formato de e-mail inválido!"