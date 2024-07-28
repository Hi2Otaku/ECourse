    <%-- 
    Document   : Review
    Created on : May 30, 2024, 11:11:19 AM
    Author     : hi2ot
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Review</title>
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
                            <a href="CourseShop" class="nav-item nav-link">Shop</a>
                            <a href="MyCourse" class="nav-item nav-link active">My Courses</a>                                                            
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
            <h1 class="text-center text-white display-6">Review</h1>  
        </div>
        <!-- Single Page Header End -->


        <!-- Single Product Start -->
        <form action="Review" method="post">  
            <input type="text" name="CourseID" value="${CourseID}" hidden>
            <input type="text" name="LessonID" value="${LessonID}" hidden>
            <input type="text" name="QuizID" value="${QuizID}" hidden>
            <input type="text" name="AttemptID" value="${AttemptID}" hidden>
            <input type="text" name="index" value="${index}" hidden>
            <div class="container-fluid py-5 mt-5">
                <div class="container py-5">
                    <div class="row g-4 mb-5">
                        <div class="col-lg-8 col-xl-9">
                            <div class="row g-4">                            
                                <div class="col-lg-12">
                                    <c:forEach items="${QuestionList}" var="Question">
                                        <h4 class="fw-bold mb-3">Question ${QuestionList.indexOf(Question) + 1}</h4>
                                        <p class="mb-3">${Question.getQuestion()}</p>                                        
                                        <table>
                                            <c:set var="UserAnswer" value="${QuestionINS.loadUserQuestionAnswer(CourseID, LessonID, QuizID, Question.getQuestionID(), User.getUserID(), AttemptID)}"></c:set>                                                                                    
                                            <c:set var="CorrectAnswer" value="${QuestionINS.loadQuestionCorrectAnswer(User.getUserID(), AttemptID, CourseID, LessonID, QuizID, Question.getQuestionID())}"></c:set>

                                            <c:forEach items="${QuestionINS.loadQuestionAnswer(CourseID, LessonID, QuizID, Question.getQuestionID())}" var="x">                                                   
                                                <c:if test="${x.getAnswerID() == UserAnswer.getAnswerID()}">                                                    
                                                    <input type="radio" name="Answer${Question.getQuestionID()}" value="${x.getAnswerID()}" checked disabled> ${x.getDescription()}   

                                                    <c:if test="${x.getAnswerID() != CorrectAnswer.getAnswerID()}">
                                                        Wrong!
                                                    </c:if>

                                                </c:if>            

                                                <c:if test="${x.getAnswerID() != UserAnswer.getAnswerID()}">
                                                    <input type="radio" name="Answer${Question.getQuestionID()}" value="${x.getAnswerID()}" disabled> ${x.getDescription()}  
                                                </c:if>       

                                                <c:if test="${x.getAnswerID() == CorrectAnswer.getAnswerID()}">
                                                    Correct!
                                                </c:if>

                                                <br/>
                                            </c:forEach>                                                                                                              
                                        </table>           
                                        <hr/>
                                    </c:forEach>   
                                </div>                                                
                            </div>
                        </div>
                        <div class="col-lg-4 col-xl-3">                            
                            <div class="col-lg-12">                               
                                <div class="mt-5 pagination">
                                    <h4>Quiz Navigation</h4>
                                    <c:forEach items="${QuestionList}" var="Question">
                                        <c:set var="UserAnswer" value="${QuestionINS.loadUserQuestionAnswer(CourseID, LessonID, QuizID, Question.getQuestionID(), User.getUserID(), AttemptID)}"></c:set>                                                                                    
                                        <c:set var="CorrectAnswer" value="${QuestionINS.loadQuestionCorrectAnswer(User.getUserID(), AttemptID, CourseID, LessonID, QuizID, Question.getQuestionID())}"></c:set>
                                        <c:if test="${CorrectAnswer.getAnswerID() == UserAnswer.getAnswerID()}">       
                                            <input type="submit" class="btn btn-primary border border-secondary rounded-pill px-3" name="Btn${QuestionList.indexOf(Question)}" value="${QuestionList.indexOf(Question) + 1}">
                                        </c:if>
                                        <c:if test="${CorrectAnswer.getAnswerID() != UserAnswer.getAnswerID()}">       
                                            <input type="submit" class="btn btn-secondary border border-secondary rounded-pill px-3" name="Btn${QuestionList.indexOf(Question)}" value="${QuestionList.indexOf(Question) + 1}">
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>                                                        
                        </div>
                    </div>                
                </div>
            </div>
        </form>   
        <!-- Single Product End -->      

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

