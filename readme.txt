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

Para simplificar la configuración, este manual utiliza IntelliJ IDEA para
descargar y configurar Java JDK 21. No es necesario instalar Java
manualmente desde una página web.

La instalación de Maven se describe primero, pero su verificación y ejecución
se realizarán después de configurar Java JDK 21.

Apache Maven es una herramienta que permite administrar las dependencias,
compilar el proyecto y ejecutar las pruebas automatizadas.

El archivo pom.xml del proyecto contiene las dependencias y configuraciones
que Maven utiliza para preparar el entorno de ejecución.

En este procedimiento se utilizará WinGet, el administrador de paquetes de
Windows, para instalar Maven mediante comandos, sin tener que descargar y
extraer manualmente un archivo ZIP.

================================================================================
PASO 1: INSTALACIÓN DE APACHE MAVEN MEDIANTE CMD
================================================================================

1.1. Verificar que WinGet esté disponible

Abre el menú Inicio de Windows.

Escribe CMD y abre el Símbolo del sistema.

Ejecuta el siguiente comando:

winget --version

RESULTADO ESPERADO:

La terminal muestra la versión de WinGet instalada.

Si el comando no se reconoce, comprueba que el componente Instalador de
aplicaciones (App Installer) esté instalado y actualizado en Windows.

1.2. Buscar Apache Maven

En la terminal CMD, ejecuta:

winget search Maven --source winget

Este comando busca paquetes relacionados con Maven utilizando la fuente
winget, sin recurrir a la fuente de Microsoft Store.

RESULTADO ESPERADO:

La terminal muestra una lista de resultados relacionados con Maven.
Busca el paquete correspondiente a Apache Maven e identifica su nombre
y su identificador (Id).

IMPORTANTE: Si utilizas el comando winget search Maven sin especificar
la fuente, puede aparecer un mensaje similar al siguiente:

The msstore source requires that you view the following agreements
before using.

Do you agree to all the source agreements terms?
[Y] Yes  [N] No:

Este mensaje solicita aceptar los términos de la fuente Microsoft Store.
No significa que Maven haya fallado ni que exista un problema con Windows.

Si deseas continuar utilizando esa fuente, puedes escribir Y y presionar
Enter, siempre que estés de acuerdo con los términos mostrados.

Sin embargo, para este procedimiento se recomienda utilizar directamente:

winget search Maven --source winget

1.3. Instalar Apache Maven

Después de identificar el paquete correspondiente en los resultados,
ejecuta el comando de instalación con el identificador que aparezca.

Por ejemplo, si el identificador mostrado es Apache.Maven, utiliza:

winget install --id Apache.Maven -e --source winget

IMPORTANTE: El identificador debe coincidir con el que aparece en los
resultados de búsqueda. Si es diferente, reemplaza Apache.Maven por el
identificador correcto.

Espera a que termine la instalación. Si Windows solicita autorización
para realizar cambios, revisa la solicitud y autoriza la operación si
corresponde.

1.4. Verificar la instalación de Maven

Cuando finalice la instalación:

Cierra la ventana de CMD.

Abre una nueva ventana del Símbolo del sistema.

Ejecuta:

mvn -version

RESULTADO ESPERADO:

La terminal muestra información sobre la versión de Apache Maven y la
versión de Java que utiliza para ejecutarse.

Si el comando mvn no se reconoce, comprueba que la instalación haya
finalizado correctamente y que la ruta de Maven esté disponible en la
variable PATH de Windows.

Si Maven indica que no encuentra Java o que JAVA_HOME no está configurada,
no significa necesariamente que Maven se haya instalado mal. Continúa
con el PASO 2 para descargar y configurar Java JDK 21 desde IntelliJ IDEA.
Después, vuelve a ejecutar mvn -version.

NOTA:

Para ejecutar Maven se necesita un JDK compatible. En este manual se
utilizará Java JDK 21, descargado y configurado directamente desde
IntelliJ IDEA, por lo que no es necesario instalar Java manualmente
desde una página web.

================================================================================
PASO 2: DESCARGA E INSTALACIÓN DE INTELLIJ IDEA
================================================================================

IntelliJ IDEA es el entorno de desarrollo utilizado para abrir el proyecto,
visualizar el código Java, editar los escenarios y ejecutar las pruebas.

--------------------------------------------------------------------------------
2.1. Descargar IntelliJ IDEA
--------------------------------------------------------------------------------

1. Abre el navegador.
2. Ingresa a la página oficial:

   https://www.jetbrains.com/idea/download/

3. Busca la versión para Windows.
4. Selecciona la edición disponible que permita trabajar con proyectos Java
   y Maven. La edición gratuita puede ser suficiente para este ejercicio.
5. Descarga el instalador.
6. Ejecuta el archivo descargado.
7. Sigue las instrucciones del asistente de instalación.
8. Finaliza la instalación.
9. Abre IntelliJ IDEA desde el menú Inicio de Windows.

Si el programa solicita importar configuraciones anteriores y no tienes una
configuración previa, puedes continuar sin importar ajustes.

--------------------------------------------------------------------------------
2.2. Primer inicio de IntelliJ IDEA
--------------------------------------------------------------------------------

1. Abre IntelliJ IDEA.
2. Si aparece una pantalla de bienvenida, selecciona Open para abrir un
   proyecto existente.
3. Si aparece una pantalla de configuración inicial, completa los pasos
   solicitados.
