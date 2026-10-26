================================================================================
                  MANUAL DE USUARIO Y EJECUCIÓN PASO A PASO
                    AUTOMATIZACIÓN DE PRUEBAS API REST
                         PETSTORE CON KARATE Y JAVA
================================================================================

DESCRIPCIÓN GENERAL

Este manual explica cómo instalar las herramientas necesarias, descargar el
proyecto desde GitHub, abrirlo en IntelliJ IDEA, ejecutar las pruebas
automatizadas y consultar los resultados obtenidos.

El proyecto automatiza pruebas de servicios REST utilizando Karate, Java y
Maven. Los escenarios permiten verificar las operaciones de creación, consulta,
actualización y eliminación de usuarios en la API pública de demostración
PetStore.

El manual está diseñado para que una persona que no haya trabajado previamente
con el proyecto pueda reproducir el ejercicio desde cero.

Repositorio del proyecto:
https://github.com/PinguiPau/PruebaPetStore.git

API utilizada:
https://petstore.swagger.io/v2

HERRAMIENTAS UTILIZADAS

Apache Maven: administra las dependencias y permite ejecutar las pruebas.

IntelliJ IDEA: entorno de desarrollo utilizado para abrir y trabajar con
el proyecto.

Java JDK 21: entorno de desarrollo requerido para compilar y ejecutar
el proyecto.

Git: permite clonar el repositorio desde GitHub.

Karate: framework utilizado para automatizar las pruebas de API REST.

JUnit: permite integrar y ejecutar las pruebas desde Java.

IMPORTANTE:

Para simplificar la configuración, el procedimiento principal utiliza las opciones disponibles en IntelliJ IDEA para configurar el JDK y la distribución de Maven.

No es obligatorio instalar Java JDK ni Apache Maven por separado cuando IntelliJ IDEA puede descargar o proporcionar las herramientas necesarias y el proyecto se ejecuta desde el entorno integrado.

La instalación independiente de Java y Maven se incluye como una alternativa para quienes necesiten ejecutar comandos desde una terminal externa de Windows.

El proyecto utiliza Java 21 como versión de compilación, por lo que se recomienda mantener esta versión para evitar incompatibilidades.

==================================================================================================================
PASO 1. Instalar IntelliJ IDEA
==================================================================================================================

IntelliJ IDEA es el entorno de desarrollo que se utilizará para abrir el proyecto, configurar las herramientas y ejecutar las pruebas.

--------------------------------------------------------------------------------------------
1.1. Descargar IntelliJ IDEA
--------------------------------------------------------------------------------------------

Abrir el navegador.

Ingresar a la página oficial:

https://www.jetbrains.com/idea/download/

Buscar la versión disponible para Windows.

Descargar una edición compatible con proyectos Java y Maven.

Ejecutar el instalador descargado.

Seguir las instrucciones del asistente de instalación.

Finalizar la instalación y abrir IntelliJ IDEA desde el menú Inicio de Windows.

Si el programa solicita importar configuraciones anteriores y no se dispone de una configuración previa, se puede continuar sin importar ajustes.

Resultado esperado: IntelliJ IDEA se abre y muestra su pantalla de bienvenida.

Si IntelliJ IDEA ya está instalado, se puede continuar directamente con el siguiente paso.

============================================================================================
PASO 2. Descargar el proyecto desde GitHub
============================================================================================

El proyecto se encuentra alojado en GitHub. Se puede obtener mediante Git o descargando el repositorio como archivo ZIP.

---------------------------------------------------------------------------------------------
2.1. Opción A: clonar el repositorio con Git
---------------------------------------------------------------------------------------------

Verificar si Git está instalado

Abrir CMD, PowerShell o la terminal de Windows.

Ejecutar:

git --version

Si aparece la versión de Git, continuar con el siguiente apartado.

Si el comando no se reconoce, descargar Git desde su página oficial:

https://git-scm.com/downloads

Ejecutar el instalador, seguir las instrucciones y abrir una terminal nueva.

Clonar el repositorio

Abrir PowerShell.

Dirigirse a la carpeta donde se desea guardar el proyecto. Por ejemplo, para guardarlo en el escritorio:

cd "$HOME\Desktop"

Ejecutar el siguiente comando:

git clone https://github.com/PinguiPau/PruebaPetStore.git

Esperar a que Git descargue los archivos.

Entrar en la carpeta creada:

cd PruebaPetStore

Comprobar su contenido:

Get-ChildItem

Resultado esperado: se muestran los archivos y carpetas del proyecto, incluido pom.xml y la carpeta src.

