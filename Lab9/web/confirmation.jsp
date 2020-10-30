<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm</title>
        <link rel="stylesheet" type="text/css" href="CSS/css/style.css" />
        <link rel="stylesheet" type="text/css" href="CSS/css/animate.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <fmt:bundle basename = "ResourceBundle.Res_Bun_Eng" prefix="count.">
            <div id="container">
                <div class="one">
                    <div class="heading_bg">
                        <h2>Confirmation</h2>
                    </div>
                    <p id="confirmationText">
                        <strong><fmt:message key="successMessage" /></strong>
                        <br />
                        <br />
                        <fmt:message key="confirmationNumberMessage"/>
                        <strong>${orderRecord.confirmationNumber}</strong>
                        <br>
                        <fmt:message key="contactMessage"/>
                        <br><br>
                        <fmt:message key="thankYouMessage"/>
                    </p>
                </div>
                <div class="inforconfirm">
                    <div class="confirmorrder">
                        <div class="heading_bg">
                            <h3><fmt:message key="orderSummary"/></h3>
                        </div>
                        <table>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>

                            <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">
                                <tr>
                                    <td>
                                        ${products[iter.index].name}
                                    </td>
                                    <td>
                                        ${orderedProduct.quantity}
                                    </td>
                                    <td>${cart.getStringPrice(products[iter.index].price * orderedProduct.quantity)}₫</td>
                                </tr>
                            </c:forEach>

                            <tr>
                                <td colspan="2"><strong><fmt:message key="surcharge"/>:</strong></td>
                                <td>${cart.getStringPrice(initParam.deliveryFee)}₫</td>
                            </tr>

                            <tr>
                                <td colspan="2"><strong><fmt:message key="total"/>:</strong></td>
                                <td>${cart.getStringPrice(orderRecord.amount)}₫</td>
                            </tr>
                            <tr>
                                <td colspan="3"><strong><fmt:message key="dateProcessed"/>:</strong>
                                    ${orderRecord.dateCreated}
                            </tr>
                        </table>
                    </div>
                    <div class="corfimdelive">
                        <div class="heading_bg">
                            <h3><fmt:message key="deliveryAddress" /></h3>
                        </div>
                        <table>
                            <tr>
                                <td colspan="3">
                                    ${customer.name}
                                    <br>
                                    ${customer.address}
                                    <br>
                                    <fmt:message key="city"/> ${customer.cityRegion}
                                    <br>
                                    <hr style="border: 1px solid; color: #fff; width: 80%;">
                                    <strong><fmt:message key="email"/>:</strong> ${customer.email}
                                    <br>
                                    <strong><fmt:message key="phone"/>:</strong> 0${customer.phone}
                                </td>
                            </tr>
                        </table>
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
        </fmt:bundle>    
    </body>
</html>
