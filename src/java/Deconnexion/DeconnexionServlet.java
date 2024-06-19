/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Deconnexion;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utilisateur.Users;

/**
 *
 * @author jessy
 */
@WebServlet(name = "DeconnexionServlet", urlPatterns = {"/DeconnexionServlet"})
public class DeconnexionServlet extends HttpServlet {

@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    if (session!= null) {
        session.invalidate();
        //Users u=(Users)session.getAttribute("user");
        //System.out.println(u.getUsername());
        // Redirection vers la page de connexion ou une autre page
        response.sendRedirect("login.jsp");
    }
}
   
}