4. No necesitas crear un proyecto Java nuevo, porque el proyecto PetStore
   se descargará desde GitHub.

RESULTADO ESPERADO:

IntelliJ IDEA abre y muestra su pantalla inicial, desde la cual es posible
abrir un proyecto existente.

SI INTELLIJ IDEA YA ESTÁ INSTALADO:
Puedes omitir la instalación y continuar con el PASO 3.

================================================================================
PASO 3: DESCARGAR EL PROYECTO DESDE GITHUB
================================================================================

--------------------------------------------------------------------------------
3.1. Verificar si Git está instalado
--------------------------------------------------------------------------------

Abre PowerShell y ejecuta:

   git --version

RESULTADO ESPERADO:

Se muestra la versión instalada de Git.

Si el comando no se reconoce, descarga Git desde:

   https://git-scm.com/downloads

Instálalo siguiendo las instrucciones y abre una nueva terminal.

También puedes descargar el proyecto como ZIP desde GitHub si no deseas
instalar Git.

--------------------------------------------------------------------------------
3.2. Clonar el repositorio
--------------------------------------------------------------------------------

1. Abre PowerShell.
2. Dirígete a la ubicación donde deseas guardar el proyecto.

   Ejemplo para guardarlo en el escritorio:

   cd $HOME\Desktop

3. Ejecuta:

   git clone https://github.com/PinguiPau/PruebaPetStore.git

RESULTADO ESPERADO:

Git descarga el repositorio y crea una carpeta llamada:

   PruebaPetStore

Si aparece un mensaje indicando que el repositorio no existe, abre el enlace
en el navegador y verifica que la dirección sea correcta y que el repositorio
esté disponible públicamente.

--------------------------------------------------------------------------------
3.3. Ingresar a la carpeta del proyecto
--------------------------------------------------------------------------------

Ejecuta:

   cd PruebaPetStore

Después ejecuta:

   Get-ChildItem

RESULTADO ESPERADO:

En la lista de archivos debe aparecer:

   pom.xml

También debe aparecer la carpeta:

   src

El archivo pom.xml contiene la configuración de Maven y las dependencias del
proyecto.

Si no aparece pom.xml, es posible que estés en una carpeta incorrecta o dentro
de una carpeta adicional creada al extraer un ZIP.

No ejecutes Maven hasta ubicar la carpeta que contiene pom.xml.

================================================================================
PASO 4: ABRIR Y PREPARAR EL PROYECTO EN INTELLIJ IDEA
================================================================================

--------------------------------------------------------------------------------
4.1. Abrir la carpeta correcta
--------------------------------------------------------------------------------

1. Abre IntelliJ IDEA.
2. Selecciona Open.
3. Busca la carpeta PruebaPetStore.
4. Selecciona la carpeta que contiene directamente pom.xml.
5. Haz clic en Open.
6. Si IntelliJ IDEA pregunta si confías en el proyecto, continúa únicamente
   si reconoces el repositorio y confías en su contenido.

RESULTADO ESPERADO:

El proyecto aparece en IntelliJ IDEA y se muestra el panel Project con sus
archivos y carpetas.

--------------------------------------------------------------------------------
4.2. Esperar la importación de Maven
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

--------------------------------------------------------------------------------
4.3. Seleccionar el JDK del proyecto
--------------------------------------------------------------------------------

Si IntelliJ IDEA solicita configurar el SDK:

1. Abre File -> Project Structure.
2. Busca la configuración Project SDK.
3. Selecciona el JDK 21 instalado.
4. Si no aparece, utiliza la opción para agregar un JDK y selecciona su carpeta
   de instalación.
5. Guarda los cambios.

RESULTADO ESPERADO:

IntelliJ IDEA reconoce el JDK utilizado por el proyecto.

Si el proyecto ya tiene configurado un JDK compatible, no es necesario
modificarlo.

--------------------------------------------------------------------------------
4.4. Comprobar la estructura del proyecto
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

   mvn clean test

RESULTADO ESPERADO:

Maven compila el proyecto y ejecuta la prueba de creación configurada.

Si las validaciones se cumplen, la prueba debe finalizar sin errores.

--------------------------------------------------------------------------------
5.3. Ejecutar solamente la prueba de consulta
--------------------------------------------------------------------------------

En PetStoreTest.java, utiliza:

   Runner.path("src/test/resources/consultar-usuario.feature")

Guarda el archivo y ejecuta:

   mvn clean test

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

   mvn clean test

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

   mvn clean test

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

   mvn clean test

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

   mvn clean test

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
2. Ejecuta mvn clean test.
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

================================================================================
PASO 8: VERIFICACIÓN FINAL Y ENTREGA DEL PROYECTO
================================================================================

Antes de entregar el ejercicio, comprueba lo siguiente:

* Java está instalado y se reconoce desde la terminal.

* Maven está instalado y se reconoce desde la terminal.

* IntelliJ IDEA abre el proyecto correctamente.

* El proyecto se descargó desde el repositorio de GitHub.

* pom.xml está disponible en la raíz del proyecto.

* Las dependencias de Maven se han cargado correctamente.

* PetStoreTest.java apunta al escenario que se desea ejecutar.

* Los archivos .feature están disponibles.

* La ejecución de Maven terminó correctamente.

* Se revisó el resumen de pruebas.

* Se consultó el reporte HTML generado por Karate.

* El archivo readme.txt contiene las instrucciones de instalación y ejecución.

* El archivo conclusiones.txt documenta los hallazgos del ejercicio.

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