Importante: Get-ChildItem es un comando de PowerShell. Si se utiliza CMD, se debe ejecutar dir en su lugar.

---------------------------------------------------------------------------------------
2.2. Opción B: descargar el proyecto como ZIP
---------------------------------------------------------------------------------------

Si no se desea instalar Git, se puede descargar el proyecto directamente desde GitHub.

Abrir el repositorio:

https://github.com/PinguiPau/PruebaPetStore

Presionar el botón Code.

Seleccionar Download ZIP.

Esperar a que finalice la descarga.

Extraer el archivo ZIP en una carpeta de fácil acceso.

Identificar la carpeta que contiene directamente el archivo pom.xml.

No es necesario utilizar Git si se elige esta alternativa.

=======================================================================================
PASO 3. Abrir el proyecto en IntelliJ IDEA
=======================================================================================
-------------------------------------------------------------------------------------
3.1. Abrir la carpeta del proyecto
-------------------------------------------------------------------------------------

Abrir IntelliJ IDEA.

En la pantalla de bienvenida, seleccionar Open.

Buscar la carpeta PruebaPetStore.

Seleccionar la carpeta que contiene directamente el archivo pom.xml.

Presionar Open.

Si aparece una solicitud de confianza, continuar únicamente si se reconoce el repositorio y se confía en su contenido.

Resultado esperado: IntelliJ IDEA abre el proyecto y muestra sus archivos en el panel Project.

===============================================================================================
PASO 4. Configurar Java JDK 21 desde IntelliJ IDEA
===============================================================================================

El proyecto está configurado para compilar con Java 21. IntelliJ IDEA permite descargar un JDK desde la configuración del proyecto, sin necesidad de instalarlo manualmente desde una página externa.

---------------------------------------------------------------------------------------------
4.1. Descargar el JDK
---------------------------------------------------------------------------------------------

En IntelliJ IDEA, abrir el proyecto PruebaPetStore.

Ingresar a File → Project Structure. También se puede utilizar el atajo Ctrl + Alt + Shift + S.

En Project Settings → Project, localizar la opción SDK o Project SDK.

Abrir la lista de SDK disponibles.

Seleccionar Download JDK, si aparece esta opción.

Elegir la versión 21.

Seleccionar un proveedor disponible, como Eclipse Temurin u Oracle OpenJDK.

Mantener la ubicación predeterminada o seleccionar otra carpeta si es necesario.

Presionar Download y esperar a que finalice la descarga.

Si la opción Download JDK no aparece, utilizar la opción para agregar un SDK y buscar la alternativa de descarga disponible en esa versión de IntelliJ IDEA.

----------------------------------------------------------------------------------------------
4.2. Asignar Java al proyecto
----------------------------------------------------------------------------------------------

Una vez descargado el JDK:

Seleccionar el JDK 21 como Project SDK.

Configurar Language level en Java 21, si la opción está disponible.

Presionar Apply y después OK.

Resultado esperado: IntelliJ IDEA reconoce Java 21 y lo utiliza para el proyecto.

--------------------------------------------------------------------------------
4.3. Esperar la importación de Maven
--------------------------------------------------------------------------------

Cuando se abre el proyecto por primera vez, IntelliJ IDEA debe reconocer
pom.xml y resolver las dependencias necesarias.

1. Espera a que termine la importación.
2. Si aparece una notificación para cargar o importar el proyecto Maven,
   selecciona la opción correspondiente.
3. Si las dependencias no se cargan automáticamente, abre la ventana Maven.
4. Selecciona Reload All Maven Projects.

RESULTADO ESPERADO:

Las dependencias comienzan a descargarse y las clases necesarias para trabajar
con el proyecto quedan disponibles.

Si aparecen errores como Cannot resolve symbol, consulta el incidente 1 del
PASO 7.

----------------------------------------------------------------------------
4.4. Configurar Java para Maven
----------------------------------------------------------------------------

Para que Maven utilice la misma versión de Java, revisar su configuración dentro de IntelliJ IDEA.

Abrir File → Settings.

Ingresar a Build, Execution, Deployment → Build Tools → Maven → Runner.

Buscar la opción JRE.

Seleccionar el JDK 21 configurado anteriormente.

Si existe la opción Maven → Importing, abrirla y seleccionar también el JDK 21 como JDK del importador.

Presionar Apply y OK.

Los nombres exactos de las opciones pueden variar según la versión de IntelliJ IDEA.

Importante: configurar el JDK dentro de IntelliJ IDEA no significa necesariamente que Windows ya lo reconozca desde una terminal externa. Para el procedimiento principal, se puede continuar utilizando la configuración del IDE.

