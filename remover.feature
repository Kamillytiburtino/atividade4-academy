Feature: Remover um usuário
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"

    Scenario: Deve ser possível remover usuario que foi criado
        Given request { name: 'test123451', email: "1test1s234s12s251@gmail.com" }
        When method post 
        Then status 201
        * def userId = response.id

        Given path userId
        When method delete
        Then status 204
