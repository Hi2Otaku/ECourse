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
                            <a href="SubjectManage" class="nav-item nav-link">Subject</a>
                            <a href="CourseManage" class="nav-item nav-link active">Course</a>
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
            <h1 class="text-center text-white display-6">Courses Manage</h1>
        </div>                
        <!-- Single Page Header End -->     



        <div class="container-fluid">
            <div class="col-lg-12 align-items-center">
                <div class="counter bg-white rounded p-5">              
                    <h3 style="color: grey">Feature</h3>
                    <a href="CategoryManage"><button class="btn rounded-pill border border-secondary" style="margin: 10px 50px">Categories Manage</button></a>
                    <a href="SubjectManage"><button class="btn rounded-pill border border-secondary" style="margin: 10px 50px">Subjects Manage</button></a>
                    <a href="CourseManage"><button class="btn btn-primary text-white rounded-pill border border-secondary" style="margin: 10px 50px">Courses Manage</button></a>
                    <a href="UserManage"><button class="btn rounded-pill border border-secondary" style="margin: 10px 50px">Users Manage</button></a>
                </div>
            </div>
        </div>        
        <form action="CourseManage" id="manage">
            <div class="container-fluid py-2 row">            

                <div class="col-lg-3 align-items-center">
                    <div class="counter bg-white rounded p-5">              

                        <h3 style="color: grey">Filter</h3>

                        <div class="col-lg-12">
                            <input type="search" name="search" value="${search}" placeholder="Course Name" style="width: 250px; margin: 20px 0px" class="form-control">
                        </div>

                        <div class="navbar-nav mx-auto">
                            <div class="nav-item dropdown">
                                <p class="nav-link dropdown-toggle text-md-start" data-bs-toggle="dropdown" style="color: grey; font-size: 20px">Categories</p> 
                                <div class="dropdown-menu m-0 rounded-0" style="width: 250px">
                                    <c:forEach items="${CategoryList}" var="x">    
                                        <div class="mb-2" style="margin-left: 10px">
                                            <input type="checkbox" class="me-2" id="category" name="Category${x.getCategoryID()}" value="${x.getCategoryID()}" 
                                                   <c:if test="${catNum.contains(x.getCategoryID()) == true}"> checked </c:if> >
                                            <label for="category">${x.getCategoryName()}</label>
                                        </div>                                                                                                
                                    </c:forEach>      
                                </div>
                            </div>
                        </div>    

                        <div class="navbar-nav mx-auto">
                            <div class="nav-item dropdown">
                                <p class="nav-link dropdown-toggle text-md-start" data-bs-toggle="dropdown" style="color: grey; font-size: 20px">Subjects</p>                                                         
                                <div class="dropdown-menu m-0 rounded-0" style="width: 250px">
                                    <c:forEach items="${SubjectList}" var="x">
                                        <div class="mb-2" style="margin-left: 10px">
                                            <input type="checkbox" class="me-2" id="Subject-1" name="Subject${x.getSubjectID()}" value="${x.getSubjectID()}"
                                                   <c:if test="${sujNum.contains(x.getSubjectID()) == true}"> checked </c:if>> 
                                            <label for="Subject-1"> ${x.getSubjectName()}</label>
                                        </div>
                                    </c:forEach>        
                                </div>
                            </div>
                        </div>
                        <button name="apply" class="btn border-secondary border-2 rounded-pill" onclick="submit()">Apply Filter</button>
                    </div>
                </div>

                <div class="col-lg-9 align-items-center">
                    <div class="counter bg-white rounded p-5">                    
                        <table style="width: 100%">
                            <thead>
                            <th>ID</th>
                            <th>Course Name</th>
                            <th>Subjects</th>
                            <th>Categories</th>
                            <th>Create Date</th>
                            <th>Price</th>                                                
                            <th>Edit</th>
                            <th>Edit Content</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${CourseList}" var="x" begin="${paging.getBegin()}" end="${paging.getEnd() - 1}">
                                    <tr>
                                        <td> ${x.getCourseID()} </td>
                                        <td> ${x.getCourseName()} </td>
                                        <td> 
                                            <div class="navbar-collapse">
                                                <div class="nav-item dropdown">
                                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Subjects</a>
                                                    <div class="dropdown-menu m-0 rounded-0">
                                                        <c:forEach items="${CourseINS.getSubjectByCourse(x.getCourseID())}" var="y">
                                                            <p style="margin: 0px -2px" class="dropdown-item">${y.getSubjectName()}</p>   
                                                        </c:forEach>                                                    
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td> 
                                            <div class="nav-item dropdown">
                                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Categories</a>
                                                <div class="dropdown-menu m-0 rounded-0">
                                                    <c:forEach items="${CourseINS.getCategoryByCourse(x.getCourseID())}" var="y">
                                                        <p style="margin: 0px -2px" class="dropdown-item">${y.getCategoryName()}</p>   
                                                    </c:forEach>   
                                                </div>
                                            </div>
                                        </td>
                                        <td>${x.getCreateDate()}</td>
                                        <td> ${x.getPrice()}$</td>                                                                        
                                        <td> <a href="EditCourse?CourseID=${x.getCourseID()}">Edit</a> </td>
                                        <td> <a href="EditContent?CourseID=${x.getCourseID()}">Edit Content</a> </td>
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
                        <a href="CreateCourse" class="btn btn-primary text-white border border-secondary" style="margin: 20px">+ New Course</a>
                    </div>
                </div>

            </div>
        </form>

        <!-- Footer Start -->
        
        <!-- Footer End -->

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
