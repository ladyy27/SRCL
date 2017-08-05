package pkg_CLASES;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import pkg_CLASES.Matriculas;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-08-04T14:06:28")
@StaticMetamodel(Estudiantes.class)
public class Estudiantes_ { 

    public static volatile SingularAttribute<Estudiantes, String> apellidos;
    public static volatile SingularAttribute<Estudiantes, Date> fechaNac;
    public static volatile SingularAttribute<Estudiantes, String> password;
    public static volatile SingularAttribute<Estudiantes, String> ci;
    public static volatile ListAttribute<Estudiantes, Matriculas> matriculasList;
    public static volatile SingularAttribute<Estudiantes, Integer> idEstudiante;
    public static volatile SingularAttribute<Estudiantes, Integer> rol;
    public static volatile SingularAttribute<Estudiantes, String> nombres;
    public static volatile SingularAttribute<Estudiantes, String> eMail;
    public static volatile SingularAttribute<Estudiantes, String> username;

}