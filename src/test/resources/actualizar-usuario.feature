Feature: Actualizar informacion de usuario

  Scenario: Actualizar datos
    Given url 'https://petstore.swagger.io/v2/user/Prueba01'
    And request
      """
      {
        "id": 987654,
        "username": "Prueba01",
        "firstName": "Juan",
        "lastName": "Prueba",
        "email": "prueba02@gmail.com",
        "password": "Clave123",
        "phone": "3001234567",
        "userStatus": 1
      }
      """
    When method put
    Then status 200
