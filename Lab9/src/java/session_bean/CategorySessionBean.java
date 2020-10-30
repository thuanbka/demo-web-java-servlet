
package session_bean;

import entity.Category;
import entity.Product;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class CategorySessionBean extends AbstractSessionBean<Category> {
    
    @PersistenceContext(name = "eMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public CategorySessionBean(){
        super(Category.class);
    }
    
}

