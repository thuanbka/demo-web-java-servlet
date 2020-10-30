<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
        <link rel="stylesheet" type="text/css" href="CSS/css/style.css" />
        <link rel="stylesheet" type="text/css" href="CSS/css/animate.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <div id="container">
            <div class="one">
                <div class="heading_bg">
                    <h2 style="padding-left: 20px;">${selectedCategory.getName()}</h2>
                </div>
                <div id="portfolio">
                    <div class="portfolio-container" id="columns">
                        <ul>
                            <c:forEach var="product" items="${categoryProducts}">
                                <li class="one-third">
                                    <p>
                                        <a title="${product.getName()}" href="img/demo/${product.getImage()}" class="portfolio-item-preview" data-rel="prettyPhoto">
                                            <img src="${initParam.imgProductPath}${product.getImage()}" alt="" width="210" height="145" class="portfolio-img pretty-box">
                                        </a>
                                    </p>
                                    <h4><a href="#">${product.getName()}</a></h4>
                                    <p>${product.getDescription() }</p>
                                    <p style="text-align: left">
                                        <a href="./detail?${product.getProductId()}" class="button_small white">See Details &raquo;</a>
                                    </p>
                                </li>
                            </c:forEach>  
                        </ul>
                    </div>
                </div>
            </div>
            <hr>
            <div id="prod_nav"> 
                <ul>
                    <c:set var="count Product" scope="request" value="${1}" /> 
                    <c:forEach var="product" items="${newProducts}"> 
                        <li> 
                            <a href="./detail?${product.getProductId()}">
                                <img src="${initParam.imgProductPath}${product.getThumbImage()}" alt=""> 
                                <div class="price">
                                    <strong>${product.getName()}</strong>
                                    <span>${product.getStringPrice()}${product.getCurrency()} </span>
                                </div>
                            </a> 
                        </li>
                        <c:set var="count Product" scope="request" value="${countProduct+1}" />
                    </c:forEach>
                </ul>
            </div>
            <div class="different">
                <c:forEach var="category" items="${newCategorys}">
                    <div class="one-fourth"> 
                        <div class="heading_bg">
                            <h2>${category.getName()}</h2> 
                        </div>
                        <a href="./category?${category.getCategoryId()}">
                            <img src="${initParam.imgProductPath}${category.getImage()}" width="217" alt=""> 
                        </a>   
                    </div> 
                </c:forEach> 
            </div>
        </div>
        <script src="CSS/js/jquery.min.js"></script>
        <script src="CSS/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="CSS/js/jquery.waypoints.min.js"></script>
        <script src="CSS/js/jquery.stellar.min.js"></script>
        <script src="CSS/js/owl.carousel.min.js"></script>
        <script src="CSS/js/aos.js"></script>
        <script src="CSS/js/scrollax.min.js"></script>
        <script src="CSS/js/main.js"></script>
    </body>
</html>

