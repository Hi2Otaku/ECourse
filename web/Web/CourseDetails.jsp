<%-- 
    Document   : CourseDetail
    Created on : Jun 28, 2024, 6:52:35 AM
    Author     : hi2ot
--%>

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
        <title>Course Details</title>
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
            function submitShop() {
                document.getElementById("shop").submit();
            }
            function addCart(courseID) {
                document.getElementById("buyId").value = courseID;
                submitShop();
            }
            function addReview() {
                document.getElementById("addR").value = 1;
                window.alert(document.getElementById("rvId").value);
                document.getElementById("rv").submit();
            }
        </script>
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
                            <a href="CourseShop" class="nav-item nav-link active">Shop</a>
                            <a href="MyCourse" class="nav-item nav-link">My Courses</a>                                                            
                            <a href="Cart" class="nav-item nav-link">Cart</a>   
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
            <h1 class="text-center text-white display-6">Courses Details</h1>
        </div>
        <!-- Single Page Header End -->


        <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8 col-xl-9">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="border rounded">
                                    <a href="#">
                                        <img src="img/lesson.jpg" class="img-fluid rounded" alt="Image">
                                    </a>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <form action="CourseDetails" method="post" id="shop">
                                    <input type="text" name="buyId" value id="buyId" hidden>
                                    <input type="text" name="detailId" value="${curCourse.getCourseID()}" hidden>
                                    <h4 class="fw-bold mb-3">${curCourse.getCourseName()}</h4>
                                    <p class="mb-3">Category: ${courseCategory} </p>
                                    <h5 class="fw-bold mb-3">${curCourse.getPrice()} $</h5> 
                                    <p class="mb-4">${curCourse.getDescription()}</p>                   
                                    <c:if test="${UserINS.checkIfCourseinCart(User.getUserID(), curCourse.getCourseID()) == 0}">
                                        <c:if test="${UserINS.checkOwnCourse(User.getUserID(), curCourse.getCourseID()) == 0}">
                                            <button class="btn border border-secondary rounded-pill px-3 text-primary" onclick="addCart(${curCourse.getCourseID()})"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</button>
                                        </c:if>
                                    </c:if> 
                                    <c:if test="${UserINS.checkIfCourseinCart(User.getUserID(), curCourse.getCourseID()) == 1}">
                                        <br/>
                                        <br/>
                                        <h4>Course Has Already Added In Your Cart!</h4>
                                    </c:if> 
                                    <c:if test="${UserINS.checkOwnCourse(User.getUserID(), curCourse.getCourseID()) == 1}">
                                        <br/>
                                        <br/>
                                        <h4>You Have Already Bought This Course!</h4>
                                    </c:if> 
                                </form>
                            </div>

                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                                id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                                aria-controls="nav-about" aria-selected="true">Description</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                                id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                                aria-controls="nav-mission" aria-selected="false">Reviews</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p>This Course Include: </p>
                                        <c:forEach items="${LessonList}" var="x">
                                            <p>Lesson ${x.getLessonID()}: ${x.getLessonName()}</p>
                                        </c:forEach>                                        
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                        <c:forEach items="${courseFeedback}" var="x">
                                            <div class="d-flex">
                                                <img src="img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">

                                                <div class="">
                                                    <p class="mb-2" style="font-size: 14px;">${x.getCreateDate()}</p>
                                                    <div class="d-flex justify-content-between">
                                                        <h5>${UserINS.getNameById(x.getUserID())}</h5>
                                                    </div>
                                                    <p>${x.getDescription()} </p>
                                                </div>

                                            </div>
                                        </c:forEach>                                        
                                    </div>                                  
                                </div>
                            </div>
                            <form action="CourseDetails" method="post" id="rv">
                                <input type="text" name="addR" id="addR" value hidden>
                                <input type="text" name="detailId" value="${curCourse.getCourseID()}" id="detailId" hidden>
                                <h4 class="mb-5 fw-bold">Leave a Reply</h4>
                                <div class="row g-4">                                                                        
                                    <div class="col-lg-12">
                                        <div class="border-bottom rounded my-4">
                                            <input type="text" name="Review" id="Review" class="form-control border-0" placeholder="Your Review *" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="d-flex justify-content-between py-3 mb-5">                                            
                                            <button class="btn border border-secondary rounded-pill px-3 text-primary" onclick="addReview()"> Post Comment</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-3">
                        <div class="row g-4 fruite">
                            <div class="col-lg-12">
                                <div class="input-group w-100 mx-auto d-flex mb-4">
                                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                                <div class="mb-4">
                                    <h4>Categories</h4>
                                    <c:forEach items="${CategoryList}" var="x">                                            
                                        <div class="d-flex justify-content-between fruite-name">
                                            <a href="CourseShop?Category${x.getCategoryID()}=1">${x.getCategoryName()} </a>                                                
                                            <span>(${CourseINS.loadCategoryPNumber(x.getCategoryID())})</span>
                                        </div>                                                                                                                                                                     
                                    </c:forEach>  
                                    <br/>
                                    <h4>Subjects</h4>
                                    <c:forEach items="${SubjectList}" var="x">
                                        <div class="d-flex justify-content-between fruite-name">
                                            <a href="CourseShop?Subject${x.getSubjectID()}=1">${x.getSubjectName()} </a>                                                                                            
                                        </div> 
                                    </c:forEach>                                     
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <h4 class="mb-4">Recent views</h4>
<!--                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded" style="width: 100px; height: 100px;">
                                        <img src="img/featur-1.jpg" class="img-fluid rounded" alt="Image">
                                    </div>
                                    <div>
                                        <h6 class="mb-2">Big Banana</h6>
                                        <div class="d-flex mb-2">
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="d-flex mb-2">
                                            <h5 class="fw-bold me-2">2.99 $</h5>
                                            <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                        </div>
                                    </div>
                                </div>                                                               -->
                            </div>                            
                        </div>
                    </div>
                </div>
                <h1 class="fw-bold mb-0">Related products</h1>
                <div class="vesitable">                    
                    <div class="owl-carousel vegetable-carousel justify-content-center">         
                        <c:forEach items="${relatedCourse}" var="x">
                            <c:if test="${x.getCourseID() != curCourse.getCourseID()}">
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/lesson.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">You May Like!</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>${x.getCourseName()}</h4>
                                        <p>${x.getDescription()}</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$ ${x.getPrice()}</p>                                        
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>                        
                    </div>
                </div>
            </div>
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

