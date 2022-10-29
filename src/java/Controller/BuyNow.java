/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.OrdersDAO;
import DAL.OrdersDetailDAO;
import DAL.ShippingDAO;
import Model.Account;
import Model.Cart;
import Model.Orders;
import Model.Shipping;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class BuyNow extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }

            // tính tổng hóa đơn
            int totalMoney = 0;
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer ProductId = entry.getKey();
                Cart cart = entry.getValue();

                totalMoney += cart.getQuantity() * cart.getProduct().getPrice();
            }
            request.setAttribute("totalMoney", totalMoney);
            request.getRequestDispatcher("buynow.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
//      processRequest(request, response);
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        // save vào database: bảng Shipping_HE161055, lấy id của bảng Shipping_HE161055
        // save vào shipping
        Shipping shipping = new Shipping(name, phone, address);
        int shippingId = new ShippingDAO().createGetShippingId(shipping);

        // save vào Orders_HE161055
        // lấy ra orderid của bảng Orders
        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        // tính tổng hóa đơn
        int totalMoney = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer ProductId = entry.getKey();
            Cart cart = entry.getValue();

            totalMoney += cart.getQuantity() * cart.getProduct().getPrice();
        }
        
        Orders orders = new Orders(2, totalMoney, note, shippingId);
        int orderId = new OrdersDAO().createGetOrderId(orders);

        // save vào OrdersDetail
        new OrdersDetailDAO().saveCart(orderId, carts);
        session.removeAttribute("carts");
        response.sendRedirect("success");
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