----------------------------------------------------------------------------
4.5. Configurar Maven desde IntelliJ IDEA
----------------------------------------------------------------------------

En IntelliJ IDEA, abrir File → Settings.

Ingresar a Build, Execution, Deployment → Build Tools → Maven.

Buscar la opción Maven home path.

Revisar las distribuciones disponibles.

Si aparece la opción Bundled (Maven 3) o una distribución integrada equivalente, seleccionarla.

Si el proyecto incluye un Maven Wrapper, también se puede utilizar esa opción. El Wrapper utiliza los archivos mvnw o mvnw.cmd para preparar y ejecutar la versión de Maven definida por el proyecto.

Si IntelliJ IDEA ofrece una opción para descargar o configurar una distribución de Maven, seguir las indicaciones que aparecen en pantalla.

Guardar los cambios con Apply y OK.

Resultado esperado: IntelliJ IDEA dispone de una distribución de Maven para trabajar con el proyecto.

Nota: si la versión instalada de IntelliJ IDEA no ofrece una distribución integrada ni permite descargar Maven desde esta configuración, será necesario configurar una distribución externa o utilizar el Maven Wrapper si está disponible.

--------------------------------------------------------------------------------
4.6. Comprobar la estructura del proyecto
--------------------------------------------------------------------------------

En el panel Project, identifica los siguientes elementos:

- pom.xml
  Configuración de Maven y dependencias.

- src/test/java/PetStoreTest.java
  Clase Java que ejecuta los escenarios configurados en el runner de Karate.

- src/test/resources/crear-usuario.feature
  Escenario de creación de usuario.

- src/test/resources/consultar-usuario.feature
  Escenario de consulta de usuario.

- src/test/resources/actualizar-usuario.feature
  Escenario de actualización de usuario.

- src/test/resources/eliminar-usuario.feature
  Escenario de eliminación de usuario.

- src/test/resources/verificar-eliminacion.feature
  Escenario de verificación posterior a la eliminación.

- src/test/resources/flujo-usuario.feature
  Escenario integrado del proceso completo.

La estructura indicada corresponde a la organización documentada para el
ejercicio. Si el repositorio descargado presenta diferencias, utiliza los
nombres y rutas que realmente aparezcan en sus archivos.

[SI EL PROYECTO ESTÁ ABIERTO, LAS DEPENDENCIAS ESTÁN CARGADAS Y LOS ARCHIVOS
ESTÁN DISPONIBLES, AVANZA AL PASO 5]

================================================================================
PASO 5: SELECCIONAR Y EJECUTAR LAS PRUEBAS
================================================================================

Este paso explica cómo ejecutar un escenario individual o el flujo completo
del usuario.

--------------------------------------------------------------------------------
5.1. Comprender el archivo PetStoreTest.java
--------------------------------------------------------------------------------

Abre:

   src/test/java/PetStoreTest.java

Este archivo contiene la configuración del runner que indica qué archivo
o carpeta de Karate debe ejecutarse.

Busca una línea similar a:

   Runner.path("src/test/resources/consultar-usuario.feature")

La ruta que aparece dentro de Runner.path(...) determina el objetivo de
ejecución configurado.

Por ejemplo, si la ruta apunta a consultar-usuario.feature, se ejecutará ese
escenario, siempre que no existan otros runners o configuraciones adicionales
que también ejecuten pruebas.

--------------------------------------------------------------------------------
5.2. Ejecutar solamente la prueba de creación
--------------------------------------------------------------------------------

Para ejecutar la prueba de creación, configura el runner con esta ruta:

   Runner.path("src/test/resources/crear-usuario.feature")

Después:

1. Guarda PetStoreTest.java.
2. Abre la terminal integrada de IntelliJ IDEA.
3. Comprueba que estás en la carpeta raíz del proyecto.
4. Ejecuta:

   mvn clean test o haz clic en el icono de ejecución situado junto al método, selecciona la opción Run.

RESULTADO ESPERADO:

Maven compila el proyecto y ejecuta la prueba de creación configurada.

Si las validaciones se cumplen, la prueba debe finalizar sin errores.

--------------------------------------------------------------------------------
5.3. Ejecutar solamente la prueba de consulta
--------------------------------------------------------------------------------

En PetStoreTest.java, utiliza:

   Runner.path("src/test/resources/consultar-usuario.feature")

Guarda el archivo y ejecuta:

   mvn clean test o haz clic en el icono de ejecución situado junto al método, selecciona la opción Run.

RESULTADO ESPERADO:

Se ejecuta el escenario de consulta y se comprueban las validaciones definidas
en consultar-usuario.feature.

