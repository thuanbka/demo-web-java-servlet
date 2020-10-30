
package session_bean;

import entity.CustomerOrder;
import entity.OrderedProduct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author PhongVu
 */
@Stateless
public class OrderProductSessionBean extends AbstractSessionBean<OrderedProduct> {
    
    @PersistenceContext(name = "eMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public OrderProductSessionBean(){
        super(OrderedProduct.class);
    }
}
