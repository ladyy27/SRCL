package pkg_CLASES;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import pkg_CLASES.Cursos;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-08-04T14:06:28")
@StaticMetamodel(Periodo.class)
public class Periodo_ { 

    public static volatile SingularAttribute<Periodo, String> nombrePeriodo;
    public static volatile SingularAttribute<Periodo, Date> fechaInicio;
    public static volatile ListAttribute<Periodo, Cursos> cursosList;
    public static volatile SingularAttribute<Periodo, Integer> idPeriodo;
    public static volatile SingularAttribute<Periodo, Date> fechaFin;

}