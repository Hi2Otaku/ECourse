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

/**
 *
 * @author hi2ot
 */
public class UpdateCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        User u = (User) ses.getAttribute("User");
        if (u.getRole() == 1) {            
            request.getRequestDispatcher("/Web/UpdateCategory.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/404.html");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int CategoryID = Integer.parseInt(request.getParameter("CategoryID"));
        String CategoryName = request.getParameter("CategoryName");
        CourseDAO.INS.updateCategory(CategoryID, CategoryName);
        response.sendRedirect(request.getContextPath() + "/AttributeManage");
    }

}
