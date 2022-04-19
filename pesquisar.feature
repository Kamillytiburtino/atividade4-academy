Feature: Pesquisar Usuário
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/Search"
        

    Scenario: Deve ser possível pesquisar um usuário pelo nome
        * def validResponse = { id: "#string", name: "Luzia Lima", email: "#string", createdAt: "#string", updatedAt: "#string"}

        Given param value = "Luzia Lima"
        When method get
        Then status 200
        And match response == "#array"
        And match each response == validResponse

    Scenario: Deve ser possível pesquisar um usuário pelo email
        * def validResponse = { id: "#string", name: "#string", email: "Luzialima@gmail.com", createdAt: "#string", updatedAt: "#string"}

        Given param value = "Luzialima@gmail.com"
        When method get
        Then status 200
        And match response == "#array"
        And match each response == validResponse