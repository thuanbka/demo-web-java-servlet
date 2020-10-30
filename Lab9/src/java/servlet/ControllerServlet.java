
package servlet;

import Sha256.StringUtil;
import cart.ShoppingCart;
import cart.ShoppingCartItem;
import entity.Category;
import entity.Customer;
import entity.CustomerOrder;
import entity.OrderedProduct;
import entity.OrderedProductPK;
import entity.Product;
import entity.ProductDetail;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;

import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import session_bean.CategorySessionBean;
import session_bean.CustomerOrderSessionBean;
import session_bean.CustomerSessionBean;
import session_bean.OrderProductSessionBean;
//import session_bean.OrderManager;
import session_bean.ProductDetailSessionBean;
import session_bean.ProductSessionBean;

//@WebServlet(name = "ControllerServler",
//            loadOnStartup = 1,
//            urlPatterns = {"/ControllerServlets"}
//        )
//public class ControllerServlet extends HttpServlet {
//
//   @EJB
//    private ProductSessionBean productSessionBean;
//   @EJB
//    private CategorySessionBean categorySessionBean;
//    @Override
//    public void init(ServletConfig servletConfig) throws ServletException {
//
//        super.init(servletConfig);
//
//        // store new product list in servlet context
//        getServletContext().setAttribute("newProducts", productSessionBean.findRange(new int[]{0,6}));
//        getServletContext().setAttribute("newCategorys", categorySessionBean.findAll());
//    }
//}
@WebServlet(name = "ControllerServlet",
        urlPatterns = {"/ControllerServlet",
            "/category",
            "/detail",
            "/addproduct",
            "/addToCart",
            "/viewCart",
            "/checkout",
            "/purchase",
            "/listorder",
            "/deleteorder",
            "/deletecustomer",
            "/detailcustomer",
            "/detailorder",
            "/updateCart"})

public class ControllerServlet extends HttpServlet {

    private static final long serialVersionUID = 1;
    @EJB
    private CategorySessionBean categorySessionBean;
    @EJB
    private ProductDetailSessionBean productDetailSessionBean;
    @EJB
    private ProductSessionBean productSessionBean;

    @EJB
    private CustomerSessionBean customerSessionBean;
    @EJB
    private OrderProductSessionBean orderProductSessionBean;

