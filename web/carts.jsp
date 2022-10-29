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
        <!-- Product section-->
        <section class="py-5">
            <div class="container" style="min-height: 400px">
                <c:choose>
                    <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}">
                        <h1>Giỏ hàng đang trống</h1>
                    </c:when>
                    <c:otherwise >
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Mã Sản Phẩm</th>
                                    <th scope="col">Ảnh</th>
                                    <th scope="col">Tên Sản Phẩm</th>
                                    <th scope="col">Đơn Giá</th>
                                    <th scope="col">Số Lượng</th>
                                    <th scope="col">Số Tiền</th>
                                    <th scope="col">Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="c">
                                <form action="update-quantity">
                                    <tr>
                                    <input type='hidden' name="ProductId" value="${c.value.product.id}" />
                                    <th scope="row">${c.value.product.id}</th>
                                    <td><img src="${c.value.product.imageUrl}" width="100px" /></td>
                                    <td>${c.value.product.name}</td>
                                    <td>${c.value.product.price}</td>
                                    <td><input onchange="this.form.submit()" name="quantity" type="number" value="${c.value.quantity}"/></td>
                                    <td>${c.value.quantity*c.value.product.price}</td>
                                    <td><a href="delete-cart?ProductId=${c.value.product.id}" class="btn btn-outline-danger"><i class="bi bi-trash"></i> Xóa</a></td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h3>Tổng thanh toán: ₫${totalMoney}</h3>
                        <a href="buy-now" class="btn btn-success w-25">Thanh Toán</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

        <%@include file="Components/footerComponent.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>

</html>
