
import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

class PetStoreTest {

    @Test
    void testConsultarUsuario() {
        SuiteResult resultado = Runner.path("src/test/resources/flujo-usuario.feature")
                .outputHtmlReport(true)
                .parallel(1);

        assertTrue(resultado.isPassed(),
                "La prueba de Karate tuvo errores");
    }
}