    @EJB
    private CustomerOrderSessionBean customerOrderSessionBean;

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userPath = request.getServletPath();
        if (userPath.equals("/category")) {
            String categoryId = request.getQueryString();
            if (categoryId != null) {
                Category selectedCategory;
                List<Product> categoryProducts = null;
                selectedCategory = categorySessionBean.find(Integer.parseInt(categoryId));
                getServletContext().setAttribute("selectedCategory", selectedCategory);
                try {
                    categoryProducts = (List<Product>) selectedCategory.getProductCollection();
                } catch (SQLException ex) {
                    Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                getServletContext().setAttribute("categoryProducts", categoryProducts);
            }
            RequestDispatcher rd = request.getRequestDispatcher("category.jsp");
            rd.forward(request, response);
        }

        if (userPath.equals("/deleteorder")) {
            int IDorder = Integer.parseInt(request.getParameter("ido"));
 
            List<OrderedProduct> allorders = orderProductSessionBean.findAll();
            
            for(OrderedProduct orderedProduct:allorders)
            {
               if(orderedProduct.getOrderedProductPK().getOrderId()==IDorder)
               {
                   orderProductSessionBean.remove(orderedProduct);
               }                     
            }
            
            customerOrderSessionBean.remove(customerOrderSessionBean.find(IDorder));
            
            response.sendRedirect(request.getContextPath() + "/listorder");
        }
        
        if (userPath.equals("/deletecustomer")) {
            int IDcustomer = Integer.parseInt(request.getParameter("idc"));
            List<CustomerOrder> allcustomerorders = customerOrderSessionBean.findAll();
            List<OrderedProduct> allorders = orderProductSessionBean.findAll();
             
            for(CustomerOrder customerOrder:allcustomerorders)
            {
                if(customerOrder.getCustomerId()==IDcustomer)
                {
                    int IDorder=customerOrder.getOrderId();
                    
                    for(OrderedProduct orderedProduct:allorders)
                    {
                       if(orderedProduct.getOrderedProductPK().getOrderId()==IDorder)
                       {
                           orderProductSessionBean.remove(orderedProduct);
                       }                     
                    }
                    customerOrderSessionBean.remove(customerOrder);
                }
            }
            Customer customer =customerSessionBean.find(IDcustomer);
            customerSessionBean.remove(customer);
            
            
            
            response.sendRedirect(request.getContextPath() + "/detailcustomer");
        }
       
        if (userPath.equals("/listorder")) {
            List<CustomerOrder> allcustomerorders = customerOrderSessionBean.findAll();
            int page = 1;
            int recordsPerPage = 5;
            if (allcustomerorders.size() < recordsPerPage) {
                recordsPerPage = allcustomerorders.size();
            }
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            List<CustomerOrder> customerorders = new ArrayList<>();
            for (int i = 0; i < recordsPerPage; i++) {
                if (((page - 1) * recordsPerPage + i) < allcustomerorders.size()) {
                    customerorders.add(allcustomerorders.get((page - 1) * recordsPerPage + i));
                }

            }
            int noRecords = allcustomerorders.size();
            int noOfPage = (int) Math.ceil(noRecords * 1.0 / recordsPerPage);
            request.setAttribute("noOfPage", noOfPage);
            request.setAttribute("curentPage", page);
            getServletContext().setAttribute("orders", customerorders);
            RequestDispatcher rd = request.getRequestDispatcher("listorder.jsp");
            rd.forward(request, response);
        }
        if (userPath.equals("/detailcustomer")) {
            int flag = 1;
            String title = "List of Customer";
            int id = 0;
            List<Customer> allcustomers =customerSessionBean.findAll();
            List<Customer> customers = new ArrayList<>();
             int page = 1;
             int recordsPerPage = 5;
            if (request.getParameter("idc") != null) {
                recordsPerPage=1;
                flag = 0;
                title = "Detail Information Customer";
                id = Integer.parseInt(request.getParameter("idc"));
                for(int i=0;i<allcustomers.size();i++)
                {
                    if(allcustomers.get(i).getCustomerId()==id)
                    {
                        customers.add(allcustomers.get(i));
                         break;
                    }   
                }
            } 
            else {
                if (allcustomers.size() < recordsPerPage) {
                    recordsPerPage = allcustomers.size();
                }
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }

                for (int i = 0; i < recordsPerPage; i++) {
                    if (((page - 1) * recordsPerPage + i) < allcustomers.size()) {
                        customers.add(allcustomers.get((page - 1) * recordsPerPage + i));
                    }

                }
            }

            int noRecords = allcustomers.size();
            int noOfPage = (int) Math.ceil(noRecords * 1.0 / recordsPerPage);
            request.setAttribute("noOfPage", noOfPage);
            request.setAttribute("curentPage", page);
            getServletContext().setAttribute("title", title);
            getServletContext().setAttribute("flag", flag);
            getServletContext().setAttribute("customers", customers);
            RequestDispatcher rd = request.getRequestDispatcher("detailcustomer.jsp");
            rd.forward(request, response);
        }

        if (userPath.equals("/detailorder")) {

            int IdOrder = Integer.parseInt(request.getParameter("ido"));
            List<OrderedProduct> allorders = orderProductSessionBean.findAll();
            List<OrderedProduct> orders = new ArrayList<>();
            for (OrderedProduct orderedProduct:allorders) {
                if (orderedProduct.getOrderedProductPK().getOrderId() == IdOrder) {
                    orders.add(orderedProduct);
                }
            }
            getServletContext().setAttribute("orders", orders);
            RequestDispatcher rd = request.getRequestDispatcher("detailorder.jsp");
            rd.forward(request, response);
        }

