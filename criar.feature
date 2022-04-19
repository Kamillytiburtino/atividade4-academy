Feature: Criar usuários
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"
         * def email = java.util.UUID.randomUUID() + "@teste.com";


    Scenario: Deve ser possível cadastrar um novo usuário
        And request { name: "Kamilly", email: "#(email)" }
        When method post 
        Then status 201
        And match response contains {name: "Kamilly", email: "#(email)"}

    Scenario: Deve gerar um erro se tentar cadastrar usuário com o mesmo email
        And request { name: "Kamilly", email: "#(email)" }
        When method post 
        Then status 201
        And match response contains {name: "Kamilly", email: "#(email)"}

        And request { name: "Kamilly", email: "#(email)" }
        When method post 
        Then status 422
        And match response contains {error: "User already exists."}

     Scenario: Deve apresentar o erro 400 caso as informações não sejam válidas
        Given request { name: "Kamilly", email: " " }
        When method post 
        Then status 400
        # Esta criando usuário com nome em branco, considerando espaços.
        Given request { name: "  ", email: "#(email)" }
        When method post 
        Then status 400