IMPORTANTE:

Si la consulta depende de un usuario creado previamente, asegúrate de que
ese registro exista antes de ejecutar el escenario de forma independiente.

--------------------------------------------------------------------------------
5.4. Ejecutar solamente la prueba de actualización
--------------------------------------------------------------------------------

En PetStoreTest.java, utiliza:

   Runner.path("src/test/resources/actualizar-usuario.feature")

Guarda los cambios y ejecuta:

   mvn clean test o haz clic en el icono de ejecución situado junto al método, selecciona la opción Run.

RESULTADO ESPERADO:

Se ejecuta el escenario de actualización.

Si el escenario necesita un usuario existente, debe contar con los datos
necesarios para realizar la operación.

--------------------------------------------------------------------------------
5.5. Ejecutar solamente la prueba de eliminación
--------------------------------------------------------------------------------

En PetStoreTest.java, utiliza:

   Runner.path("src/test/resources/eliminar-usuario.feature")

Guarda los cambios y ejecuta:

   mvn clean test o haz clic en el icono de ejecución situado junto al método, selecciona la opción Run.

RESULTADO ESPERADO:

Se ejecuta la prueba de eliminación configurada.

Ten presente que, si el escenario elimina un usuario compartido con otras
pruebas, las ejecuciones posteriores pueden depender de su estado.

--------------------------------------------------------------------------------
5.6. Ejecutar la verificación posterior a la eliminación
--------------------------------------------------------------------------------

En PetStoreTest.java, utiliza:

   Runner.path("src/test/resources/verificar-eliminacion.feature")

Guarda los cambios y ejecuta:

   mvn clean test o haz clic en el icono de ejecución situado junto al método, selecciona la opción Run.

RESULTADO ESPERADO:

Se ejecuta el escenario que comprueba el comportamiento de la consulta
posterior a la eliminación.

La prueba debe evaluar la respuesta real según las validaciones definidas
en verificar-eliminacion.feature.

--------------------------------------------------------------------------------
5.7. Ejecutar el flujo integrado completo
--------------------------------------------------------------------------------

Para ejecutar el proceso completo, configura el runner con:

   Runner.path("src/test/resources/flujo-usuario.feature")

Después:

1. Guarda PetStoreTest.java.
2. Abre la terminal integrada.
3. Ejecuta:

   mvn clean test o haz clic en el icono de ejecución situado junto al método, selecciona la opción Run.

RESULTADO ESPERADO:

Se ejecuta el flujo integrado definido en flujo-usuario.feature.

El objetivo del flujo es realizar las operaciones en el orden programado:

1. Crear el usuario.
2. Consultar el usuario.
3. Validar sus datos.
4. Actualizar la información.
5. Verificar los cambios.
6. Eliminar el usuario.
7. Verificar el resultado de la eliminación.

El orden y las validaciones exactas dependen del contenido real de
flujo-usuario.feature.

--------------------------------------------------------------------------------
5.8. ¿Qué debo cambiar para ejecutar otro archivo?
--------------------------------------------------------------------------------

Solo debes cambiar la ruta que se encuentra dentro de Runner.path(...) en
PetStoreTest.java.

Ejemplo: si actualmente tienes:

   Runner.path("src/test/resources/consultar-usuario.feature")

Y deseas ejecutar el flujo integrado, reemplaza esa ruta por:

   Runner.path("src/test/resources/flujo-usuario.feature")

Después de modificarla:

1. Guarda el archivo con Ctrl + S.
2. Ejecuta mvn clean test o Haz clic en el icono de ejecución situado junto al método, selecciona la opción Run.
3. Revisa el resultado de Maven.
4. Comprueba el reporte generado.

No es necesario cambiar el archivo pom.xml cada vez que quieras seleccionar
otro escenario.

IMPORTANTE SOBRE LAS RUTAS:

- Si Runner.path apunta a un archivo .feature, se selecciona ese archivo.
- Si apunta a una carpeta de pruebas, Karate puede descubrir los archivos
  .feature contenidos en esa ubicación.
- Si el runner está configurado con una carpeta, no asumas que se ejecutará
  exclusivamente un escenario.
- Si existen varios runners de pruebas en el proyecto, Maven podría ejecutar
  más de uno. En ese caso, revisa las clases y configuraciones de ejecución.

Para este ejercicio, modifica la ruta existente en PetStoreTest.java en lugar
de crear runners adicionales innecesariamente.

--------------------------------------------------------------------------------
5.9. Ejecutar desde IntelliJ IDEA
--------------------------------------------------------------------------------

