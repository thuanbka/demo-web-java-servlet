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
        <script>
            window.addEventListener("load", function () {
                var i = document.getElementById("price");
                i.addEventListener("keyup", function () {
                    if (i.value < 10 && i.value > 0) {
                        i.value *= 1000;
                    }
                    var n = this.value.replace(/\D/g, '');

                    n = parseInt(n);
                    if (n < 10 && n > 0) {
                        n *= 1000;
                    }
                    if (n > 70000000)
                        n = Math.floor(n / 10000) * 1000;
                    i.value = n.toLocaleString("it-IT");
                    if (i.value.length >= 5) {
                        i.focus();
                        i.selectionEnd = i.value.length - 4;
                    }
                })
            })
        </script>
    </head>

    <body>
        <div style="background-color:#f1f1f1; height:auto">
            <div class="row">
                <br>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="col-xs-3"></div>
                    <div class="col-xs-6" style="background-color:white;">
                        <div class="container " id="addproduct">

                            <form method="POST" id="formSignUp" enctype="multipart/form-data" action="./addproduct">
                                <h1 style="color: #ff789e;margin-left: 30%">Đăng sản phẩm</h1>
                                <spana class="lalbel"> Tên sản phẩm:</spana>
                                <input type="text" name="name" placeholder="Tên sản phẩm(yêu cầu)" size="35px"
                                       maxlength="90" id="short_detail" required><br>
                                <spana class="lalbel"> Mô tả ngắn gọn:</spana>
                                <input type="text" name="describe_short" placeholder="Miêu tả ngắn(yêu cầu)" size="35px"
                                       maxlength="90" id="name" required><br>
                                <spana class="lalbel">Mô tả về sản phẩm:</spana>
                                <textarea name="described" id="described" required
                                          placeholder="Mô tả về sản phẩm(yêu cầu)"></textarea><br>
                                <br>
                                <div id="gia">
                                    <spana class="lalbel"> Giá bán (VNĐ):</spana>
                                    <input type="text" name="price" placeholder=" Giá bán sản phẩm" id="price" required
                                           onkeyup="myFn()"><br>
                                </div>
                                <spana class="lalbel"> Phụ kiện:</spana>
                                <input type="text" name="accessories"  id="img" required><br>
                                <spana class="lalbel"> Bảo hành:</spana>
                                <input type="text" name="guaranty"  id="img" required><br>
                                <spana class="lalbel"> Image 1:</spana><input type="file" name="image1" class="imageproduct" required/><br>
                                <spana class="lalbel"> Image 2:</spana><input type="file" name="image2" class="imageproduct"/><br>
                                <spana class="lalbel"> Image 3:</spana><input type="file" name="image3" class="imageproduct"/><br>
                                <spana class="lalbel"> Image 4:</spana><input type="file" name="image4" class="imageproduct"/><br>
                                <spana class="lalbel"> Image 5:</spana><input type="file" name="image5" class="imageproduct"/><br>
                                <spana class="lalbel">Loại sản phẩm:</spana>
                                <select name="category" required id="categories" required>
                                    <c:forEach var="category" items="${newCategorys}">
                                        <option value="${category.getCategoryId()}">${category.getName()}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <button type="reset"
                                        style="background-color: #ff789e;color: gold; margin-left:200px; margin-top: 20px; margin-bottom: 30px;">RESET</button>
                                <button type="submit" style="background-color: #ff789e;color: gold;  ">Đăng sản phẩm
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <br>
        </div>
        <hr>
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