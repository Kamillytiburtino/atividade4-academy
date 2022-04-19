Feature: Atulizar usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

    Background: Base Url
        Given url "http://crud-api-academy.herokuapp.com/api/v1/users"
        * def email =  java.util.UUID.randomUUID() + "@teste.com";

        * def payloadUpdate = {name: "Luzia Lima", email: "#(email)"}
        * def payload = { name: 'Maria', email: "#(email)" }
        Given request payload
        When method post 
        Then status 201
        * def userId = response.id

    Scenario: Deve ser possível atualizar o usuário cadastrado
        Given path userId
        And request  payloadUpdate
        When method put
        Then status 200
        And match response contains payloadUpdate

    Scenario: Deve apresentar o erro 400 caso o email não seja válido
        Given path userId
        And request { name: "Kamilly", email: " " }
        When method put 
        Then status 400
        
    Scenario: Deve apresentar o erro 400 caso o nome não seja válido
        Given path userId
        Given request { name: "", email: "#(email)" }
        When method put 
        Then status 400

    Scenario: Deve retornar um erro 404 quando o Id não existir
        Given path java.util.UUID.randomUUID();
        And request payloadUpdate
        When method put
        Then status 404

    Scenario: Deve retornar erro 422 quando o email já estiver cadastrado
        * def newEmail = java.util.UUID.randomUUID() + "@teste.com"
        Given request { name: "Maria", email: "#(newEmail)"  }
        When method post 
        Then status 201
        * def id = response.id

        Given path id
        And request { name: "test", email: "#(email)" } 
        When method put 
        Then status 422
