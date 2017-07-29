package pkg_CLASES;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import pkg_CLASES.Cursos;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-07-24T14:56:47")
@StaticMetamodel(Tutor.class)
public class Tutor_ { 

    public static volatile SingularAttribute<Tutor, Integer> idTutor;
    public static volatile SingularAttribute<Tutor, String> password;
    public static volatile SingularAttribute<Tutor, String> cItutor;
    public static volatile SingularAttribute<Tutor, String> nombreTutor;
    public static volatile SingularAttribute<Tutor, String> apellidoTutor;
    public static volatile ListAttribute<Tutor, Cursos> cursosList;
    public static volatile SingularAttribute<Tutor, String> titulo;
    public static volatile SingularAttribute<Tutor, Integer> rol;
    public static volatile SingularAttribute<Tutor, String> eMail;
    public static volatile SingularAttribute<Tutor, String> username;

}