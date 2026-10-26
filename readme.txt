=====================================================================================================
PRUEBAS DE API REST - PETSTORE CON KARATE
=====================================================================================================

1. Descripción del proyecto

Este proyecto automatiza pruebas de servicios REST de la API de demostración PetStore utilizando Karate, Java, JUnit 5 y Maven.

El objetivo es validar las operaciones principales de gestión de usuarios: creación, consulta, actualización y eliminación,
así como la verificación de los datos y de la respuesta del servicio.

API utilizada:
https://petstore.swagger.io/v2
---------------------------------------------------------------------------------------------------------
2. Tecnologías utilizadas

- Java JDK 21
- Apache Maven
- Karate 2.1.4
- JUnit 5
- IntelliJ IDEA
- API REST PetStore
---------------------------------------------------------------------------------------------------------
3. Requisitos previos

Antes de ejecutar el proyecto, se debe tener instalado:

1. Java JDK 21 o una versión compatible con la configuración del proyecto.
2. Apache Maven.
3. Git, si se desea descargar el repositorio desde GitHub.
4. Conexión a internet para acceder a la API PetStore.

Para verificar las instalaciones, abrir una terminal y ejecutar:

java -version

mvn -version
---------------------------------------------------------------------------------------------------------
4. Descargar el proyecto

Clonar el repositorio público desde GitHub:

git clone https://github.com/PinguiPau/PruebaPetStore.git

Ingresar a la carpeta del proyecto 

---------------------------------------------------------------------------------------------------------
5. Estructura del proyecto

- pom.xml: contiene las dependencias y la configuración de Maven.
- src/test/java/PetStoreTest.java: clase Java que ejecuta las pruebas de Karate.
- src/test/resources/crear-usuario.feature: prueba de creación.
- src/test/resources/consultar-usuario.feature: prueba de consulta.
- src/test/resources/actualizar-usuario.feature: prueba de actualización.
- src/test/resources/eliminar-usuario.feature: prueba de eliminación.
- src/test/resources/verificar-eliminacion.feature: verifica que el usuario eliminado ya no se encuentre disponible.
- src/test/resources/flujo-usuario.feature: escenario integrado que ejecuta las operaciones en orden.
---------------------------------------------------------------------------------------------------------
6. Ejecutar las pruebas

Abrir una terminal de IntelliJ IDEA en la carpeta raíz del proyecto, donde se encuentra el archivo pom.xml.

Ejecutar:

mvn clean test

El comando clean elimina los archivos generados en ejecuciones anteriores y test compila y ejecuta las pruebas configuradas.

Para ejecutar específicamente el flujo integrado, verificar que PetStoreTest.java tenga ruta hacia:

Runner.path("src/test/resources/flujo-usuario.feature")

Después, ejecutar el método de prueba desde IntelliJ IDEA o utilizar el comando Maven anterior.

Importante: la ruta configurada en PetStoreTest.java determina qué archivo o carpeta de Karate se ejecuta. Si apunta a una carpeta, se ejecutarán los archivos .feature encontrados allí; si apunta al flujo integrado, se ejecutará ese archivo.
---------------------------------------------------------------------------------------------------------
7. Consultar los reportes

Después de ejecutar las pruebas, Karate genera un reporte HTML con los resultados de la ejecución.

Opción 1. Abrir el reporte desde el navegador
Dirígete a la carpeta target/karate-reports/ dentro del proyecto en el explorador del archivos.
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
---------------------------------------------------------------------------------------------------------
8. Consideraciones

- La API PetStore es un servicio público de demostración y sus datos pueden ser compartidos, modificados o reiniciados.
- El usuario de prueba utilizado es Prueba01.
- La ejecución requiere conexión a internet.
- Los resultados pueden variar debido a la disponibilidad y al comportamiento del servicio externo.
- Para reproducir el flujo completo, ejecutar el archivo flujo-usuario.feature y comprobar el resultado en el reporte HTML.
--------------------------------------------------------------------------------------------------------------
9. RESOLUCIÓN DE INCIDENTES COMUNES 

Durante la configuración y ejecución del proyecto de automatización de pruebas
REST PetStore con Karate, Java, Maven y JUnit, se presentaron algunos
inconvenientes relacionados con las dependencias o la configuración del runner

En esta sección se documentan los problemas encontrados y las soluciones
aplicadas para que el usuario pueda reconocerlos y resolverlos si vuelve a
presentarse una situación similar.

--------------------------------------------------------------------------------
INCIDENTE 1: INTELLIJ IDEA NO RECONOCÍA LAS CLASES DE KARATE Y JUNIT
--------------------------------------------------------------------------------

Problema presentado:

Al configurar la clase Java encargada de ejecutar las pruebas, IntelliJ IDEA
mostraba errores en las importaciones y no reconocía algunas clases necesarias
para la ejecución, como Karate y el runner de pruebas.

También aparecieron mensajes similares a:

    Cannot resolve symbol 'junit6'
    Cannot resolve symbol 'Karate'

Causa identificada:

Las dependencias necesarias para utilizar Karate con JUnit no estaban
correctamente reconocidas por el proyecto.

Solución aplicada:

