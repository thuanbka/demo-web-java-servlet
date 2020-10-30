
package session_bean;

import entity.Product;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class ProductSessionBean extends AbstractSessionBean<Product> {
    
    @PersistenceContext(name = "eMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public ProductSessionBean(){
        super(Product.class);
    }
}

