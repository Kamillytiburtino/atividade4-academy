Feature: Encontrar Usuário
    Como uma pessoa qualquer
    Para visualizar as informações deste usuário
    Desejo consultar os dados de um usuário

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"
        * def email = java.util.UUID.randomUUID() + "@teste.com";
        * def payload = { name: 'Maria', email: "#(email)" }
     
    Scenario: Deve ser possível criar um usuário e encontrar o usuário pelo Id criado
        Given request payload
        When method post 
        Then status 201
        * def userId = response.id

        Given path userId
        When method get
        Then status 200
        And match response contains payload

    Scenario: Deve retornar um erro 400 quando o Id for incorreto
        Given path "123456"
        When method get
        Then status 400

    Scenario: Deve retornar um erro 404 quando o Id não existir
        Given path java.util.UUID.randomUUID();
        When method get
        Then status 404