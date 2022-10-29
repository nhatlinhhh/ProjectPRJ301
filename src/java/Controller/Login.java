/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        Cookie[] cookies = request.getCookies();
        String username = null;
        String password = null;
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals(username)) {
                username = cooky.getValue();
            }
            if (cooky.getName().equals(password)) {
                username = cooky.getValue();
            }
            if (username != null && password != null) {
                break;
            }
        }
        if (username != null && password != null) {
            Account account = new AccountDAO().login(username, password);
            if (account != null) {// cookie hop le thi luu len session
                request.getSession().setAttribute("account", account);
                response.sendRedirect("HomeController");
                return;
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        // lấy ra username, password, remember
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean remember = request.getParameter("remember") != null;

        // check username, password
        Account account = new AccountDAO().login(username, password);

        // remember
        if (account != null) {// hop le-> luu tren session
            if (remember) { // tạo cookie, lưu dưới trình duyệt người dùng
                Cookie usernameCookie = new Cookie("username", username);
                usernameCookie.setMaxAge(60);
                Cookie passwordCookie = new Cookie("password", password);
                passwordCookie.setMaxAge(60);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }
            request.getSession().setAttribute("account", account);
            response.sendRedirect("HomeController");
        } else {// k hop le-> tra ve loi
            request.setAttribute("error", "Username or Password is incorrect");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
