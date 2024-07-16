/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Course;

import DAO.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author hi2ot
 */
public class CategoryManage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int Edit = -1;
        try {
            Edit = Integer.parseInt(request.getParameter("Edit"));
        } catch (NumberFormatException e) {

        }
        if (Edit > 0) {
            request.setAttribute("id", Edit);
            Category cat = CourseDAO.INS.getCategoryById(Edit);
            request.setAttribute("name", cat.getCategoryName());
            request.setAttribute("status", cat.getStatus());
        }

        String update = request.getParameter("update");
        if (update != null) {
            String id = request.getParameter("id");
            String name = request.getParameter("name").trim();
            String status = request.getParameter("status");
            if (name.equals("")) {
                request.setAttribute("err", "Name can not be emtpy!");
            } else if (status == null) {
                request.setAttribute("err", "Status can not be emtpy!");
            } else {
                if (id.equals("")) {
                    CourseDAO.INS.addCategory(CourseDAO.INS.loadCategoryList().size() + 1, name, Integer.parseInt(status));
                } else {
                    CourseDAO.INS.updateCategory(Integer.parseInt(id), name, Integer.parseInt(status));
                }
            }
        }

        List<Category> CategoryList = CourseDAO.INS.loadCategoryList();

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

        Paging paging = new Paging((CategoryList.isEmpty()) ? 1 : CategoryList.size(), 10, index);
        paging.calc();

        request.setAttribute("paging", paging);
        request.setAttribute("CourseINS", CourseDAO.INS);
        request.setAttribute("CategoryList", CategoryList);
        request.getRequestDispatcher("/Web/CategoryManage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
