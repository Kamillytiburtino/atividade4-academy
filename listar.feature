Feature: Listar usuários
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"
        * def validUser = { id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}
       
    Scenario: Deve ser possível listar usuários
        When method get
        Then status 200
        And match response == "#array"
        And match each response == validUser