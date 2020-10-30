<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail ${product.getName()}</title>
        <link rel="stylesheet" type="text/css" href="CSS/css/style.css" />
        <link rel="stylesheet" type="text/css" href="CSS/css/animate.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <div id="container">
            <div class="one">
                <div class="heading_bg">
                    <h2 style="padding-left: 130px;">${product.getName()}</h2>
                </div>
                <div id="panes"> 
                    <div>
                        <div class="image">
                            <div id="prime">
                                <img id="re" src="${initParam.imgProductPath}${product.getImage()}" alt=""> 
                            </div>       
                            <div id="images">
                                <c:forEach var="i" begin = "1" end = "${productDetail.getNumberImage()}"> 
                                    <img  onmouseover="b('${productDetail.getImage(i)}')" src="${initParam.imgProductPath}${productDetail.getImage(i)}" alt=""> 
                                </c:forEach>
                            </div>
                        </div>

                        <div class="detail">
                            <h1>Technical Details</h1> 
                            <p>${productDetail.getInforrmation() }</p>
                            <h1>Accessories</h1> 
                            <p>${productDetail.getAccessories() }</p>
                            <h1>Guaranty</h1> 
                            <p>${productDetail.getGuaranty() }</p>
                            <h1>Price</h1> 
                            <p>${product.getStringPrice()}</p>
                            <a href="<c:url value='addToCart?${product.getProductId()}'/>" class="button">Add to cart</a>
                        </div>
                    </div> 
                </div> 
            </div>
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
    <script>
                                        function b(str) {
                                            var html = "";
                                            html += "<img id='re' src='img/demo/" + str + "'>";
                                            // alert(html);
                                            document.getElementById('prime').innerHTML = html;
                                        }
//        var drop = document.getElementById('images');
//        drop.addEventListener("mouseover", function(){
//                document.getElementById('re').innerHTML = "<img src='" + str + "'width='300px'height='300px'>;
//        }); 
    </script>
</html>

