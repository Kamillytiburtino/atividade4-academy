Feature: Listar usuários
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"
       
    Scenario: Deve ser possível listar usuários
        When method get
        Then status 200
        And match response == "#array"
    
