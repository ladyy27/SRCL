/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_DATOS;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import pkg_CLASES.*;


/**
 *
 * @author thesis
 */
public class RegistroNotas_DATOS {

    private Connection connection = new conexionBD().getConection();

    public void crearRegistroNotas(Matriculas matricula) {
        try {
            CallableStatement statement = connection.prepareCall("{call crearRegistroNotasByEstudiante(?,?,?,?,?)}");
            statement.setDouble("_nota1", 0);
            statement.setDouble("_nota2", 0);
            statement.setDouble("_notaFinal", 0);
            statement.setString("_estado", "EN CURSO");
            statement.setInt("_idMat", matricula.getIdMatricula());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

}
