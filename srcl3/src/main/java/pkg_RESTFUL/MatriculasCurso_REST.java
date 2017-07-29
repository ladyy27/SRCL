/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_RESTFUL;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import pkg_CLASES.*;
import pkg_SESSIONS.*;

/**
 *
 * @author ela
 */
@Path("matriculas")
public class MatriculasCurso_REST {

    

    //@EJB
    private MatriculasFacade mf = MatriculasFacade.getMatricula();
    //private MatriculasFacade ejbMatriculasFacade;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("{curso}")
    public ArrayList<Matriculas> matriculasPorCurso(@PathParam("curso") Integer curso){
        System.out.println("curso: "+curso);
        return mf.matriculasByCurso(curso);
    }
    
    /*@GET
    @Produces({MediaType.APPLICATION_XML})
    public List<Matriculas> allMatriculas() {
        return mf.findAll();
        //return ejbMatriculasFacade.findAll();
    }*/
    
    

    /*@GET
    @Produces({MediaType.APPLICATION_XML})
    @Path("id")
    public Matriculas matriculaById(@PathParam("id") Integer id) {
        return mf.find(id);
    }*/

}
