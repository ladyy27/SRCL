/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_BL;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import pkg_DATOS.*;
import pkg_CLASES.*;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author ela
 */
public class Estudiantes_BL {

    Estudiantes_DATOS estudiantesD = new Estudiantes_DATOS();

    //Estudiantes estudiante = new Estudiantes();
    public void crearEstudianteBL(Estudiantes estudiante) {
        estudiantesD.crearEstudiante(estudiante);
    }

    public Estudiantes consultar_estudiante(String cedula) {
        //Estudiantes eBL = new Estudiantes();
        //eBL = estudiantesD.consultar_estudiante(cedula);
        return estudiantesD.consultar_estudiante(cedula);
    }
    
     public Estudiantes loginEst(String usuario,String contrasena){
        return estudiantesD.login_estudiante(usuario, contrasena);
    }

    public int calcularEdad(Estudiantes e) {
        
        int edad = 0;
        DateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        String t="";
        System.out.println("calcularEdad "+e.getFechaNac());
        try {
            t = ft.format(e.getFechaNac());
            System.out.println("calcularEdad "+t);
        } catch (Exception ee) {
            System.out.println("Unparseable using " + ft);
        }
        
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fechaNac = LocalDate.parse(t.subSequence(0, t.length()), fmt);
        LocalDate ahora = LocalDate.now();

        Period periodo = Period.between(fechaNac, ahora);
        System.out.println("Edad en años = "+ periodo.getYears());
        edad = periodo.getYears();
        return edad;
    }

}
