PRUEBAS DE API REST - PETSTORE CON KARATE

1. Descripción del proyecto

Este proyecto automatiza pruebas de servicios REST de la API de demostración PetStore utilizando Karate, Java, JUnit 5 y Maven.

El objetivo es validar las operaciones principales de gestión de usuarios: creación, consulta, actualización y eliminación,
así como la verificación de los datos y de la respuesta del servicio.

API utilizada:
https://petstore.swagger.io/v2

2. Tecnologías utilizadas

- Java JDK 21
- Apache Maven
- Karate 2.1.4
- JUnit 5
- IntelliJ IDEA
- API REST PetStore

3. Requisitos previos

Antes de ejecutar el proyecto, se debe tener instalado:

1. Java JDK 21 o una versión compatible con la configuración del proyecto.
2. Apache Maven.
3. Git, si se desea descargar el repositorio desde GitHub.
4. Conexión a internet para acceder a la API PetStore.

Para verificar las instalaciones, abrir una terminal y ejecutar:

java -version

mvn -version

4. Descargar el proyecto

Clonar el repositorio público desde GitHub:

git clone URL_DEL_REPOSITORIO

Ingresar a la carpeta del proyecto:

cd PruebaPetStore

5. Estructura del proyecto

- pom.xml: contiene las dependencias y la configuración de Maven.
- src/test/java/PetStoreTest.java: clase Java que ejecuta las pruebas de Karate.
- src/test/resources/crear-usuario.feature: prueba de creación.
- src/test/resources/consultar-usuario.feature: prueba de consulta.
- src/test/resources/actualizar-usuario.feature: prueba de actualización.
- src/test/resources/eliminar-usuario.feature: prueba de eliminación.
- src/test/resources/verificar-eliminacion.feature: verifica que el usuario eliminado ya no se encuentre disponible.
- src/test/resources/flujo-usuario.feature: escenario integrado que ejecuta las operaciones en orden.

6. Ejecutar las pruebas

Abrir una terminal en la carpeta raíz del proyecto, donde se encuentra el archivo pom.xml.

Ejecutar:

mvn clean test

El comando clean elimina los archivos generados en ejecuciones anteriores y test compila y ejecuta las pruebas configuradas.

Para ejecutar específicamente el flujo integrado, verificar que PetStoreTest.java tenga ruta hacia:

Runner.path("src/test/resources/flujo-usuario.feature")

Después, ejecutar el método de prueba desde IntelliJ IDEA o utilizar el comando Maven anterior.

Importante: la ruta configurada en PetStoreTest.java determina qué archivo o carpeta de Karate se ejecuta. Si apunta a una carpeta, se ejecutarán los archivos .feature encontrados allí; si apunta al flujo integrado, se ejecutará ese archivo.

7. Consultar los reportes

Después de ejecutar las pruebas, Karate genera un reporte HTML con los resultados de la ejecución.

Opción 1. Abrir el reporte desde el navegador
Dirígete a la carpeta target/karate-reports/ dentro del proyecto.
Busca el archivo karate-summary.html.
Haz doble clic sobre el archivo para abrirlo en el navegador.

Opción 2. Visualizar el reporte desde IntelliJ IDEA
Si no puedes abrir el reporte ingresando la ruta o URL en el navegador, sigue estos pasos:
Abre el proyecto en IntelliJ IDEA.
Dirígete a la carpeta target/karate-reports/.
Haz clic izquierdo sobre el archivo karate-summary.html para seleccionarlo.
Haz clic derecho sobre el archivo y selecciona la opción Run 'Karate Summary with Coverage', si aparece disponible.
Espera a que IntelliJ ejecute la acción y muestre el reporte.

Nota: El reporte se genera después de ejecutar las pruebas. Si no encuentras el archivo karate-summary.html, ejecuta nuevamente las pruebas y verifica que se haya creado la carpeta target/karate-reports/.

8. Consideraciones

- La API PetStore es un servicio público de demostración y sus datos pueden ser compartidos, modificados o reiniciados.
- El usuario de prueba utilizado es Prueba01.
- La ejecución requiere conexión a internet.
- Los resultados pueden variar debido a la disponibilidad y al comportamiento del servicio externo.
- Para reproducir el flujo completo, ejecutar el archivo flujo-usuario.feature y comprobar el resultado en el reporte HTML.
