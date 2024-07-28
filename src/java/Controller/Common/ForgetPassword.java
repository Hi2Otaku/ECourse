/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Common;

import DAO.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hi2ot
 */
public class ForgetPassword extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        SEQuestionDAO.INS.load();        
        request.setAttribute("SQuestionList", SEQuestionDAO.INS.getQel());        
        request.getRequestDispatcher("Web/ForgetPassword.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String username = request.getParameter("username");
        int SQ = Integer.parseInt(request.getParameter("SQ"));
        String answer = request.getParameter("answer");
        
        User u = UserDAO.INS.getUserByName(username);
        
        if (u != null && u.getSecurityQuestionID() == SQ && u.getAnswer().equals(answer)) {
            HttpSession ses = request.getSession();
            ses.setAttribute("ResetAllowed", 1);
            ses.setAttribute("UserID", u.getUserID());
            response.sendRedirect(request.getContextPath() + "/ResetPassword");
        } else {
            request.setAttribute("err", "Invalid Infomation!");
            doGet(request, response);
        }                
    }

}
