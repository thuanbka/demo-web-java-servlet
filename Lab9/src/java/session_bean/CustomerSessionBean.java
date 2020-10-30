
package session_bean;

import entity.Customer;
import javax.ejb.Stateless;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class CustomerSessionBean extends AbstractSessionBean<Customer> {
    
    @PersistenceContext(name = "eMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public CustomerSessionBean(){
        super(Customer.class);
    }
}
