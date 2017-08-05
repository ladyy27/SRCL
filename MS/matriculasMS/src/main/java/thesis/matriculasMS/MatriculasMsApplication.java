package thesis.matriculasMS;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

//1. Habilitar autoconfiguracion
//@EnableAutoConfiguration
//2. Habilitar el registro y descubrimiento del servicio en Eureka. Se registra a si mismo usando el nombre de esta misma app
 
@EnableDiscoveryClient
@SpringBootApplication
public class MatriculasMsApplication {

	public static void main(String[] args) {
		SpringApplication.run(MatriculasMsApplication.class, args);
	}
}
