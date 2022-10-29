/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    // hiển thị tất cả các sản phẩm
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product_HE161055";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // lọc sản phẩm theo phân loại (lọc theo categoryid)
    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product_HE161055 where CategoryId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // hiển thị sản phẩm theo phân trang
    public List<Product> getProductsWithPagging(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product_HE161055 order by ProductId offset (?-1)*? row fetch next ? rows only";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // đếm số sản phẩm 
    public int getTotalProducts() {
        try {
            String sql = "select count(ProductId) from Product_HE161055";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    // search theo tên sản phẩm
    public List<Product> search(String keyword) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product_HE161055 where name like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // lấy sản phẩm theo id
    public Product getProductById(int ProductId) {
        try {
            String sql = "select * from Product_HE161055 where ProductId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ProductId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                return product;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    // CRUD : Delete
    public void deleteProduct(int ProductId) {
        try {
            String sql = "delete from Product_HE161055 where ProductId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ProductId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    // CRUD : Create
    public void insertProduct(String id, String name, String quantity, String price, String description, String image, String createdDate, String category) {
        try {
            String sql = "INSERT INTO [dbo].[Product_HE161055]\n"
                    + "           ([ProductId]\n"
                    + "           ,[Name]\n"
                    + "           ,[Quantity]\n"
                    + "           ,[Price]\n"
                    + "           ,[Description]\n"
                    + "           ,[ImageURL]\n"
                    + "           ,[CreatedDate]\n"
                    + "           ,[CategoryId])\n"
                    + "     VALUES(?,?,?,?,?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, quantity);
            ps.setString(4, price);
            ps.setString(5, description);
            ps.setString(6, image);
            ps.setString(7, createdDate);
            ps.setString(8, category);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    // CRUD : update 
    public void updateProduct(String name, String quantity, String price, String description, String image, String createdDate, String category, String id) {
        try {
            String sql = "UPDATE [dbo].[Product_HE161055]\n"
                    + "   SET [Name] = ?,\n"
                    + "      [Quantity] = ?,\n"
                    + "      [Price] = ?,\n"
                    + "      [Description] = ?,\n"
                    + "      [ImageURL] = ?,\n"
                    + "      [CreatedDate] = ?,\n"
                    + "      [CategoryId] = ?\n"
                    + " WHERE [ProductId]=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, quantity);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setString(5, image);
            ps.setString(6, createdDate);
            ps.setString(7, category);
            ps.setString(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
