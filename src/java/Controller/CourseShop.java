/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import Models.*;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hi2ot
 */
public class CourseShop extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        List<Category> CategoryList = CourseDAO.INS.loadCategoryList();                
        List<Subject> SubjectList = CourseDAO.INS.loadSubjectList();
        
        List<Category> checkedCategory = new ArrayList<>();
        List<Subject> checkedSubject = new ArrayList<>();
        
        List<Integer> catNum = new ArrayList<>();
        List<Integer> sujNum = new ArrayList<>();

        for (Category cat : CategoryList) {
            if (request.getParameter("Category" + cat.getCategoryID()) != null) {
                catNum.add(cat.getCategoryID());
                checkedCategory.add(cat);
            }
        }
        
        for (Subject suj : SubjectList) {
            if (request.getParameter("Subject" + suj.getSubjectID()) != null) {
                sujNum.add(suj.getSubjectID());
                checkedSubject.add(suj);
            }
        }
        
        List<Models.Course> CourseList = CourseDAO.INS.getCourseList(checkedCategory, checkedSubject);           
        
        request.setAttribute("UserINS", UserDAO.INS);
        request.setAttribute("catNum", catNum);
        request.setAttribute("sujNum", sujNum);
        request.setAttribute("SubjectList", SubjectList);
        request.setAttribute("CourseList", CourseList);
        request.setAttribute("CategoryList", CategoryList);
        request.setAttribute("CourseINS", CourseDAO.INS);
        request.getRequestDispatcher("/Web/CourseShop.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int buyId = -1;
        try {
            buyId = Integer.parseInt(request.getParameter("buyId"));
        } catch (NumberFormatException e) {
            doGet(request, response);
            return;
        }
        
        HttpSession ses = request.getSession();
        User u = (User) ses.getAttribute("User");
                
        UserDAO.INS.addUserCart(u.getUserID(), buyId);        
        
        doGet(request, response);
    }

}
