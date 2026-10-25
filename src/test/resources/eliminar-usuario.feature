Feature: Eliminar un usuario en PetStore

  Scenario: Eliminar un usuario existente
  Given url 'https://petstore.swagger.io/v2/user/Prueba01'
  When method delete
  Then status 200