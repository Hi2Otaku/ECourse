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
import jakarta.servlet.http.HttpSession;
import Models.*;
import DAO.*;
import java.util.*;

/**
 *
 * @author hi2ot
 */
public class Cart extends HttpServlet {    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession ses = request.getSession();
        User u = (User) ses.getAttribute("User");
        if (u.getRole() == 4) {
            List<Models.Course> CourseList = UserDAO.INS.loadUserCart(u.getUserID());
            float total = 0;
            for (Models.Course x : CourseList) {
                total += x.getPrice();
            }
            request.setAttribute("CourseList", CourseList);
            request.setAttribute("total", total);
            request.getRequestDispatcher("/Web/Cart.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Home");
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession ses = request.getSession();
        User u = (User) ses.getAttribute("User");
        int CourseID = Integer.parseInt(request.getParameter("CourseID"));
        UserDAO.INS.deleteCartCourse(u.getUserID(), CourseID);
        doGet(request, response);
    }
    
}