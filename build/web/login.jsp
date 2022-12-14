<%-- 
    Document   : index
    Created on : Jun 8, 2022, 9:00:06 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/style.css">

        <title>Login</title>
    </head>
    <body>


        <div class="d-md-flex half">
            <div class="bg" style="background-image: url('images/bg_1.jpg');"></div>
            <div class="contents">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-12">
                            <div class="form-block mx-auto">
                                <div class="text-center mb-5">
                                    <h3>Login</h3>
                                    <!-- <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p> -->
                                </div>
                                <form action="login" method="POST">
                                    <div class="form-group first">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" placeholder="Your username" id="username" name="username">
                                    </div>
                                    <div class="form-group last mb-3">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" placeholder="Your Password" id="password" name="password">
                                    </div>

                                    <div class="d-sm-flex mb-5 align-items-center">
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="remember">
                                            <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                        </div>
                                        <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                                    </div>
                                    <p><strong class="text-danger"> ${error}</strong></p>
                                    <input type="submit" value="Log In" class="btn btn-block btn-primary">

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>



        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>