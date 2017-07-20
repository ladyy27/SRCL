/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_SESSIONS;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import pkg_CLASES.Matriculas;

/**
 *
 * @author thesis
 */
@Stateless
public class MatriculasFacade extends AbstractFacade<Matriculas> {

    @PersistenceContext(unitName = "com.tesis_srcl3_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MatriculasFacade() {
        super(Matriculas.class);
    }
    
}
