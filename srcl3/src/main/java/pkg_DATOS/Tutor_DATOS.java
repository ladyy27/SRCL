/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_DATOS;

import java.sql.Connection;
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
public class Tutor_DATOS {
    
    private Connection connection = new conexionBD().getConection();
    
    public Tutor consultar_tutor(String usuario, String contrasena){
        
        try {
            CallableStatement statement = connection.prepareCall("{call consultar_tutor (?,?)}");
            statement.setString("_usuario", usuario);
            statement.setString("_contrasena", contrasena);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
                Tutor t = new Tutor ();
                t.setIdTutor(resultSet.getInt("id_tutor"));
                t.setNombreTutor(resultSet.getString("nombre_tutor"));
                t.setApellidoTutor(resultSet.getString("apellido_tutor"));
                return t;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    
}
