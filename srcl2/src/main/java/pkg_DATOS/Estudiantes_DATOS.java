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
import java.util.Date;

/**
 *
 * @author ela
 */
public class Estudiantes_DATOS {

    private Connection connection = new conexionBD().getConection();
    

    public void crearEstudiante(Estudiantes estudiante) {

        DateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        String t="";
        try {
            t = ft.format(estudiante.getFechaNac());
            System.out.println(t);
        } catch (Exception e) {
            System.out.println("Unparseable using " + ft);
        }
        //System.out.println("-------fecha en DTOS:"+t);
        
        try {
            CallableStatement statement = connection.prepareCall("{CALL crear_estudiante (?,?,?,?,?,?,?)}");
            statement.setString("_cedula", estudiante.getCi());
            statement.setString("_nombres", estudiante.getNombres());
            statement.setString("_apellidos", estudiante.getApellidos());
            statement.setDate("_fechaNac", java.sql.Date.valueOf(t));
            statement.setString("_email", estudiante.getEMail());
            statement.setString("_username", estudiante.getUsername());
            statement.setString("_password", estudiante.getPassword());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
    
     public Estudiantes consultar_estudiante(String cedula) {
        
        try {
            CallableStatement statement = connection.prepareCall("{call consultar_estudiante (?)}");
            statement.setString("_cedula", cedula);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
                Estudiantes eDATOS = new Estudiantes();
                eDATOS.setIdEstudiante(resultSet.getInt("id_estudiante"));
                eDATOS.setCi(resultSet.getString("CI"));
                eDATOS.setNombres(resultSet.getString("nombres"));
                eDATOS.setApellidos(resultSet.getString("apellidos"));
                eDATOS.setFechaNac(resultSet.getDate("fecha_nac"));
                return eDATOS;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

}
