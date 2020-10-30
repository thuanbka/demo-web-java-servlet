<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" type="text/css" href="CSS/css/style.css" />
        <link rel="stylesheet" type="text/css" href="CSS/css/animate.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <div align="center" class="list">
            <table border="1" cellpadding="5" cellspacing="5">
                <caption style="caption-side: top; color:#000; text-align: center;"><h2>${title}</h2></caption>
                <tr>
                    <th>Customer ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>City</th>
                    <th></th>
                </tr>
                <c:forEach var="p" items="${customers}">
                    <tr>
                        <td><c:out value="${p.getCustomerId()}" /></td>
                        <td><c:out value="${p.getName()}" /></td>
                        <td><c:out value="${p.getEmail()}" /></td>
                        <td><c:out value="${p.getAddress()}" /></td>
                        <td><c:out value="${p.getPhone()}" /></td>
                        <td><c:out value="${p.getCityRegion()}" /></td>
                        <td>
                            <a href="./deletecustomer?idc=${p.getCustomerId()}">Delete</a>                             
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <c:if test="${flag!=0}">
                <table border="1" cellpadding="5" cellspacing="5">
                    <tr>
                        <c:if test="${curentPage!=1}">
                            <td><a href="./detailcustomer?page=${curentPage-1}">Previous</a></td>
                        </c:if>

                        <c:forEach begin="1" end="${noOfPage}" var="i">
                            <c:choose>
                                <c:when test="${curentPage eq i}">
                                    <td>${i}</td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="./detailcustomer?page=${i}">${i}</a></td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${curentPage < noOfPage}">
                            <td><a href="./detailcustomer?page=${curentPage+1}">Next</a></td>
                        </c:if>
                    </tr>
                </table>
            </c:if>
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