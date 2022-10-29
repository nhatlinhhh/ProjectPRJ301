/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrdersDetailDAO {

    public void saveCart(int orderId, Map<Integer, Cart> carts) {
        try {
            String sql = "INSERT INTO [dbo].[OrdersDetail_HE161055]\n"
                    + "           ([productName]\n"
                    + "           ,[productImage]\n"
                    + "           ,[productPrice]\n"
                    + "           ,[quantity]\n"
                    + "           ,[order_id])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(5, orderId);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer ProductId = entry.getKey();
                Cart cart = entry.getValue();
                ps.setString(1, cart.getProduct().getName());
                ps.setString(2, cart.getProduct().getImageUrl());
                ps.setInt(3, cart.getProduct().getPrice());
                ps.setInt(4, cart.getQuantity());
                ps.executeUpdate();
            }

        } catch (Exception ex) {
            Logger.getLogger(OrdersDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
