Feature: Encontrar Usuário
    Como uma pessoa qualquer
    Para visualizar as informações deste usuário
    Desejo consultar os dados de um usuário

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"
        * def payload = { name: 'Maria', email: "maria0@gmail.com" }
     
    Scenario: Deve ser possível criar um usuário e encontrar o usuário pelo Id criado
        Given request payload
        When method post 
        Then status 201
        * def userId = response.id

        Given path userId
        When method get
        Then status 200
        And match response contains payload