1. Abrir el archivo pom.xml ubicado en la raíz del proyecto.
2. Verificar la configuración de las dependencias de Maven.
3. Incorporar la dependencia correspondiente a Karate para JUnit 6, versión
   2.1.4, según la configuración utilizada en el ejercicio:

       io.karatelabs:karate-junit6:2.1.4

4. Guardar los cambios realizados en pom.xml.
5. Abrir la ventana Maven de IntelliJ IDEA.
6. Seleccionar Reload All Maven Projects para actualizar las dependencias.
7. Esperar a que Maven termine de descargar y reconocer las librerías.
8. Comprobar nuevamente las importaciones de la clase Java.

Si las dependencias todavía no se reconocen, se puede intentar ejecutar:

    mvn -U test

Este comando solicita a Maven que compruebe nuevamente las actualizaciones
de las dependencias durante la resolución del proyecto.

Resultado obtenido:

Las dependencias quedaron disponibles para continuar con la configuración
del runner y la ejecución de los escenarios de Karate.

--------------------------------------------------------------------------------
INCIDENTE 2: ERROR "INVALIDPATH ILLEGAL CHAR <:> AT INDEX 9: CLASSPATH:"
--------------------------------------------------------------------------------

Problema presentado:

Al ejecutar la clase Java encargada de lanzar las pruebas, apareció un error
relacionado con una ruta inválida:

    InvalidPath Illegal char <:> at index 9: classpath:

Causa identificada:

La ruta proporcionada al runner de Karate estaba utilizando el prefijo
classpath: de una manera que no era compatible con la configuración utilizada
en el proyecto.

En este caso, Java interpretó la cadena de ruta como una ruta del sistema
de archivos y encontró un carácter no válido para esa interpretación.

Solución aplicada:

1. Abrir el archivo:

       src/test/java/PetStoreTest.java

2. Localizar la configuración del runner, específicamente la llamada a
   Runner.path(...).

3. Reemplazar la ruta que estaba provocando el error por la ruta del archivo
   de prueba expresada como ruta relativa al proyecto.

   Configuración utilizada para verificar el escenario de consulta:

       Runner.path("src/test/resources/consultar-usuario.feature")

4. Guardar los cambios.
5. Abrir la terminal en la carpeta raíz del proyecto, donde se encuentra
   pom.xml.
6. Ejecutar nuevamente:

       mvn clean test

Resultado obtenido:

La prueba se ejecutó correctamente. Maven mostró un resultado equivalente a:

    Tests run: 1, Failures: 0, Errors: 0

    BUILD SUCCESS

Además, el reporte de Karate registró un escenario aprobado y ninguno fallido.

Importante:

La ruta configurada en Runner.path(...) determina qué archivo o carpeta de
pruebas se ejecutará. La ruta anterior se utilizó para comprobar el escenario
de consulta; para ejecutar el flujo integrado, debe configurarse la ruta
correspondiente a flujo-usuario.feature.

--------------------------------------------------------------------------------
INCIDENTE 3: ADVERTENCIA DE SLF4J DURANTE LA EJECUCIÓN
--------------------------------------------------------------------------------

Problema observado:

Durante la ejecución también apareció una advertencia relacionada con SLF4J,
la biblioteca utilizada para la abstracción de registros de actividad en Java.

Causa posible:

La configuración de registro del proyecto o de alguna de sus dependencias
podía estar mostrando una advertencia sobre el sistema de logging disponible.

Solución recomendada:

1. Leer el mensaje completo para determinar si se trata de una advertencia
   o de un error que interrumpe la ejecución.
2. Comprobar si las pruebas terminan y si Maven muestra el resultado final.
3. Revisar el reporte de Karate para confirmar si los escenarios se ejecutaron.
4. Si las pruebas funcionan y solo aparece una advertencia de logging, no
   modificar las dependencias automáticamente.
5. Si el registro de actividad necesita corregirse, revisar la configuración
   de dependencias de Maven antes de agregar o cambiar bibliotecas.

Resultado esperado:

Distinguir entre una advertencia informativa y un error que impida ejecutar
las pruebas.

Nota:

La advertencia de SLF4J no debe considerarse por sí sola una prueba fallida.
Su importancia depende del mensaje completo y del resultado final de la
ejecución.

------------------------------------------------------------------------------------
PASO 10: COMPROBACIÓN FINAL DESPUÉS DE SOLUCIONAR LOS INCIDENTES

Después de aplicar una solución, ejecutar nuevamente las pruebas desde la
carpeta raíz del proyecto:

    mvn clean test

Comprobar los siguientes aspectos:

1. Maven reconoce el archivo pom.xml.
2. Las dependencias se encuentran disponibles.
3. La clase PetStoreTest.java apunta al escenario que se desea ejecutar.
4. Karate puede interpretar los archivos .feature.
5. Las solicitudes HTTP se ejecutan con la URL configurada.
6. Maven muestra el resultado final de la ejecución.
7. El reporte HTML corresponde a la última ejecución.

Para consultar el reporte, buscar el archivo:

    target/karate-reports/karate-summary.html

La ejecución se considera satisfactoria cuando el proceso finaliza correctamente
y las pruebas ejecutadas cumplen las validaciones definidas en sus escenarios.

=====================================================================================================
