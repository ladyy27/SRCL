/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_DATOS;

import java.util.ArrayList;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.DateFormat;
import pkg_CLASES.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author ela
 */
public class Matriculas_DATOS {
    
    private Connection connection = new conexionBD().getConection();
    
    public void crearMatricula (Estudiantes estudiante, Cursos cursos){
        
        LocalDate ahora = LocalDate.now();
        DateTimeFormatter ft = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String fechaString = ahora.format(ft);
        
        try {
            CallableStatement statement = connection.prepareCall("{CALL crear_matricula (?,?,?,?)}");
            statement.setString("_estado", "ACEPTADA");
            statement.setDate("_fecha", java.sql.Date.valueOf(fechaString));
            statement.setInt("_idEstudiante", estudiante.getIdEstudiante());
            statement.setInt("_idCurso", cursos.getIdCurso());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
                   
    }
    
    public Matriculas consultarMatricula(int idEst, int idCurso){ 
        try {
            CallableStatement statement = connection.prepareCall("{call consultarMatricula(?,?)}");
            statement.setInt("_idEst", idEst );
            statement.setInt("_idCurso", idCurso);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
                Matriculas mat = new Matriculas();
                /*Estudiantes e= new Estudiantes();
                e.setIdEstudiante(resultSet.getInt("id_estudiante"));
                Cursos c = new Cursos();
                c.setIdCurso(resultSet.getInt("id_curso"));*/
                mat.setIdMatricula(resultSet.getInt("idMatricula"));
                mat.setEstado(resultSet.getString("estado"));
                mat.setFechaMat(resultSet.getDate("fecha_mat"));
                /*mat.setEstudiantes(e);
                mat.setCursos(c);*/
                return mat;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }   
}
