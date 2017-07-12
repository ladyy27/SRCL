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
 * @author ela
 */
public class Categoria_BL {
    
    Categoria_DATOS cDatos = new Categoria_DATOS();

    public CategoriaCurso categoriaPorEdadBL(int edad) {
        CategoriaCurso cc = new CategoriaCurso();
        cc = cDatos.categoriaPorEdad(edad);    
        return cc;
    }

}
