Feature: Flujo completo de usuario en PetStore

  Background:
    * def baseUrl = 'https://petstore.swagger.io/v2'
    * def username = 'Prueba01'

  Scenario: Crear, consultar, actualizar, consultar nuevamente, eliminar usuario, verificar eliminación

  # 1. CREAR USUARIO - POST
  Given url baseUrl + '/user'
  And request
    """
    {
      "id": 987654,
      "username": "Prueba01",
      "firstName": "Paula",
      "lastName": "Prueba",
      "email": "Prueba01@gmail.com",
      "password": "Clave123",
      "phone": "3001234567",
      "userStatus": 1
    }
    """
    When method post
    Then status 200
    * print 'Respuesta de creación:', response

  # 2. CONSULTAR USUARIO - GET
    Given url baseUrl + '/user/' + username
    When method get
    Then status 200
    And match response.username == username
    And match response.firstName == 'Paula'
    And match response.email == 'Prueba01@gmail.com'
    * print 'Usuario creado y consultado:', response

    # 3. ACTUALIZAR USUARIO - PUT
    Given url baseUrl + '/user/' + username
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
    * print 'Respuesta de actualizacion:', response

    # 4. CONSULTAR CAMBIOS - GET
    Given url baseUrl + '/user/' + username
    When method get
    Then status 200
    And match response.username == username
    And match response.firstName == 'Juan'
    And match response.email == 'prueba02@gmail.com'
    * print 'Usuario actualizado:', response

    # 5. ELIMINAR USUARIO - DELETE
    Given url baseUrl + '/user/' + username
    When method delete
    Then status 200
    * print 'Respuesta de eliminacion:', response

    # 6. VERIFICAR ELIMINACION - GET
    Given url baseUrl + '/user/' + username
    When method get
    Then status 404
    * print 'Verificacion final: el usuario ya no existe'