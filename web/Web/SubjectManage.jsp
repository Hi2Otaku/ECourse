<%-- 
    Document   : SubjectManage
    Created on : Jul 14, 2024, 5:30:09 PM
    Author     : hi2ot
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Course Manage</title>
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
            function submit() {
                document.getElementById("manage").submit();
            }
            function movePage(x) {
                document.getElementById("btn").value = x;
                submit();
            }
        </script>

        <style>
            th, td {
                padding: 10px
            }

            th {

            }

            td {
                width: 500px
            }

            tr {
                border-bottom: 1px solid orange;
                border-collapse: collapse;

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
                            <a href="CategoryManage" class="nav-item nav-link">Category</a>
                            <a href="SubjectManage" class="nav-item nav-link active">Subject</a>
                            <a href="CourseManage" class="nav-item nav-link">Course</a>
                            <a href="UserManage" class="nav-item nav-link">User</a>
                            <a href="#" class="nav-item nav-link">Chart</a>                               
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
            <h1 class="text-center text-white display-6">Subject Manage</h1>
        </div>                
        <!-- Single Page Header End -->     



        <div class="container-fluid">
            <div class="col-lg-12 align-items-center">
                <div class="counter bg-white rounded p-5">              
                    <h3 style="color: grey">Feature</h3>
                    <a href="CategoryManage"><button class="btn rounded-pill border border-secondary" style="margin: 10px 50px">Categories Manage</button></a>
                    <a href="SubjectManage"><button class="btn btn-primary text-white rounded-pill border border-secondary" style="margin: 10px 50px">Subjects Manage</button></a>
                    <a href="CourseManage"><button class="btn rounded-pill border border-secondary" style="margin: 10px 50px">Courses Manage</button></a>
                    <a href="UserManage"><button class="btn rounded-pill border border-secondary" style="margin: 10px 50px">Users Manage</button></a>
                </div>
            </div>
        </div>        
        <form action="SubjectManage" id="manage">
            <div class="container-fluid py-2 row">            

                <div class="col-lg-4 align-items-center">
                    <div class="counter bg-white rounded p-5">              
                        <h3 style="color: grey">Details</h3>
                        <table>
                            <tr>
                                <th>ID:</th>
                                <td><input type="text" name="id" value="${id}" class="form-control border-2 px-4" readonly="true"></td>
                            </tr>
                            <tr>
                                <th>Subject Name: </th>
                                <td><input type="text" name="name" value="${name}" class="form-control border-2 px-4"></td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td><input type="radio" name="status" value="1"
                                           <c:if test="${status == 1}">checked</c:if> > Active &nbsp;
                                    <input type="radio" name="status" value="0"
                                           <c:if test="${status == 0}">checked</c:if> > Inactive &nbsp;</td>
                            </tr>
                        </table>
                        <input type="submit" name="update" value="Update" class="btn border-2 border-secondary" style="margin: 20px 0px">
                        <br/>${err}
                    </div>
                </div>

                <div class="col-lg-8 align-items-center">
                    <div class="counter bg-white rounded p-5">           
                        <table style="width: 100%">
                            <thead>
                            <th>ID</th>
                            <th>Subject Name</th>
                            <th>Number of Courses</th>
                            <th>Edit</th>
                            <th>Status</th>                           
                            </thead>
                            <tbody>
                                <c:forEach items="${SubjectList}" var="x" begin="${paging.getBegin()}" end="${paging.getEnd() - 1}">
                                    <tr>
                                        <td>${x.getSubjectID()}</td>
                                        <td>${x.getSubjectName()}</td>
                                        <td>${CourseINS.getSubjectNum(x.getSubjectID())}</td>
                                        <td><a href="SubjectManage?Edit=${x.getSubjectID()}">Edit</a> </td>
                                        <td>
                                            <c:if test="${x.getStatus() == 1}">Active</c:if>
                                            <c:if test="${x.getStatus() == 0}">Inactive</c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="col-12">
                            <div class="d-flex justify-content-center mt-5">
                                <input type="text" name="index" value="${paging.getIndex()}" hidden>
                                <input type="text" name="total" value="${paging.getTotalPage()}" hidden>
                                <input type="text" name="btn" id="btn" value hidden>
                                <input type="submit" class="btn border-2 border-secondary rounded" style="margin: 0px 5px" name="btnHome" value=&Ll;>                                                
                                <input type="submit" class="btn border-2 border-secondary rounded" style="margin: 0px 5px" name="btnPre" value=&laquo;>
                                <c:forEach var="x" begin="${paging.getPageStart()}" end="${paging.getPageEnd()}">
                                    <c:if test="${paging.getIndex() == x}">
                                        <button class="btn border-2 border-secondary rounded" style="margin: 0px 5px;background: greenyellow" onclick="movePage(${x})">${x + 1}</button>
                                    </c:if>
                                    <c:if test="${paging.getIndex() != x}">
                                        <button class="btn border-2 border-secondary rounded" style="margin: 0px 5px" onclick="movePage(${x})">${x + 1}</button>
                                    </c:if>
                                </c:forEach>
                                <input type="submit" class="btn border-2 border-secondary rounded" style="margin: 0px 5px" name="btnNext" value=&raquo;>
                                <input type="submit" class="btn border-2 border-secondary rounded" style="margin: 0px 5px" name="btnEnd" value=&Gg;>
                            </div>
                        </div>                        
                    </div>
                </div>

            </div>
        </form>

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

