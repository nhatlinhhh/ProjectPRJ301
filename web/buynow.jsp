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
                <h1>Thanh Toán</h1>
                <div class="row">
                    <div class="col-md-8" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>Sản Phẩm</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Mã Sản Phẩm</th>
                                    <th scope="col">Ảnh</th>
                                    <th scope="col">Tên Sản Phẩm</th>
                                    <th scope="col">Đơn Giá</th>
                                    <th scope="col">Số Lượng</th>
                                    <th scope="col">Số Tiền</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="c">                      
                                    <tr>
                                <input type='hidden' name="ProductId" value="${c.value.product.id}" />
                                <th scope="row">${c.value.product.id}</th>
                                <td><img src="${c.value.product.imageUrl}" width="100px" /></td>
                                <td>${c.value.product.name}</td>
                                <td>${c.value.product.price}</td>
                                <td>${c.value.quantity}</td>
                                <td>${c.value.quantity*c.value.product.price}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h3>Tổng thanh toán: ₫${totalMoney}</h3>
                    </div>
                    <div class="col-md-4" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>Thông tin Khách hàng</h3>
                        <form action="buy-now" method="POST">
                            <div class="mb-3">
                                <label for="name" class="form-label">Họ Và Tên</label>
                                <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp">
                            </div>

                            <div class="mb-3">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp">
                            </div>
                            
                            <div class="mb-3">
                                <label for="address" class="form-label">Địa chỉ</label>
                                <input type="text" class="form-control" id="address" name="address" aria-describedby="emailHelp">
                            </div>
                            
                            <div class="mb-3">
                                <label for="note" class="form-label">Lưu ý cho người bán</label>
                                <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </form>
                    </div>

                </div>

            </div>
        </section>

        <%@include file="Components/footerComponent.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>

</html>
