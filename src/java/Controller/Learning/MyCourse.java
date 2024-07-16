/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Learning;

import DAO.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;

/**
 *
 * @author hi2ot
 */
public class MyCourse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        User u = (User) ses.getAttribute("User");

        List<Course> CourseList = new ArrayList<>();

        int status = 0;
        try {
            status = Integer.parseInt(request.getParameter("status"));
        } catch (NumberFormatException e) {
            status = 0;
        }

        if (status == 0) {
            for (Course x : UserDAO.INS.loadUserOwnCourse(u.getUserID())) {
                if (UserDAO.INS.getCourseProgress(u.getUserID(), x.getCourseID()) < 100) {
                    CourseList.add(x);
                }
            }
        } else {
            for (Course x : UserDAO.INS.loadUserOwnCourse(u.getUserID())) {
                if (UserDAO.INS.getCourseProgress(u.getUserID(), x.getCourseID()) == 100) {
                    CourseList.add(x);
                }
            }
        }
        
        int index = -1;
        int total = -1;
        try {
            index = Integer.parseInt(request.getParameter("index"));
            total = Integer.parseInt(request.getParameter("total"));
        } catch (NumberFormatException e) {
            index = 0;
            total = 0;
        }
        String btn = request.getParameter("btn");
        if (btn != null) {
            try {
                int btnNum = Integer.parseInt(btn);
                index = btnNum;
            } catch (NumberFormatException e) {
                index = 0;
            }            
        }
        
        String btnHome = request.getParameter("btnHome");
        String btnPre = request.getParameter("btnPre");
        String btnNext = request.getParameter("btnNext");
        String btnEnd = request.getParameter("btnEnd");
        
        if (btnHome != null) {
            index = 0;            
        } 

        if (btnPre != null) {
            index--;
        }
        
        if (btnNext != null) {
            index++;
        }
        
        if (btnEnd != null) {
            index = total - 1;
        }

        Paging paging = new Paging((CourseList.isEmpty()) ? 1 : CourseList.size(), 6, index);
        paging.calc();

        request.setAttribute("paging", paging);
        request.setAttribute("status", status);
        request.setAttribute("UserINS", UserDAO.INS);
        request.setAttribute("CourseList", CourseList);
        request.getRequestDispatcher("/Web/MyCourse.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
