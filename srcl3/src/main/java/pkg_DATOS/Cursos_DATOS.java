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
import java.util.Date;
import pkg_CLASES.*;

/**
 *
 * @author ela
 */
public class Cursos_DATOS {
    

    private Connection connection = new conexionBD().getConection();

    /*public ArrayList<Object> lista_cursosDATOS() {

        ArrayList<Object> listaCursos = new ArrayList<Object>();

        try {
            CallableStatement statement = connection.prepareCall("{CALL consulta_cursos()}");
            ResultSet resultSet = statement.executeQuery();

            

            while (resultSet.next()) {
                Cursos cursos = new Cursos();
                CategoriaCurso categoria = new CategoriaCurso();
                Tutor tutor = new Tutor();
                cursos.setIdCurso(resultSet.getInt("id_curso"));
                cursos.setNombreCurso(resultSet.getString("nombre_curso"));
                cursos.setDescripcion(resultSet.getString("descripcion"));
                cursos.setNumHoras(resultSet.getInt("num_horas"));
                categoria.setNombreCategoria(resultSet.getString("nombre_categoria"));
                tutor.setNombreTutor(resultSet.getString("nombre_tutor"));
                tutor.setApellidoTutor(resultSet.getString("apellido_tutor"));
                listaCursos.add(cursos);
                listaCursos.add(categoria);
                listaCursos.add(tutor);
            }

            return listaCursos;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }

    }*/
    public ArrayList<Cursos> cursosPorCategoria(int edad) {
        ArrayList<Cursos> listCursosPorCategoria = new ArrayList<Cursos>();
        

        try {
            CallableStatement statement = connection.prepareCall("{CALL cursosXcategoria(?)}");
            statement.setInt("_edad", edad);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Cursos cursos = new Cursos();
                cursos.setIdCurso(resultSet.getInt("id_curso"));
                cursos.setNombreCurso(resultSet.getString("nombre_curso"));
                listCursosPorCategoria.add(cursos);
            }
            return listCursosPorCategoria;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
 
    public ArrayList<Cursos> cursosPorTutor(int idTutor) {
        ArrayList<Cursos> listCursosPorTutor = new ArrayList<Cursos>();
        try {
            CallableStatement statement = connection.prepareCall("{CALL cursosXtutor(?)}");
            statement.setInt("_idtutor", idTutor);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                CategoriaCurso cc= new CategoriaCurso();
                cc.setNombreCategoria(resultSet.getString("nombre_categoria"));
                Periodo p = new Periodo();
                p.setNombrePeriodo(resultSet.getString("nombre_periodo"));
                Cursos cursos = new Cursos();
                cursos.setIdCurso(resultSet.getInt("id_curso"));
                cursos.setNombreCurso(resultSet.getString("nombre_curso"));
                cursos.setDescripcion(resultSet.getString("descripcion"));
                cursos.setNumHoras(resultSet.getInt("num_horas"));
                cursos.setCategoriaCurso(cc);
                cursos.setPeriodo(p);                
                listCursosPorTutor.add(cursos);
            }
            return listCursosPorTutor;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

}
