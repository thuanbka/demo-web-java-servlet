
package session_bean;

import entity.CustomerOrder;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class CustomerOrderSessionBean extends AbstractSessionBean<CustomerOrder> {
    
    @PersistenceContext(name = "eMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public CustomerOrderSessionBean(){
        super(CustomerOrder.class);
    }
}

