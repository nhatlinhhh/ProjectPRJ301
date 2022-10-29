<%-- 
    Document   : navComponent
    Created on : Jun 22, 2022, 10:14:53 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
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
            <form action="Search" class="d-flex mx-auto">
                <input class="form-control me-2" 
                       type="search" 
                       placeholder="Tìm kiếm tại đây" 
                       aria-label="Search"
                       name="keyword"
                       />
                <!--                        <button class="btn btn-outline-success" type="submit">Tìm Kiếm</button>-->
                <button type="submit" class="btn btn-secondary">
                    <i class="bi bi-search"></i>
                </button>
            </form>
            <div class="d-flex my-2">
                <a class="btn btn-outline-dark" href="carts">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                </a>
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
    </div>
</nav>