También puedes ejecutar las pruebas desde el entorno gráfico.

1. Abre PetStoreTest.java.
2. Busca el método de prueba que contiene la ejecución del runner.
3. Haz clic en el icono de ejecución situado junto al método, si está disponible.
4. Selecciona Run.
5. Espera a que finalice la ejecución.
6. Revisa la pestaña Run para consultar los mensajes y resultados.

Si IntelliJ IDEA no muestra el icono de ejecución o no reconoce el método,
revisa la configuración de las dependencias, el JDK y el runner.

La ejecución mediante Maven sigue siendo la alternativa recomendada para
reproducir el ejercicio desde una terminal.

================================================================================
PASO 6: COMPROBAR LOS RESULTADOS Y ABRIR EL REPORTE
================================================================================

--------------------------------------------------------------------------------
6.1. Ejecutar las pruebas desde la terminal
--------------------------------------------------------------------------------

Desde la carpeta que contiene pom.xml, ejecuta:

   mvn clean test

RESULTADO ESPERADO:

Si el proceso termina correctamente, Maven muestra:

   BUILD SUCCESS

Este mensaje confirma que el proceso de construcción terminó correctamente,
pero también debes revisar el resumen de pruebas para comprobar que se
ejecutaron los escenarios esperados y que no hubo fallos.

Un ejemplo de resumen satisfactorio puede ser:

   Tests run: 1, Failures: 0, Errors: 0

Este resultado es ilustrativo. El número de pruebas depende del archivo
seleccionado y de la configuración del runner.

--------------------------------------------------------------------------------
6.2. Ubicación del reporte
--------------------------------------------------------------------------------

Después de ejecutar las pruebas, revisa la carpeta:

   target/karate-reports/

Busca el archivo:

   karate-summary.html

Su ruta relativa es:

   target/karate-reports/karate-summary.html

--------------------------------------------------------------------------------
6.3. Abrir el reporte en el navegador
--------------------------------------------------------------------------------

1. Abre el explorador de archivos de Windows.
2. Ingresa a la carpeta donde descargaste PruebaPetStore.
3. Abre target.
4. Abre karate-reports.
5. Busca karate-summary.html.
6. Haz doble clic sobre el archivo.

RESULTADO ESPERADO:

El navegador abre el reporte de Karate con el resumen de la ejecución y los
detalles disponibles de los escenarios.

--------------------------------------------------------------------------------
6.4. Interpretar el reporte
--------------------------------------------------------------------------------

Comprueba:

- El número de escenarios ejecutados.
- Los escenarios que finalizaron correctamente.
- Los escenarios que presentaron errores.
- Los pasos que se ejecutaron.
- Los mensajes de error disponibles.
- La duración de la ejecución.

Si ejecutaste consultar-usuario.feature, el reporte debe corresponder a esa
ejecución y no debes asumir que se ejecutó el flujo completo.

Si configuraste flujo-usuario.feature, revisa los resultados de las operaciones
que realmente estén incluidas en ese escenario.

--------------------------------------------------------------------------------
6.5. Si el reporte no aparece
--------------------------------------------------------------------------------

1. Verifica que la ejecución haya terminado.
2. Revisa si Maven mostró BUILD SUCCESS o BUILD FAILURE.
3. Comprueba que PetStoreTest.java apunte al archivo deseado.
4. Busca la carpeta target.
5. Revisa si se creó karate-reports.
6. Si no aparece el reporte, consulta los mensajes de error y vuelve a ejecutar
   las pruebas después de solucionar el problema.

No utilices un reporte anterior como evidencia de una ejecución nueva.

================================================================================
PASO 7: SOLUCIÓN DE INCIDENTES COMUNES
================================================================================

Esta sección documenta los problemas encontrados durante el desarrollo del
proyecto y las acciones que pueden utilizarse para solucionarlos.

--------------------------------------------------------------------------------
INCIDENTE 1: INTELLIJ IDEA NO RECONOCE LAS CLASES DE KARATE Y JUNIT
--------------------------------------------------------------------------------

MENSAJES POSIBLES:

   Cannot resolve symbol 'junit6'

   Cannot resolve symbol 'Karate'

PROBLEMA:

IntelliJ IDEA muestra errores en las importaciones de la clase Java y no
reconoce las clases necesarias para ejecutar las pruebas.

CAUSA:

Las dependencias de Karate no se han descargado, Maven no ha terminado de
importarlas o la configuración del proyecto no coincide con las dependencias
declaradas en pom.xml.

SOLUCIÓN:

