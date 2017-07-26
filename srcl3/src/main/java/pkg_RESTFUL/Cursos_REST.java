/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_RESTFUL;


import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Singleton;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import pkg_CLASES.*;
import pkg_SESSIONS.*;

/**
 *
 * @author thesis
 */

@Path("cursos")
public class Cursos_REST {
    @EJB
    private CursosFacade ejbCursosFacade ;
    
    @GET
    //@Produces({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML , MediaType.APPLICATION_JSON})
    public List<Cursos>allCursos(){
        return ejbCursosFacade.findAll();
    }
    
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("{id}")
    public Cursos cursoById(@PathParam("id") Integer id){
        return ejbCursosFacade.find(id);
    }
}
