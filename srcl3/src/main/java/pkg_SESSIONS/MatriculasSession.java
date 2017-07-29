/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_SESSIONS;

import java.sql.Connection;
import pkg_DATOS.conexionBD;

/**
 *
 * @author ela
 */
public class MatriculasSession {
    
    private Connection connection = new conexionBD().getConection();
    //Singleton
    //1. Variable estatica privada
    private static final MatriculasSession mf = new MatriculasSession();
    
}
