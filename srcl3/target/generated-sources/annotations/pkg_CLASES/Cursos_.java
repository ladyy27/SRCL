package pkg_CLASES;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import pkg_CLASES.CategoriaCurso;
import pkg_CLASES.Matriculas;
import pkg_CLASES.Periodo;
import pkg_CLASES.Tutor;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-08-04T14:06:28")
@StaticMetamodel(Cursos.class)
public class Cursos_ { 

    public static volatile SingularAttribute<Cursos, String> descripcion;
    public static volatile SingularAttribute<Cursos, Integer> numHoras;
    public static volatile SingularAttribute<Cursos, Tutor> idTutor;
    public static volatile SingularAttribute<Cursos, Integer> idCurso;
    public static volatile SingularAttribute<Cursos, String> nombreCurso;
    public static volatile SingularAttribute<Cursos, Periodo> idPeriodo;
    public static volatile ListAttribute<Cursos, Matriculas> matriculasList;
    public static volatile SingularAttribute<Cursos, CategoriaCurso> idCategoria;

}