        if (userPath.equals("/detail")) {
            String productId = request.getQueryString();
            if (productId != null) {
                ProductDetail productDetail = productDetailSessionBean.find(Integer.parseInt(productId));
                Product product = productSessionBean.find(Integer.parseInt(productId));
                getServletContext().setAttribute("productDetail", productDetail);
                getServletContext().setAttribute("product", product);
            }
            RequestDispatcher rd = request.getRequestDispatcher("detailproduct.jsp");
            rd.forward(request, response);
        }

        if (userPath.equals("/addproduct")) {
            RequestDispatcher rd = request.getRequestDispatcher("addproduct.jsp");
            rd.forward(request, response);
        }
        if (userPath.equals("/viewCart")) {
            String clear = request.getParameter("clear");

            if ((clear != null) && clear.equals("true")) {

                ShoppingCart cart = (ShoppingCart) getServletContext().getAttribute("cart");
                cart.clear();

            }
            RequestDispatcher rd = request.getRequestDispatcher("viewcart.jsp");
            rd.forward(request, response);
        }
        if (userPath.equals("/addToCart")) {
            ShoppingCart cart = (ShoppingCart) getServletContext().getAttribute("cart");

            if (cart == null) {
                cart = new ShoppingCart();
                getServletContext().setAttribute("cart", cart);
            }
            String productId = request.getQueryString();

            if (!productId.isEmpty()) {
                Product product = productSessionBean.find(Integer.parseInt(productId));
                cart.addItem(product);
            }
//            String userView = (String)getServletContext().getAttribute("view");
//            userPath = userView;
            response.sendRedirect(request.getContextPath() + "/viewCart");
        }
        if (userPath.equals("/checkout")) {
            ShoppingCart cart = (ShoppingCart) getServletContext().getAttribute("cart");
            cart.calculateTotal("20000");
            RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (userPath.equals("/addproduct")) {
            String price = null, image1 = null, image2 = null, image3 = null, image4 = null, image5 = null, name = null;
            String accessories = null, guaranty = null, described = null, describe_short = null;
            int idcategory = 0;

            boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
            if (!isMultipartContent) {
                return;
            }
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List< FileItem> fields = upload.parseRequest(request);
                Iterator< FileItem> it = fields.iterator();
                if (!it.hasNext()) {
                    return;
                }

                while (it.hasNext()) {
                    FileItem fileItem = it.next();
                    boolean isFormField = fileItem.isFormField();

                    if (isFormField) {
                        if (fileItem.getFieldName().equals("name")) {
                            name = fileItem.getString("UTF-8");
                        }
                        if (fileItem.getFieldName().equals("price")) {
                            price = getHanlePrice(fileItem.getString("UTF-8"));
                        }
                        if (fileItem.getFieldName().equals("describe_short")) {
                            describe_short = fileItem.getString("UTF-8");
                        }
                        if (fileItem.getFieldName().equals("described")) {
                            described = fileItem.getString("UTF-8");
                        }
                        if (fileItem.getFieldName().equals("guaranty")) {
                            guaranty = fileItem.getString("UTF-8");
                        }
                        if (fileItem.getFieldName().equals("accessories")) {
                            accessories = fileItem.getString("UTF-8");
                        }
                        if (fileItem.getFieldName().equals("category")) {
                            idcategory = Integer.parseInt(fileItem.getString("UTF-8"));
                        }
                    } else {
                        if (fileItem.getSize() > 0) {
                            fileItem.write(new File("F:\\java\\Lab9\\web\\img\\demo\\" + fileItem.getName()));
                            if (fileItem.getFieldName().equals("image1")) {
                                image1 = fileItem.getName();
                            }
                            if (fileItem.getFieldName().equals("image2")) {
                                image2 = fileItem.getName();
                            }
                            if (fileItem.getFieldName().equals("image3")) {
                                image3 = fileItem.getName();
                            }
                            if (fileItem.getFieldName().equals("image4")) {
                                image4 = fileItem.getName();
                            }
                            if (fileItem.getFieldName().equals("image5")) {
                                image5 = fileItem.getName();
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            }
//            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            rd.forward(request, response);

            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            int productid = StringUtil.applySha256(accessories + accessories + name + java.time.LocalTime.now());
            ProductDetail productDetail = new ProductDetail();
            productDetail.setAccessories(accessories);
            productDetail.setGuaranty(guaranty);
            productDetail.setImage1(image1);
            productDetail.setImage2(image2);
            productDetail.setImage3(image3);
            productDetail.setImage4(image4);
            productDetail.setImage5(image5);
            productDetail.setInforrmation(described);
            productDetail.setProductId(productid);
//           
            productDetailSessionBean.create(productDetail);

            Product product = new Product();
            product.setCategoryId(idcategory);
            product.setLastUpdate(date);
            product.setDescription(describe_short);
            product.setDescriptionDetail(described);
            product.setProductId(productid);
            product.setImage(image1);
            product.setThumbImage(image1);
            product.setPrice(Double.parseDouble(price));
            product.setName(name);

            productSessionBean.create(product);

            getServletContext().setAttribute("productDetail", productDetail);
            getServletContext().setAttribute("product", product);
            RequestDispatcher rd = request.getRequestDispatcher("detailproduct.jsp");
            rd.forward(request, response);
        }

        if (userPath.equals("/updateCart")) {
            ShoppingCart cart = (ShoppingCart) getServletContext().getAttribute("cart");
            String productId = request.getParameter("productId");
            String number = request.getParameter("quantity");
            Product product = productSessionBean.find(Integer.parseInt(productId));
            cart.update(product, number);
            response.sendRedirect(request.getContextPath() + "/viewCart");
        }
        if (userPath.equals("/purchase")) {

            ShoppingCart cart = (ShoppingCart) getServletContext().getAttribute("cart");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String cityRegion = request.getParameter("cityRegion");
            String ccNumber = request.getParameter("creditcard");
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            int number = StringUtil.applySha256(email + java.time.LocalTime.now());
            int customerId = StringUtil.applySha256(email);
            int orderId = number + (int) cart.getTotal();

            CustomerOrder order = new CustomerOrder();

            order.setConfirmationNumber(number);
            order.setAmount((int) cart.getTotal());
            order.setDateCreated(date);
            order.setCustomerId(customerId);
            order.setOrderId(orderId);
            customerOrderSessionBean.create(order);
            request.setAttribute("orderRecord", order);

            Customer customer = new Customer(customerId, name, email, address, Integer.parseInt(phone), cityRegion);
            request.setAttribute("customer", customer);
            if (customerSessionBean.findAll().isEmpty() || (customerSessionBean.find(customerId) == null)) {
                customerSessionBean.create(customer);
            }

            OrderedProduct orderedProduct = new OrderedProduct();

            List<OrderedProduct> orderedProducts = new ArrayList<OrderedProduct>();
            List<Product> products = new ArrayList<Product>();
            for (int i = 0; i < cart.getItems().size(); i++) {
                OrderedProductPK orderProductPK = new OrderedProductPK();
                Product product = new Product();
                product = cart.getItems().get(i).getProduct();
                orderProductPK.setOrderId(orderId);
                orderProductPK.setProductId(cart.getItems().get(i).getProduct().getProductId());
                orderedProduct.setOrderedProductPK(orderProductPK);
                orderedProduct.setQuantity((int) cart.getItems().get(i).getQuantity());
                products.add(product);
                orderedProducts.add(orderedProduct);
                orderProductSessionBean.create(orderedProduct);
            }

            cart.clear();
            request.setAttribute("products", products);
            request.setAttribute("orderedProducts", orderedProducts);
            RequestDispatcher rd = request.getRequestDispatcher("confirmation.jsp");
            // RequestDispatcher rd = request.getRequestDispatcher("confirmation.jsp");
            rd.forward(request, response);
        }
    }

    public String getHanlePrice(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '.') {
                s = s.substring(0, i) + s.substring(i + 1);
            }
        }
        return s;
    }
}
