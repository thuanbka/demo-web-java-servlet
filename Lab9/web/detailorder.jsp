<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Order</title>
        <link rel="stylesheet" type="text/css" href="CSS/css/style.css" />
        <link rel="stylesheet" type="text/css" href="CSS/css/animate.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <div align="center" class="list">
            <table border="1" cellpadding="5" cellspacing="5">
                <caption style="caption-side: top; color:#000; text-align: center;"><h2>Detail Order</h2></caption>
                <tr>
                    <th>Order ID</th>
                    <th>Product ID</th>
                    <th>Quantity</th>
                </tr>
                <c:forEach var="p" items="${orders}">
                    <tr>
                        <td><c:out value="${p.getOrderedProductPK().getOrderId()}" /></td>
                        <td><a href="./detail?${p.getOrderedProductPK().getProductId()}"><c:out value="${p.getOrderedProductPK().getProductId()}" /></a></td>
                        <td><c:out value="${p.getQuantity()}" /></td>
                    </tr>
                </c:forEach>
            </table>          
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