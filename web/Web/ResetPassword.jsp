<%-- 
    Document   : ForgetPassword
    Created on : Jul 28, 2024, 4:48:20 AM
    Author     : hi2ot
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Forget Password</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">

        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            th, td{
                padding: 5px
            }
        </style>

    </head>

    <body>

        <!-- Navbar start -->   
        <div class="container-fluid" style="padding-top: 50px">           
            <div class="container">
                <div class="text-center mx-auto mb-5">
                    <a href="Home"><h1 class="text-primary display-6">Ecourse</h1></a>              
                </div>
            </div>
        </div>
        <!-- Navbar End -->                   

        <!-- Fact Start -->
        <div class="container-fluid py-5 row">      
            <div class="col-lg-3"></div>
            <div class="col-lg-6">                
                <form action="ResetPassword" method="post">      
                    <input type="text" name="UserID" value="${UserID}" hidden="true">
                    <div class="form-control bg-white px-4">
                        <div class="col-lg-12 col-md-12 col-xl-12">                            
                            <table style="width: 100%" class="text-center">
                                <tr>
                                    <th>New Password </th>
                                    <td><input type="text" name="password" value="" placeholder="New Password" class="form-control border px-4 rounded-pill" required>  </td>                                    
                                </tr>                                
                                <tr>
                                    <th>Confirm </th>
                                    <td><input type="text" name="confirm" value="" placeholder="Confirm" class="form-control border px-4 rounded-pill" required>  </td>
                                </tr>                           
                            </table>                             
                        </div>                               
                    </div>      
                    <p class="text-center">${err}</p>
                    <input type="submit" name="submit" value="Submit" class="btn btn-primary border-2 border-secondary rounded-pill text-white" style="color: black; margin: 2% 45%">                    
                </form>               
            </div>
        </div>
        <!-- Fact Start -->

        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>

