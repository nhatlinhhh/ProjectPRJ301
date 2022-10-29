<%-- 
    Document   : index
    Created on : Jun 8, 2022, 9:00:06 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>

    <body>
        <%@include file="Components/navComponent.jsp" %>
        <div class="jumbotron text-center" style="min-height: 500px">
            <h1 class="display-3">Cảm ơn!</h1>
            <p class="lead"><strong>Bạn đã đặt hàng thành công.</strong> Tiếp tục mua sắm và chúc bạn một ngày thật vui vẻ nhé.</p>
            <hr>
            <p class="lead">
                <a class="btn btn-primary btn-sm" href="HomeController" role="button">Về Trang chủ</a>
            </p>
        </div>
        <%@include file="Components/footerComponent.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>

</html>
