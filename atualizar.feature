Feature: Atulizar usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"
        * def userId = "c68775e4-a1fd-455a-bcba-bb7e77e736b5"
        * def payloadUpdate = {name: "Luzia Lima", email: "Luzialima00@gmail.com"}

    Scenario: Deve ser possível atualizar o usuário cadastrado
        Given path userId
        And request payloadUpdate
        When method put
        Then status 200
        And match response contains payloadUpdate