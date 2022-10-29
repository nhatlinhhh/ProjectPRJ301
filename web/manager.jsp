<%-- 
    Document   : index
    Created on : Jun 8, 2022, 9:00:06 PM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <script src="js/manager.js" type="text/javascript"></script>

    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <!--        <a class="navbar-brand" href="#!">Start Bootstrap</a>-->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/MyProject/HomeController">Home</a></li>
                            <c:if test="${sessionScope.account.isAdmin == 1}" >
                            <li class="nav-item"><a class="nav-link" href="manage-product">Manage product</a></li>
                            </c:if>
                    </ul>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.account!=null}">
                        <button class="btn btn-outline-primary ms-lg-2"> ${sessionScope.account.displayName}</button>
                        <a href="logout" class="btn btn-outline-primary ms-lg-2">Logout</a>
                    </c:when>
                    <c:otherwise>
                        <a href="login" class="btn btn-outline-primary ms-lg-2">Login</a>
                    </c:otherwise>
                </c:choose>


            </div>
        </nav>
        <!--        Product section-->
        <section class="py-5">
            <div class="container" style="min-height: 400px">
                <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm sản phẩm mới</span></a>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Mã Sản Phẩm</th>
                            <th scope="col">Ảnh</th>
                            <th scope="col">Tên Sản Phẩm</th>                           
                            <th scope="col">Số Lượng Sản Phẩm Trong Kho</th>
                            <th scope="col">Đơn Giá</th>
                            <th scope="col">Mô Tả</th>
                            <th scope="col">Loại Sản Phẩm</th>
                            <th scope="col">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listProducts}" var="p">
                        <form action="">
                            <tr>
                                <td>${p.id}</td>
                                <td><img src="${p.imageUrl}" width="100px" /></td>
                                <td>${p.name}</td>
                                <td>${p.quantity}</td>
                                <td>${p.price}</td>
                                <td>${p.description}</td>
                                <td>${p.categoryId}</td>
                                <td>
                                    <a href="delete-product?ProductId=${p.id}" ><i class="bi bi-trash"></i></a>
                                    <a href="loadProduct?ProductId=${p.id}" ><i class="bi bi-pen"></i></a>
                                </td>

                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <!--        Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm sản phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Mã sản phẩm</label>
                                <input name="id" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Giá</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Số  Lượng Sản Phẩm Trong Kho</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Ngày</label>
                                <input name="createdDate" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Loại Sản Phẩm</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCategories}" var="c">
                                        <option value="${c.categoryId}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="Components/footerComponent.jsp" %>
        Bootstrap core JS
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        Core theme JS
        <script src="js/scripts.js"></script>
    </body>

</html>