1. Abre pom.xml.
2. Busca la sección dependencies.
3. Comprueba la dependencia utilizada por el proyecto.

   En la configuración de Karate 2.1.4 utilizada para este ejercicio se emplea:

   io.karatelabs:karate-junit6:2.1.4

4. Verifica que la dependencia esté escrita correctamente y que su versión
   coincida con la configuración del proyecto.
5. Guarda pom.xml.
6. Abre la ventana Maven en IntelliJ IDEA.
7. Selecciona Reload All Maven Projects.
8. Espera a que Maven termine de resolver las dependencias.
9. Comprueba si desaparecen los errores de importación.

SI EL ERROR CONTINÚA:

Abre la terminal en la raíz del proyecto y ejecuta:

   mvn -U test

Este comando fuerza a Maven a comprobar las actualizaciones de las dependencias
durante su resolución.

Si sigue fallando, revisa el primer mensaje de error que aparece en la terminal.
Puede indicar un problema de conexión, una dependencia no disponible o una
incompatibilidad en la configuración.

RESULTADO ESPERADO:

IntelliJ IDEA reconoce las clases utilizadas por el runner y permite continuar
con la ejecución.

NOTA:

Aunque la documentación inicial describa JUnit 5, la dependencia
karate-junit6 corresponde a JUnit 6. Para evitar incompatibilidades, verifica
que el pom.xml, las importaciones y el runner sean coherentes con la
configuración real del proyecto.

--------------------------------------------------------------------------------
INCIDENTE 2: ERROR INVALIDPATH ILLEGAL CHAR <:> AT INDEX 9: CLASSPATH:
--------------------------------------------------------------------------------

MENSAJE OBSERVADO:

   InvalidPath Illegal char <:> at index 9: classpath:

PROBLEMA:

Al ejecutar las pruebas, Java presenta un error relacionado con una ruta
inválida que contiene el prefijo classpath:.

CAUSA:

La ruta utilizada en Runner.path(...) no era compatible con la forma en que
se estaba interpretando en la configuración utilizada.

SOLUCIÓN:

1. Abre:

   src/test/java/PetStoreTest.java

2. Busca la llamada a Runner.path(...).
3. Comprueba qué ruta se encuentra dentro de los paréntesis.
4. Para seleccionar el escenario de consulta, utiliza:

   Runner.path("src/test/resources/consultar-usuario.feature")

5. Guarda el archivo.
6. Abre la terminal en la raíz del proyecto.
7. Ejecuta:

   mvn clean test

RESULTADO ESPERADO:

La ruta se interpreta correctamente y el runner puede iniciar el escenario
seleccionado.

En una ejecución satisfactoria, Maven puede mostrar un resumen similar a:

   Tests run: 1, Failures: 0, Errors: 0

   BUILD SUCCESS

El número de pruebas depende de la configuración real.

IMPORTANTE:

La ruta del ejemplo corresponde al escenario de consulta. Si quieres ejecutar
el flujo completo, utiliza:

   Runner.path("src/test/resources/flujo-usuario.feature")

No mantengas el prefijo classpath: si la configuración actual lo está
interpretando como una ruta inválida.

--------------------------------------------------------------------------------
INCIDENTE 3: ADVERTENCIA DE SLF4J DURANTE LA EJECUCIÓN
--------------------------------------------------------------------------------

PROBLEMA OBSERVADO:

Durante la ejecución puede aparecer un mensaje de advertencia relacionado
con SLF4J, la biblioteca utilizada para gestionar los registros de actividad.

CAUSA POSIBLE:

Alguna dependencia puede estar mostrando una advertencia sobre la configuración
del sistema de logging.

SOLUCIÓN:

1. Lee el mensaje completo.
2. Comprueba si es una advertencia o un error que detiene la ejecución.
3. Espera a que Maven termine.
4. Comprueba si aparece BUILD SUCCESS o BUILD FAILURE.
5. Revisa el resumen de pruebas y el reporte de Karate.

SI LAS PRUEBAS SE EJECUTAN CORRECTAMENTE:

No modifiques las dependencias únicamente porque aparezca una advertencia
de SLF4J.

SI LA EJECUCIÓN FALLA:

Revisa las líneas siguientes a la advertencia para identificar el error real.
Si el problema está relacionado con las dependencias de logging, examina la
configuración de Maven antes de añadir o cambiar bibliotecas.

RESULTADO ESPERADO:

Identificar si el mensaje es informativo o si está relacionado con un problema
que impide ejecutar las pruebas.

--------------------------------------------------------------------------------
INCIDENTE 4: EL COMANDO JAVA NO SE RECONOCE
--------------------------------------------------------------------------------

