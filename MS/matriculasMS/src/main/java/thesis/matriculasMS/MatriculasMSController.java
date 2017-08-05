/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thesis.matriculasMS;

import java.util.ArrayList;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import thesis.pkg_CLASES.Matriculas;
import thesis.pkg_SESSIONS.MatriculasFacade;

/**
 *
 * @author ela
 */
@RestController
@RequestMapping("/matriculas")
public class MatriculasMSController {
    
    //@EJB
    //@Autowired
    private MatriculasFacade mf = MatriculasFacade.getMatricula();
    //private MatriculasFacade ejbMatriculasFacade;

    @GetMapping(value="/{curso}" , produces= MediaType.APPLICATION_JSON)
    @ResponseBody
    //@Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Matriculas> matriculasPorCurso(@PathVariable Integer curso){
        //System.out.println("curso: "+curso);
        return mf.matriculasByCurso(curso);
    }
    
    
    
}
