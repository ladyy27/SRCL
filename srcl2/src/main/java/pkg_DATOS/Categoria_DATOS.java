/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_DATOS;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import pkg_CLASES.*;

/**
 *
 * @author ela
 */
public class Categoria_DATOS {
    private Connection connection = new conexionBD().getConection();
    
    public CategoriaCurso categoriaPorEdad (int edad){
        CategoriaCurso categoria = new CategoriaCurso ();
        try {
            CallableStatement statement = connection.prepareCall("{CALL consultar_categoria(?)}");
            statement.setInt("_edad", edad);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            categoria.setNombreCategoria(resultSet.getString("nombre_categoria"));
            return categoria;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
