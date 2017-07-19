/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_BL;
import pkg_CLASES.*;
import pkg_DATOS.*;

/**
 *
 * @author thesis
 */
public class Tutor_BL {
    Tutor_DATOS tutor_dat = new Tutor_DATOS();
    
    public Tutor consultarTutor(String usuario,String contrasena){
        return tutor_dat.consultar_tutor(usuario, contrasena);
    }
}
