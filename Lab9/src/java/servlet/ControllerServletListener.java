
package servlet;

import entity.Category;
import entity.Product;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import session_bean.CategorySessionBean;
import session_bean.ProductSessionBean;

public class ControllerServletListener implements ServletContextListener {

    @EJB
    ProductSessionBean productSessionBean;
    
     @EJB
     CategorySessionBean categorySessionBean;
     
    ServletContext context;
    
    int []range={0,6};

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        context = sce.getServletContext();
        List<Product> newProducttemp=new ArrayList<Product>();
        List<Product> newProducts=new ArrayList<Product>();
        newProducttemp=productSessionBean.findAll();
        int n=newProducttemp.size();
        if(n>=6)
        {
            for(int i=0;i<6;i++)
            {
                newProducts.add(newProducttemp.get(n-i-1));
            }
        }  
        context.setAttribute("newProducts", newProducts);   
        context.setAttribute("newCategorys", categorySessionBean.findAll());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        this.context = null;
    }

}
