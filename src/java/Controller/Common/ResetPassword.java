/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Models.*;
import DAO.*;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author hi2ot
 */
public class ResetPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Object check = ses.getAttribute("ResetAllowed");
        ses.removeAttribute("ResetAllowed");
        if (check != null) {
            request.setAttribute("UserID", ses.getAttribute("UserID"));
            ses.removeAttribute("UserID");
            request.getRequestDispatcher("/Web/ResetPassword.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        int UserID = Integer.parseInt(request.getParameter("UserID"));
        if (password.equals(confirm)) {
            try {
                SecureRandom random = new SecureRandom();
                byte[] salt = new byte[16];
                random.nextBytes(salt);
                KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, 128);
                SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
                byte[] hash = factory.generateSecret(spec).getEncoded();
                Base64.Encoder enc = Base64.getEncoder();
                UserDAO.INS.resetPass(Integer.parseInt(request.getParameter("UserID")), enc.encodeToString(hash), enc.encodeToString(salt));
                response.sendRedirect(request.getContextPath() + "/Login");
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            request.setAttribute("UserID", UserID);
            request.setAttribute("err", "Two password are not the same!");
            request.getRequestDispatcher("/Web/ResetPassword.jsp").forward(request, response);
            
        }

    }

}
