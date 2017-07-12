package pkg_CLASES;
// Generated 04/07/2017 8:41:22 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cursos generated by hbm2java
 */
public class Cursos  implements java.io.Serializable {


     private Integer idCurso;
     private CategoriaCurso categoriaCurso;
     private Periodo periodo;
     private Tutor tutor;
     private String nombreCurso;
     private String descripcion;
     private Integer numHoras;
     private Set<Matriculas> matriculases = new HashSet<Matriculas>(0);

    public Cursos() {
    }

	
    public Cursos(CategoriaCurso categoriaCurso, Periodo periodo, Tutor tutor) {
        this.categoriaCurso = categoriaCurso;
        this.periodo = periodo;
        this.tutor = tutor;
    }
    public Cursos(CategoriaCurso categoriaCurso, Periodo periodo, Tutor tutor, String nombreCurso, String descripcion, Integer numHoras, Set<Matriculas> matriculases) {
       this.categoriaCurso = categoriaCurso;
       this.periodo = periodo;
       this.tutor = tutor;
       this.nombreCurso = nombreCurso;
       this.descripcion = descripcion;
       this.numHoras = numHoras;
       this.matriculases = matriculases;
    }
   
    public Integer getIdCurso() {
        return this.idCurso;
    }
    
    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }
    public CategoriaCurso getCategoriaCurso() {
        return this.categoriaCurso;
    }
    
    public void setCategoriaCurso(CategoriaCurso categoriaCurso) {
        this.categoriaCurso = categoriaCurso;
    }
    public Periodo getPeriodo() {
        return this.periodo;
    }
    
    public void setPeriodo(Periodo periodo) {
        this.periodo = periodo;
    }
    public Tutor getTutor() {
        return this.tutor;
    }
    
    public void setTutor(Tutor tutor) {
        this.tutor = tutor;
    }
    public String getNombreCurso() {
        return this.nombreCurso;
    }
    
    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Integer getNumHoras() {
        return this.numHoras;
    }
    
    public void setNumHoras(Integer numHoras) {
        this.numHoras = numHoras;
    }
    public Set<Matriculas> getMatriculases() {
        return this.matriculases;
    }
    
    public void setMatriculases(Set<Matriculas> matriculases) {
        this.matriculases = matriculases;
    }




}


