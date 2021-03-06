Feature: As a aluno
         I want to atribuir conceitos às metas avaliadas numa disciplina em que estou matriculado
         so that eu posso fazer uma auto-avaliação do meu desempenho em cada meta

Scenario: auto-avaliação GUI (sucesso)
Given o aluno “João” está na “Página de metas”
And as metas exibidas na página são “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
When o aluno “João” atribui conceito “MA” para a meta “Entender conceitos de requisitos”
And o aluno “João” atribui conceito “MPA” para a meta “Especificar requisitos com qualidade”
And o aluno “João” atribui conceito “MANA” para a meta “Entender conceitos de gerência de configuração”
And o aluno “João” tenta submeter sua auto-avaliação
Then o aluno “João” vê uma mensagem de confirmação no envio de sua auto-avaliação

Scenario: auto-avaliação GUI (falha)
Given o aluno “João” está na “Página de metas”
And as metas exibidas na página são “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
When o aluno “João” atribui conceito “MA” para a meta “Entender conceitos de requisitos”
And o aluno “João” atribui conceito “MPA” para a meta “Especificar requisitos com qualidade”
And o aluno “João” tenta submeter sua auto-avaliação
Then o aluno “João” vê uma mensagem de erro

Scenario avaliações discrepantes GUI (sem discrepância)
Given eu sou um professor e estou na página de “Avaliação de alunos”
And os alunos exibidos são “João”, “Lucas” e “Matheus”
And as metas avaliadas são “Entender Conceitos de Requisitos”, “Especificar Requisitos com Qualidade”, “Entender Conceitos de Gerência de Configuração”, “Entender Conceitos de Gerenciamento de Projetos” e “Entender Conceitos de Refatoração”
And “João” possui conceitos “MANA”, “MA”, “MA”, “MA” e “MPA”; “Lucas” possui conceitos “MANA”, “MA”, “MA”, “MA” e “MPA”; “Matheus” possui conceitos “MANA”, “MA”, “MA”, “MA” e “MPA”, todos respectivamente em relação às metas avaliadas, em suas auto-avaliações
When eu atribuo os conceitos “MANA”, “MA”, “MA”, “MA” e “MPA” para “João”; “MANA”, “MA”, “MA”, “MA” e “MPA” para “Lucas”; “MANA”, “MA”, “MA”, “MA” e “MPA” para “Matheus”, todos respectivamente em relação às metas avaliadas
Then a lista de alunos com auto-avaliações discrepantes das avaliações feitas pelo professor é vazia

Scenario avaliações discrepantes GUI (com discrepância)
Given eu sou um professor e estou na página de “Avaliação de alunos”
And os alunos exibidos são “João”, “Lucas” e “Matheus”
And as metas avaliadas são “Entender Conceitos de Requisitos”, “Especificar Requisitos com Qualidade”, “Entender Conceitos de Gerência de Configuração”, “Entender Conceitos de Gerenciamento de Projetos” e “Entender Conceitos de Refatoração”
And “João” possui conceitos “MANA”, “MA”, “MA”, “MA” e “MPA”; “Lucas” possui conceitos “MANA”, “MA”, “MA”, “MA” e “MPA”; “Matheus” possui conceitos “MANA”, “MA”, “MA”, “MA” e “MPA”, todos respectivamente em relação às metas avaliadas, em suas auto-avaliações
When eu atribuo os conceitos “MANA”, “MA”, “MA”, “MA” e “MPA” para “João”; “MANA”, “MA”, “MA”, “MA” e “MPA” para “Lucas”; “MANA”, “MANA”, “MPA”, “MPA” e “MPA” para “Matheus”, todos respectivamente em relação às metas avaliadas
Then a quantidade de alunos com auto-avaliações discrepantes das avaliações feitas pelo professor é 1
And o percentual de alunos com auto-avaliações discrepantes das avaliações feitas pelo professor é 33%
And a lista de alunos com auto-avaliações discrepantes das avaliações feitas pelo professor contém o aluno “Matheus”

Scenario auto-avaliação SERVIDOR (sucesso)
Given as metas cadastradas no sistema são “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
When o aluno “João” atribui conceito “MA” para a meta “Entender conceitos de requisitos” , “MPA” para a meta “Especificar requisitos com qualidade” e “MANA” para a meta “Entender conceitos de gerência de configuração”
And o aluno “João” tenta submeter sua auto-avaliação
Then o sistema armazena as atribuições do aluno “João”

Scenario auto-avaliação SERVIDOR (falha)
Given as metas cadastradas no sistema são “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
When o aluno “João” atribui conceito “MA” para a meta “Entender conceitos de requisitos” e “MPA” para a meta “Especificar requisitos com qualidade” 
And o aluno “João” não atribui conceito a meta “Entender conceitos de gerência de configuração”
And o aluno “João” tenta finalizar a auto-avaliação
Then o sistema não armazena as atribuições do aluno “João”