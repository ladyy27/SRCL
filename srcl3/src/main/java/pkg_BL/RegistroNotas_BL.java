/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_BL;
import pkg_DATOS.*;
import pkg_CLASES.*;

/**
 *
 * @author thesis
 */
public class RegistroNotas_BL {
    RegistroNotas_DATOS regDATOS = new RegistroNotas_DATOS();
    
    public void crearRegistroNotasBL (Matriculas matricula){
        regDATOS.crearRegistroNotas(matricula);
    }
    
}