MENSAJE POSIBLE:

   'java' no se reconoce como un comando interno o externo.

SOLUCIÓN:

1. Comprueba si Java está instalado.
2. Verifica JAVA_HOME.
3. Revisa que la carpeta bin del JDK esté incluida en PATH.
4. Cierra y vuelve a abrir la terminal.
5. Ejecuta:

   java -version

Si continúa el error, vuelve al PASO 1 de este manual.

--------------------------------------------------------------------------------
INCIDENTE 5: EL COMANDO MVN NO SE RECONOCE
--------------------------------------------------------------------------------

MENSAJE POSIBLE:

   'mvn' no se reconoce como un comando interno o externo.

SOLUCIÓN:

1. Comprueba que Maven esté instalado.
2. Revisa la ruta de instalación.
3. Verifica que la carpeta bin de Maven esté incluida en PATH.
4. Abre una nueva terminal.
5. Ejecuta:

   mvn -version

Si continúa el error, vuelve al PASO 2 de este manual.

--------------------------------------------------------------------------------
INCIDENTE 6: MAVEN INDICA QUE NO ENCUENTRA pom.xml
--------------------------------------------------------------------------------

MENSAJE POSIBLE:

   The goal you specified requires a project to execute
   but there is no POM in this directory.

CAUSA:

La terminal no está ubicada en la raíz del proyecto.

SOLUCIÓN:

1. Ejecuta:

   Get-Location

2. Comprueba la ruta actual.
3. Ingresa a la carpeta del proyecto:

   cd PruebaPetStore

4. Ejecuta:

   Get-ChildItem

5. Comprueba que aparezca pom.xml.
6. Ejecuta nuevamente:

   mvn clean test

RESULTADO ESPERADO:

Maven encuentra la configuración del proyecto y comienza la ejecución.

--------------------------------------------------------------------------------
INCIDENTE 7: INTELLIJ IDEA NO TERMINA DE CARGAR LAS DEPENDENCIAS
--------------------------------------------------------------------------------

PROBLEMA:

El proyecto abre, pero algunas clases aparecen en rojo o la importación de
Maven no finaliza.

SOLUCIÓN:

1. Comprueba la conexión a internet.
2. Abre pom.xml.
3. Abre la ventana Maven.
4. Selecciona Reload All Maven Projects.
5. Espera a que termine la descarga.
6. Si continúa fallando, ejecuta:

   mvn -U test

7. Lee el error que devuelve Maven.

Si el error indica que no puede descargar una dependencia, verifica la conexión
o las restricciones de red.

Si indica una incompatibilidad de versiones, revisa el JDK y las dependencias
declaradas en pom.xml.

--------------------------------------------------------------------------------
INCIDENTE 8: MAVEN MUESTRA BUILD FAILURE
--------------------------------------------------------------------------------

PROBLEMA:

La terminal termina mostrando:

   BUILD FAILURE

CAUSA:

Puede existir un error de compilación, una dependencia que no se descargó,
un problema de configuración o una prueba que no pasó.

SOLUCIÓN:

1. Lee el mensaje completo de la terminal.
2. Busca el primer error relevante, no solamente la última línea.
3. Si menciona una clase que no se encuentra, revisa las dependencias.
4. Si menciona una ruta inválida, revisa Runner.path(...).
5. Si menciona una URL que no está configurada, revisa el escenario .feature.
6. Si menciona un problema de compilación, revisa el archivo Java indicado.
7. Después de solucionar la causa, ejecuta:

   mvn clean test

RESULTADO ESPERADO:

Maven termina sin errores y las pruebas configuradas cumplen las validaciones.

--------------------------------------------------------------------------------
INCIDENTE 9: NO SE ENCUENTRA EL REPORTE HTML
--------------------------------------------------------------------------------

PROBLEMA:

No aparece:

   target/karate-reports/karate-summary.html

SOLUCIÓN:

1. Comprueba que Maven haya terminado la ejecución.
2. Revisa el resultado final.
3. Verifica que PetStoreTest.java apunte al escenario deseado.
4. Busca la carpeta target.
5. Revisa si se creó karate-reports.
6. Si no existe, revisa los errores de la terminal y vuelve a ejecutar las
   pruebas después de solucionarlos.

RESULTADO ESPERADO:

El reporte se encuentra disponible después de una ejecución que haya generado
los informes de Karate.

--------------------------------------------------------------------------------
INCIDENTE 10: NO SE EJECUTA EL ARCHIVO .FEATURE QUE SE DESEA
--------------------------------------------------------------------------------

PROBLEMA:

