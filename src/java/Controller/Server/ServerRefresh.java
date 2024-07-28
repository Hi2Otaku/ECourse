/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Server;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import DAO.*;
import Models.*;
import java.io.Console;

/**
 *
 * @author hi2ot
 */
public class ServerRefresh extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setIntHeader("Refresh", 1);

        response.setContentType("text/html");

        List<Attempt> AttemptList = CourseDAO.INS.getUnfinishedAttempt();
        Date date = new Date();
        for (Attempt atm : AttemptList) {
            var tmp1 = atm.getSubmittedDate().getTime();
            var tmp2 = new java.sql.Timestamp(date.getTime()).getTime();
            if (tmp2 >= tmp1) {
                atm.setFinished(1);
                CourseDAO.INS.updateAttempt(atm);
                float grade = UserDAO.INS.getAttemptMark(atm.getUserID(), atm.getCourseID(), atm.getLessonID(), atm.getQuizID(), atm.getAttemptID()) / QuizDAO.INS.getQuiz(atm.getCourseID(), atm.getLessonID(), atm.getQuizID()).getNoQ() * 10;
                if (grade >= 8) {
                    UserDAO.INS.updateQuizProgress(atm.getUserID(), atm.getCourseID(), atm.getLessonID(), atm.getQuizID());
                }
            }
        }

        AttemptList = CourseDAO.INS.getAttempt();
        for (Attempt atm : AttemptList) {
            float grade = UserDAO.INS.getAttemptMark(atm.getUserID(), atm.getCourseID(), atm.getLessonID(), atm.getQuizID(), atm.getAttemptID()) / QuizDAO.INS.getQuiz(atm.getCourseID(), atm.getLessonID(), atm.getQuizID()).getNoQ() * 10;
            if (grade >= 8) {
                UserDAO.INS.updateQuizProgress(atm.getUserID(), atm.getCourseID(), atm.getLessonID(), atm.getQuizID());
            }
        }

        PrintWriter out = response.getWriter();
        out.println("<h1 class='text-align-center'>Refresh Time: " + date + "</h1>");
    }

}
