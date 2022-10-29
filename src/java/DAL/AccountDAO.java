/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    public Account login(String username, String password) {
        try {
            Connection con = new DBContext().getConnection();
            String sql = "select * from Account_HE161055 where username = ? and password = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                return a;
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

}
