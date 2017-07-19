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
public class Matriculas_BL {

    Matriculas_DATOS matDATOS = new Matriculas_DATOS();

    public void crearMatricula(Estudiantes estudiante, Cursos cursos) {
        matDATOS.crearMatricula(estudiante, cursos);
    }

    public Matriculas consultarMatriculaBL(int idEst, int idCurso) {
        return matDATOS.consultarMatricula(idEst, idCurso);
    }

}
