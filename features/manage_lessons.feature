# language: pt
Funcionalidade: Gerenciando Aulas

  Eu como professor
  Quero poder cadastrar e gerenciar as aulas
  Para depois poder publicá-las online

  @javascript
  Cenário: Cadastrando uma aula
    Dado que eu estou na listagem de aulas
    Quando eu clico "Nova aula"
    E eu espero um pouco
    E eu preencho "Título" com "Como comer rosquinhas"
    E eu preencho "Professor" com "Homer Simpson"
    E eu preencho "Curso" com ""
    E eu aperto "Criar"
    Então eu devo estar na listagem de aulas
    E eu devo ver "Aula cadastrada com sucesso"
    E eu devo ver "Como comer rosquinhas"