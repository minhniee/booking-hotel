package Context;
import model.Account;

import java.sql.*;

public class AccountDAO extends MyDAO{
    public Account checkLogin(String user_name, String password) {
        String sql = "SELECT [id], [user_name], [password], [full_name], [email], [role], [gender], [phone], [dob], [address] FROM [dbo].[account] WHERE user_name = ? AND [password] = ?";
        Account a = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user_name);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("user_name"));
                a.setFullname(rs.getString("full_name"));
                a.setEmail(rs.getString("email"));
                a.setRole(rs.getString("role"));
                a.setGender(rs.getBoolean("gender") ? 1 : 0); // Assuming gender is stored as BIT (0/1) in the database
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setDob(rs.getDate("dob"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        } finally {
            // Ensure resources are closed properly
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return a;
    }
    public void register(String username, String password, String fullname, String phone, int role) {
        String sql = "INSERT INTO [dbo].[Account] ([Username], [Password], [Fullname], [Phone], [Role])\n"
                + "VALUES (?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, phone);
            ps.setInt(5, role);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public Account checkAccountExist(String username) {
        String sql = "SELECT * FROM Account WHERE Username = ?";
        int check = 0;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString(2));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account updateProfile(int id, String fullname, String phone) {
        try {
            String sql = "UPDATE Account SET Fullname=?, Phone=? WHERE id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, phone);
            ps.setInt(3, id);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                sql = "SELECT * FROM Account WHERE id=?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();

                if (rs.next()) {
                    Account updatedAccount = new Account();
                    updatedAccount.setId(rs.getInt("id"));
                    updatedAccount.setFullname(rs.getString("Fullname"));
                    updatedAccount.setPhone(rs.getString("Phone"));
                    return updatedAccount;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
