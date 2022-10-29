/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrdersDAO {

    public int createGetOrderId(Orders orders) {
        try {
            String sql = "INSERT INTO [dbo].[Orders_HE161055]\n"
                    + "           ([totalPrice]\n"
                    + "           ,[note]\n"
                    + "           ,[shipping_id]\n"
                    + "           ,[account_id])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, orders.getTotalPrice());
            ps.setString(2, orders.getNote());
            ps.setInt(3, orders.getShippingId());
            ps.setInt(4, orders.getAccountId());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
