/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {

    private int id;
    private String fname;
    private String lname;
    private String uname;
    private String psw;
    private String email;
    private String role;

    public User() {
    }

    public User(String fname, String lname, String uname, String psw, String email, String role) {
        this.fname = fname;
        this.lname = lname;
        this.uname = uname;
        this.psw = psw;
        this.email = email;
        this.role = role;
    }

    public User(String uname, String psw) {
        this.uname = uname;
        this.psw = psw;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getRole() {
        return role;
    }

    public boolean register(Connection con) {
        boolean a = false;
        String sql = "INSERT INTO users(fname, lname, email, role, uname, psw) VALUES(?,?,?,?,?,?);";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.fname);
            pstmt.setString(2, this.lname);
            pstmt.setString(3, this.email);
            pstmt.setString(4, this.role);
            pstmt.setString(5, this.uname);
            pstmt.setString(6, this.psw);
            if (pstmt.executeUpdate() > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public int login(Connection con, String userPasw) {
        int id = -1;
        String sql = "SELECT * FROM users WHERE uname=?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.uname);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                this.psw = rs.getString("psw");
                if (MD5.getMd5(userPasw).equals(this.psw)) {
                    id = rs.getInt("id");
                    this.fname = rs.getString("fname");
                    this.lname = rs.getString("lname");
                    this.email = rs.getString("email");
                    this.role = rs.getString("role");
                } else {
                    id = -2;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public void getAUser(Connection con) {
        String sql = "SELECT * FROM users WHERE id=?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(this.id));
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {  
                this.fname = rs.getString("fname");
                this.lname = rs.getString("lname");
                this.role = rs.getString("role");
                this.email = rs.getString("email");
                this.uname = rs.getString("uname");
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<User> getAllUsers(Connection con) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "member");

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("fname"), rs.getString("lname"), rs.getString("uname"), rs.getString("psw"), rs.getString("email"), rs.getString("role"));
                user.setId(Integer.parseInt(rs.getString("id")));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }
    public List<User> getAllUsersforAdmin(Connection con) {
        List<User> users = new ArrayList<>();
       String sql = "SELECT * FROM users WHERE role IN ('member', 'ProjectManager')";

        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("fname"), rs.getString("lname"), rs.getString("uname"), rs.getString("psw"), rs.getString("email"), rs.getString("role"));
                user.setId(Integer.parseInt(rs.getString("id")));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }
        

    public static int getAllMemberCount(Connection con) {
        String sql = "SELECT COUNT(*) FROM users WHERE role='member' ";
  

        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int getAllPMCount(Connection con) {
        String sql = "SELECT COUNT(*) FROM users WHERE role='ProjectManager' ";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public boolean removeUser(Connection con) {
        boolean a = false;
        String sql = "DELETE FROM users WHERE id = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            if (pstmt.executeUpdate() > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

}
