Feature: Pesquisar Usuário
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/Search"
     
    Scenario: Deve ser possível pesquisar um usuário pelo nome
        Given param value = "Luzia"
        When method get
        Then status 200
        And match response == "#array"

    Scenario: Deve ser possível pesquisar um usuário pelo email
        Given param value = "Luzialima@gmail.com"
        When method get
        Then status 200
        And match response == "#array"