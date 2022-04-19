Feature: Criar usuários
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"
        
        
    Scenario: Deve ser possível cadastrar um novo usuário
        * def email = "abacate@teste.com"+ "Bella"

        And request { name: "Kamilly", email: "#(email)" }
        When method post 
        Then status 201
        And match response contains {name: 'Luzia', email: "Luzia@gmail.com"}
