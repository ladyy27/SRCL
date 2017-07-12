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
    
    
}
