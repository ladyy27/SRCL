/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_RESTFUL;

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
@Path("matriculass")
public class Matriculas_Curso {
    @EJB
    private MatriculasFacade ejbMatriculasFacade ;
    
    @GET
    //@Produces({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML})
    public List<Matriculas>allMatriculas(){
        return ejbMatriculasFacade.findAll();
    }
    
    @GET
    @Produces({MediaType.APPLICATION_XML})
    @Path("id")
    public Matriculas matriculaById(@PathParam("id") Integer id){
        return ejbMatriculasFacade.find(id);
    }
    
}
