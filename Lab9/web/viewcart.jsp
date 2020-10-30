<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="CSS/css/style.css" />
        <link rel="stylesheet" type="text/css" href="CSS/css/animate.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <c:set var='view' value='/viewCart' scope='session' />
        <div id="container">
            <div class="one">
                <div class="heading_bg">
                    <h2>Information of your cart</h2>
                </div>
                <div class="two-third">
                    <c:if test="${!empty cart && cart.numberOfItems != 0}">
                        <table border="0">
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                                <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">
                                    <c:set var="product" value="${cartItem.product}"/>
                                <tr>
                                    <td>${product.name}</td>
                                    <td class="">
                               ${cart.getStringPrice(cartItem.total)}${product.getCurrency()}
                                <br>
                                <span class="smallText">(
                                   ${product.getStringPrice()}${product.getCurrency()}
                                    / unit )</span>
                                </td>
                                <td>
                                    <form action="<c:url value='updateCart'/>" method="post">
                                        <input type="hidden"
                                               name="productId"
                                               value="${product.getProductId()}" />
                                        <input type="text"
                                               maxlength="2"
                                               size="2"
                                               value="${cartItem.quantity}"
                                               name="quantity"
                                               style="margin:5px" />
                                        <input type="submit"
                                               name="submit"
                                               value="update" />
                                    </form>
                                </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td></td>
                                <td>Total:
                             ${cart.getStringPrice(cart.subtotal)}${product.getCurrency()}
                            </td>
                            <td></td>
                            </tr>
                        </table>
                    </c:if>
                </div>
                <div class="sidebar_right">
                    <c:set var="value">
                        <c:choose>
                            <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
                            <c:when test="${!empty selectedCategory}">
                                category
                            </c:when>
                            <%-- otherwise send user to welcome page --%>
                            <c:otherwise>
                                index.jsp
                            </c:otherwise>
                        </c:choose>
                    </c:set>
                    <ul class="sidebar_menu" style="margin:0">
                        <li><a href="#"><strong>
                                    <c:choose>
                                        <c:when test="${cart.numberOfItems > 1}">
                                            Your cart contains ${cart.numberOfItems} items
                                        </c:when>
                                        <c:when test="${cart.numberOfItems == 1}">
                                            Your cart contains ${cart.numberOfItems} item
                                        </c:when>
                                        <c:otherwise>
                                            Your cart is empty
                                        </c:otherwise>
                                    </c:choose></strong>
                            </a>
                        </li>
                        <c:if test="${!empty cart && cart.numberOfItems != 0}">
                            <c:url var="url" value="viewCart">
                                <c:param name="clear" value="true"/>
                            </c:url>
                            <li><a href="${url}">&#x279f; Clear your cart</a></li>
                            </c:if>
                            <c:url var="url" value="${value}"/>
                        <li><a href="${url}">&#x279f; Continue shopping</a></li>
                            <c:if test="${!empty cart && cart.numberOfItems != 0}">
                            <li><a href="<c:url value='checkout'/>">Proceed to checkout</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
            <div style="clear:both; height: 40px"></div>
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

