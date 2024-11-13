/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Announcement {

    private int anid;
    private String antitle;
    private String anmessage;
    private String andate;
    private String anby;
    
    

    

    public Announcement() {
    }

    public Announcement(String antitle, String anmessage) {
        this.antitle = antitle;
        this.anmessage = anmessage;
    }

    public Announcement(int anid, String antitle, String anmessage, String andate) {
        this.anid = anid;
        this.antitle = antitle;
        this.anmessage = anmessage;
        this.andate = andate;
    }

    public int getAnid() {
        return anid;
    }

    public void setAnid(int anid) {
        this.anid = anid;
    }

    public void setAntitle(String antitle) {
        this.antitle = antitle;
    }

    public void setAnmessage(String anmessage) {
        this.anmessage = anmessage;
    }

    public void setAndate(String andate) {
        this.andate = andate;
    }

    public String getAntitle() {
        return antitle;
    }

    public String getAnmessage() {
        return anmessage;
    }

    public String getAndate() {
        return andate;
    }

    public String getAnby() {
        return anby;
    }

    public void setAnby(String anby) {
        this.anby = anby;
    }

    public static List<Announcement> getAllAnnouncement(Connection con) {
        List<Announcement> allAnnouncements = new ArrayList<>();
        String sql = "SELECT * FROM announcement ORDER BY andate DESC";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String anid = rs.getString("anid");
                String antitle = rs.getString("antitle");
                String anmessage = rs.getString("anmessage");
                String andate = rs.getString("andate");
                Announcement an = new Announcement(Integer.parseInt(anid), antitle, anmessage, andate);
                an.setAnby(rs.getString("anby"));
                allAnnouncements.add(an);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Announcement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allAnnouncements;
    }

    public boolean saveAnnouncement(Connection con, String anby) {
        boolean a = false;
        String sql = "INSERT INTO announcement(antitle, anmessage, anby) VALUES(?,?,?)";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.antitle);
            pstmt.setString(2, this.anmessage);
            pstmt.setString(3, anby);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Announcement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    

    
    public static boolean  removeAnnouncement(Connection con,int announcementId) {
        String sql = "DELETE FROM announcement WHERE anid = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, announcementId); 
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Announcement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    
    
    

}
