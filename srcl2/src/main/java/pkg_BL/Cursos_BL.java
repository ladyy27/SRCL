/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_BL;
import pkg_CLASES.*;
import pkg_DATOS.*;
import java.util.ArrayList;

/**
 *
 * @author ela
 */
public class Cursos_BL {
    
    private Cursos_DATOS cursosDatos = new Cursos_DATOS();
    
    /*public ArrayList<Object> lista_cursosBL(){
        
        ArrayList<Object> listaCursosBL  = new ArrayList<Object>();
        
        listaCursosBL = cursosDatos.lista_cursosDATOS();
        
        return listaCursosBL;
    }*/
    
   public ArrayList<Cursos> cursosPorCategoriaBL(int edad) {
        ArrayList<Cursos> listCursosPorCategoriaBL = new ArrayList<Cursos>();
        listCursosPorCategoriaBL = cursosDatos.cursosPorCategoria(edad);
        return listCursosPorCategoriaBL;
    }
    
}
