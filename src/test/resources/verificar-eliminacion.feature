Feature: Verificar eliminación de usuario en PetStore

  Scenario: Verificar eliminación
  Given url 'https://petstore.swagger.io/v2/user/Prueba01'
  When method get
  Then status 404