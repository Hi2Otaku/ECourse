/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import Models.*;
import DAO.*;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hi2ot
 */ 
public class CourseDetails extends HttpServlet {      

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession ses = request.getSession();
        User u = (User) ses.getAttribute("User");
        
        int detailId = -1;
        
        try {
            detailId = Integer.parseInt(request.getParameter("detailId"));
        } catch (NumberFormatException e) {
            detailId = -1;
        }
        
        if (detailId < 0) {
            response.sendRedirect(request.getContextPath() + "/404.html");
            return;
        }
        
        Models.Course curCourse = CourseDAO.INS.getCourseById(detailId);
        String courseCategory = CourseDAO.INS.getCourseCategory(detailId);
        List<Models.Lesson> LessonList = LessonDAO.INS.loadLessonByCourseID(detailId);
        List<Feedback> courseFeedback = CourseDAO.INS.getCourseFeedback(detailId);
        
        request.setAttribute("curCourse", curCourse);
        request.setAttribute("courseCategory", courseCategory);
        request.setAttribute("LessonList", LessonList);
        request.setAttribute("UserINS", UserDAO.INS);
        request.setAttribute("courseFeedback", courseFeedback);
        
        request.getRequestDispatcher("/Web/CourseDetails.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {        
        
        HttpSession ses = request.getSession();
        User u = (User) ses.getAttribute("User");
        
        int buyId = -1;
        try {
            buyId = Integer.parseInt(request.getParameter("buyId"));
            UserDAO.INS.addUserCart(u.getUserID(), buyId); 
            response.sendRedirect(request.getContextPath() + "/CourseShop");
            return;
        } catch (NumberFormatException e) {
            
        }                                        
                        
        String addReview = request.getParameter("addReview");
        if (addReview != null) {
            String Review = request.getParameter("Review");
            if (Review != null) {
                UserDAO.INS.addFeedback(u.getUserID(), buyId, Review);
            }
        }
        
        doGet(request, response);
    }

}
