Feature: Crear un usuario en PetStore

  Scenario: Crear un nuevo usuario en PetStore
    Given url 'https://petstore.swagger.io/v2/user'
    And request
      """
      {
        "id": 987654,
        "username": "Prueba01",
        "firstName": "Paula",
        "lastName": "Prueba",
        "email": "prueba01@gmail.com",
        "password": "Clave123",
        "phone": "3001234567",
        "userStatus": 1
      }
      """
    When method post
    Then status 200
