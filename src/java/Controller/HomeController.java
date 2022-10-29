/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import Model.Category;
import Model.Product;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class HomeController extends HttpServlet {

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
        final int PAGE_SIZE = 6; // số sản phẩm 1 trang

        List<Category> CtgList = new CategoryDAO().getAllCategories();
//      List<Product> listProducts= new ProductDAO().getAllProducts();
//      bien dung chung, luu o session tren server
        HttpSession session = request.getSession();// chua key va value
        session.setAttribute("CtgList", CtgList);
        
        // paging
        int page = 1; // trang nào 
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        ProductDAO productDAO = new ProductDAO();
        List<Product> listProducts = productDAO.getProductsWithPagging(page, PAGE_SIZE);
        int totalProducts = productDAO.getTotalProducts();
        int totalPage = totalProducts / PAGE_SIZE;
        if (totalProducts % PAGE_SIZE != 0) {
            totalPage += 1;// chia dư thì công thêm 1 trang , làm tròn lên
        }

        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
//        request.setAttribute("CtgList", CtgList);
        request.setAttribute("listProducts", listProducts);
        request.getSession().setAttribute("UrlHistory", "HomeController");

        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
