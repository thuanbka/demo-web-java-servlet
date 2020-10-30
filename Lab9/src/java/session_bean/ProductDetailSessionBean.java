
package session_bean;

import entity.Product;
import entity.ProductDetail;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;


@Stateless
public class ProductDetailSessionBean extends AbstractSessionBean<ProductDetail> {
    
    @PersistenceContext(name = "eMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public ProductDetailSessionBean(){
        super(ProductDetail.class);
    }
}

