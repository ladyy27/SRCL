package pkg_CLASES;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import pkg_CLASES.Cursos;
import pkg_CLASES.Estudiantes;
import pkg_CLASES.RegistroNotas;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-07-24T14:56:47")
@StaticMetamodel(Matriculas.class)
public class Matriculas_ { 

    public static volatile SingularAttribute<Matriculas, Date> fechaMat;
    public static volatile SingularAttribute<Matriculas, String> estado;
    public static volatile SingularAttribute<Matriculas, Integer> idMatricula;
    public static volatile SingularAttribute<Matriculas, Cursos> idCurso;
    public static volatile ListAttribute<Matriculas, RegistroNotas> registroNotasList;
    public static volatile SingularAttribute<Matriculas, Estudiantes> idEstudiante;

}