Se ejecuta Maven, pero el resultado corresponde a otro escenario o a varios
escenarios distintos de los esperados.

CAUSA:

La ruta configurada en Runner.path(...) no coincide con el archivo que se
desea ejecutar, o existen otros runners que también se ejecutan mediante Maven.

SOLUCIÓN:

1. Abre PetStoreTest.java.
2. Localiza Runner.path(...).
3. Comprueba el nombre del archivo seleccionado.
4. Cambia la ruta al escenario deseado.
5. Guarda el archivo.
6. Ejecuta:

   mvn clean test

7. Comprueba en el reporte qué escenarios se ejecutaron.

Ejemplo para ejecutar consulta:

   Runner.path("src/test/resources/consultar-usuario.feature")

Ejemplo para ejecutar el flujo integrado:

   Runner.path("src/test/resources/flujo-usuario.feature")

RESULTADO ESPERADO:

Se ejecutan los escenarios correspondientes a la configuración del runner.

=================================================================================
PASO 8. Instalación independiente de Java y Maven (opcional)
=================================================================================

Esta sección está dirigida a quienes deseen utilizar Java y Maven desde CMD, PowerShell u otras herramientas externas a IntelliJ IDEA.

Si el proyecto se ejecuta correctamente desde IntelliJ IDEA, se puede omitir este paso.

------------------------------------------------------------------------------
8.1. Instalar Java JDK 21 por separado
------------------------------------------------------------------------------

Abrir la página oficial de Eclipse Temurin:

https://adoptium.net/temurin/releases/

Seleccionar Windows como sistema operativo.

Seleccionar la arquitectura correspondiente al equipo, normalmente x64.

Seleccionar la versión 21 y el paquete JDK.

Descargar el instalador disponible.

Ejecutarlo y seguir las instrucciones.

Si el instalador ofrece opciones para agregar Java al PATH o configurar JAVA_HOME, habilitarlas si se desea utilizar Java desde la terminal.

Finalizar la instalación.

Como alternativa, se puede consultar la distribución de Oracle JDK:

https://www.oracle.com/java/technologies/downloads/

Verificar Java

Abrir una terminal nueva y ejecutar:

java -version

Para revisar la variable JAVA_HOME en CMD:

echo %JAVA_HOME%

En PowerShell:

$env:JAVA_HOME

La versión utilizada debe ser compatible con la configuración del proyecto. Se recomienda Java 21.

------------------------------------------------------------------------------
8.2. Instalar Apache Maven por separado
------------------------------------------------------------------------------

Abrir la página oficial de descargas:

https://maven.apache.org/download.cgi

Descargar el archivo Binary zip archive.

Esperar a que termine la descarga.

Extraer el ZIP en una carpeta permanente, por ejemplo:

C:\Tools\

Identificar la carpeta extraída, cuyo nombre tendrá un formato similar a apache-maven-3.x.x.

Abrir la configuración de variables de entorno de Windows.

En las variables de usuario, editar Path.

Agregar la ruta completa de la carpeta bin de Maven. Por ejemplo:

C:\Tools\apache-maven-3.x.x\bin

Se debe sustituir 3.x.x por la versión realmente descargada y utilizar la ruta donde se extrajo Maven.

Guardar los cambios.

Cerrar y abrir nuevamente la terminal.

Verificar Maven

Ejecutar:

mvn -version

El resultado debe mostrar la versión de Maven y el JDK que utiliza.

Si Maven no encuentra Java, verificar que el JDK esté instalado y que la configuración de JAVA_HOME y Path sea correcta.

--------------------------------------------------------------------------------
CONSIDERACIONES FINALES
--------------------------------------------------------------------------------

1. La API PetStore es un servicio público de demostración. Su disponibilidad
   y sus datos pueden cambiar.

2. Los datos de prueba deben coincidir con los definidos en los archivos
   .feature.

3. Si se cambia el nombre de usuario utilizado por el ejercicio, se deben
   revisar las referencias correspondientes en los escenarios que dependen
   de ese dato.

4. La ruta configurada en PetStoreTest.java determina el archivo o la carpeta
   de pruebas que se ejecutará.

5. El comando mvn clean test ejecuta las pruebas configuradas en el proyecto.
   No garantiza por sí solo que se haya ejecutado un escenario específico:
   eso depende del runner y de la configuración de Maven.

6. El reporte HTML debe corresponder a la última ejecución realizada.

7. Los resultados deben interpretarse a partir de las validaciones definidas
   en los escenarios y de las respuestas reales de la API.

================================================================================
FIN DEL MANUAL DE USUARIO
================================================================================
