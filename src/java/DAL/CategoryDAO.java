/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    public String status;
    Connection con;

    public CategoryDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public List<Category> getAllCategories() {
        List<Category> c = new ArrayList<Category>();
        try {

            String sql = "select * from Category_HE161055";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            status = "Error at read Category" + e.getMessage();
        }
        return c;
    }
}
