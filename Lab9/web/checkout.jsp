<c:set var='view' value='/checkout' scope='session' />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out</title>
        <link rel="stylesheet" type="text/css" href="CSS/css/style.css" />
        <link rel="stylesheet" type="text/css" href="CSS/css/animate.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript">
            $(document).ready(function () {
                $("#checkoutForm").validate({
                    rules: {
                        name: "required",
                        email: {
                            required: true,
                            email: true
                        },
                        phone: {
                            required: true,
                            number: true,
                            minlength: 9
                        },
                        address: {
                            required: true
                        },
                        creditcard: {
                            required: true,
                            creditcard: true
                        }
                    }
                });
            });
        </script>
    </head>
    <body>

        <div id="container">
            <div class="one-half">
                <div class="heading_bg">
                    <h2>Checkout</h2>
                </div>
                <p>
                    <strong>In order to purchase the items in your shopping cart, please provide us with the following information:</strong>
                </p>
                <c:if test="${!empty orderFailureFlag}">
                    <p style="color: #c00; font-style: italic">We were unable to process your order. Please try again!</p>
                </c:if>
                <form id="checkoutForm" action="<c:url value='purchase' />" method="post">
                    <fieldset>
                        <label>Name<span class="required">*</span></label>
                        <input type="text" name="name" id="name" value="${param.name}" required/>
                    </fieldset>
                    <fieldset>
                        <label>Email<span class="required">*</span></label>
                        <input type="text" name="email" id="email" value="${param.email}" required/>
                    </fieldset>
                    <fieldset>
                        <label>Phone <span class="required">*</span></label>
                        <input type="text" name="phone" id="phone" value="${param.phone}" required/>
                    </fieldset>
                    <fieldset>
                        <label>Address <span class="required">*</span></label>
                        <input type="text" size="45" name="address" id="address" value="${param.address}"  required/>
                    </fieldset>
                    <fieldset>
                        <label>City <span class="required">*</span></label>
                        <input type="text" size="45" name="cityRegion" id="cityRegion" value="${param.cityRegion}" required />
                    </fieldset>
                    <fieldset>
                        <label>Credit Card Number<span class="required">*</span></label>
                        <input type="text" size="45" name="creditcard" id="creditcard" value="${param.creditcard}" required/>
                    </fieldset>
                    <fieldset>
                        <input value="Submit purchase" class="button white" type="submit">
                    </fieldset>
                </form>
            </div>
            <div class="one-half last">
                <div class="heading_bg">
                    <h2>Order Information</h2>
                </div>
                <p>
                    <strong>Next-working day delivery is guaranteed</strong>
                </p>
                <p>
                    <strong>
                        A ${cart.getStringPrice(initParam.deliveryFee)}₫
                        delivery surcharge is applied to all purchase orders
                    </strong>
                </p>
                <table>
                    <th>Total</th>
                    <th>Delivery Surcharge</th>
                    <th>Credit Total</th>
                    <tr>
                        <td>${cart.getStringPrice(cart.subtotal)}₫</td>
                        <td>${cart.getStringPrice(initParam.deliveryFee)}₫</td>
                        <td>${cart.getStringPrice(cart.total)}₫</td>
                    </tr>
                </table>
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
