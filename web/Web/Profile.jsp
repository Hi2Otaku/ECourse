<%-- 
    Document   : CourseShop
    Created on : Jun 27, 2024, 2:25:58 PM
    Author     : hi2ot
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Profile</title>
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
        <script>
        </script>

        <style>
            th, td {
                padding: 10px
            }

            td {
                width: 500px
            }
        </style>

    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->               

        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">ECourse</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <c:if test="${User.getRole() == 1}">
                                <div class="navbar-nav mx-auto">
                                    <a href="CategoryManage" class="nav-item nav-link">Category</a>
                                    <a href="SubjectManage" class="nav-item nav-link">Subject</a>
                                    <a href="CourseManage" class="nav-item nav-link">Course</a>
                                    <a href="UserManage" class="nav-item nav-link">User</a>
                                    <a href="#" class="nav-item nav-link">Chart</a>                            
                                </div>
                            </c:if>
                            <c:if test="${User.getRole() == 4}">
                                <div class="navbar-nav mx-auto">
                                    <a href="CourseShop" class="nav-item nav-link">Shop</a>
                                    <a href="MyCourse" class="nav-item nav-link">My Courses</a>                                                            
                                    <a href="Cart" class="nav-item nav-link">Cart</a>                             
                                </div>
                            </c:if>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <a href="Profile" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Profile</h1>
        </div>                
        <!-- Single Page Header End -->     

        <div class="container-fluid py-5 row">
            <div class="col-lg-1">                
            </div>

            <div class="col-lg-3 align-items-center">
                <div class="counter bg-white rounded p-5">      
                    <img src="img/avt.jpg" alt="alt" class="img-fluid w-100 rounded-top"/>                    
                    <div style="margin-top: 20%">
                        <h4>${User.getFullName()}</h4>
                        <c:if test="${User.getRole() == 4}">
                            <p>Number of Courses: ${CourseList.size()}</p>                        
                        </c:if>
                    </div>
                    <table>
                        <tr>                                
                            <td><a href="ChangePassword">Change Password</a> </td>
                        </tr>

                        <tr>
                            <td><a href="Logout" class="btn btn-primary border-2 border-secondary text-white">Logout</a></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="col-lg-7 align-items-center">
                <div class="counter bg-white rounded p-5">
                    <form action="Profile" method="post">
                        <table>
                            <tr>
                                <th>Username: </th>
                                <td><input type="text" name="UserName" value="${User.getUserName()}" class="form-control border-2 px-4" disabled></td>
                            </tr>
                            <tr>
                                <th>Fullname: </th>
                                <td><input type="text" name="FullName" value="${User.getFullName()}" class="form-control border-2 px-4" required></td>
                            </tr>                    
                            <tr>
                                <th>Mail: </th>
                                <td><input type="email" name="Mail" value="${User.getMail()}" class="form-control border-2 px-4" disabled></td>
                            </tr>
                            <tr>
                                <th>Gender: </th>
                                <td>
                                    <input type="radio" name="Gender" value="0"
                                           <c:if test="${User.getGender() == 0}">checked</c:if> > Male &nbsp;
                                           <input type="radio" name="Gender" value="1"
                                           <c:if test="${User.getGender() == 1}">checked</c:if> > Female &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <th>Date of Birth: </th>
                                    <td><input type="date" name="dob" value="${User.getDoB()}" id="dob" class="form-control border-2 px-4" max="${maxDate}" required></td>
                            </tr>
                            <tr>
                                <th>Security Question: </th>
                                <td><select name="SQ" class="form-control border-2 px-4 bg-white">
                                        <c:forEach items="${SEQuestionList}" var="x">
                                            <option value="${x.getSecutiryQuestionID()}"
                                                    <c:if test="${x.getSecutiryQuestionID() == User.getSecurityQuestionID()}">
                                                        selected
                                                    </c:if>>${x.getQuestion()}</option>
                                        </c:forEach>
                                    </select></td>
                            </tr>
                            <tr>
                                <th>Answer: </th>
                                <td><input type="text" name="Answer" value="${User.getAnswer()}" class="form-control border-2 px-4" required></td>
                            </tr>
                            <tr>
                                <th>Role: </th>
                                <td><c:if test="${User.getRole() == 1}">
                                        <input type="text" name="Role" value="Admin" class="form-control border-2 px-4" disabled>
                                    </c:if>
                                    <c:if test="${User.getRole() == 2}">
                                        <input type="text" name="Role" value="Expert" class="form-control border-2 px-4" disabled>
                                    </c:if>
                                    <c:if test="${User.getRole() == 4}">
                                        <input type="text" name="Role" value="Learner" class="form-control border-2 px-4" disabled>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                        <input type="submit" name="update" value="Update Profile" class="btn btn-primary border-2 border-secondary px-3 rounded-pill text-white" style="margin-top: 20px">
                        <p>${inform}</p>
                    </form>
                </div>
            </div>

            <div class="col-lg-1"></div>
        </div>

        <!-- Copyright Start -->
        <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>           

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
