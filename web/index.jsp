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
        <!-- Header-->
        <header class="py-5" style="background-color: rgb(255, 210, 113)">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center " style="color: rgb(147, 186, 231)">
                    <h1 class="display-4 fw-bolder">3thang12 Shop</h1>
                    <p class="lead fw-normal text-white-50 mb-0"></p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h3>List Categories</h3>
                        <ul class="list-group">
                            <c:forEach items="${sessionScope.CtgList}" var="c">
                                <li class="list-group-item"><a href="filter-category?categoryId=${c.categoryId}">${c.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>List Products</h3>

                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3  justify-content-center">                    
                            <c:forEach items="${listProducts}" var="p">
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale
                                        </div>
                                        <!-- Product image-->
                                        <a  href="detail?ProductId=${p.id}">
                                            <img class="card-img-top" src="${p.imageUrl}" alt="..." />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${p.name}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through">₫1.000.000</span>
                                                ₫${p.price}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="add-to-cart?ProductId=${p.id}">Thêm vào Giỏ hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <c:choose>
                            <c:when test="${listProducts==null|| listProducts.size()==0}">
                                <div style="text-align: center"><img src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg//assets/a60759ad1dabe909c46a817ecbf71878.png" alt="alt" height="200px"/></div>
                                <div style="text-align: center; color: rgba(0,0,0,.54)">Hãy thử sử dụng các từ khóa chung hơn</div>
                                <div style="text-align: center">Không tìm thấy kết quả nào</div>
                            </c:when>                         
                            <c:otherwise>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination d-flex justify-content-center">
                                        <c:if test="${page>1}">
                                            <li class="page-item"><a class="page-link" href="HomeController?page=${page-1}"><</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${totalPage}" var="i">                                
                                            <li class="page-item ${i==page?"active":""}"><a class="page-link" href="HomeController?page=${i}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${page<totalPage}">
                                            <li class="page-item"><a class="page-link" href="HomeController?page=${page+1}">></a></li>
                                            </c:if>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>

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
