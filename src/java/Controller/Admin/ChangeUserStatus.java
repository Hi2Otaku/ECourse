/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Admin;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.*;

/**
 *
 * @author hi2ot
 */
public class ChangeUserStatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        int UserID = -1;
        try {
            UserID = Integer.parseInt(request.getParameter("UserID"));
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/404.html");
            return;
        }
        
        if (UserID != 1) {
            UserDAO.INS.updateUserStatus(UserID);
        } else {
            request.setAttribute("err", "You can't inactive Admin Status!");
        }
        
        
        response.sendRedirect(request.getContextPath() + "/UserManage");        
    } 

}
