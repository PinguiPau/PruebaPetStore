Feature: Consultar un usuario en PetStore

  Scenario: Consultar un usuario existente
    Given url 'https://petstore.swagger.io/v2/user/Prueba01'
    When method get
    * print response
    Then status 200
    And match response.username == 'Prueba01'
    And match response.firstName == 'Paula'
    And match response.email == 'prueba01@gmail.com'
