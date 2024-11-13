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


/**
 *
 * @author Chathura
 */


public class Task {

    private int tid;
    private String tname;
    private String tdis;
    private String startDate;
    private String deadline;
    private String priority;
    private String assignedTo;
    private String status;

    public Task() {
    }

    public Task(String tname, String tdis, String startDate, String deadline, String priority) {
        this.tname = tname;
        this.tdis = tdis;
        this.startDate = startDate;
        this.deadline = deadline;
        this.priority = priority;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getTid() {
        return tid;
    }

    public String getTname() {
        return tname;
    }

    public String getTdis() {
        return tdis;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getDeadline() {
        return deadline;
    }

    public String getPriority() {
        return priority;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }

    public String getAssignedTo() {
        return assignedTo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean saveTask(Connection con, String uname) {
        boolean a = false;
        String sql = "INSERT INTO tasks(tname, tdis, startDate, deadline, priority, uname, assignedTo) VALUES(?,?,?,?,?,?,?)";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, this.tname);
            pstmt.setString(2, this.tdis);
            pstmt.setString(3, this.startDate);
            pstmt.setString(4, this.deadline);
            pstmt.setString(5, this.priority);
            pstmt.setString(6, uname);
            pstmt.setString(7, "Not Assigned");
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Task.class.getName()).log(Level.SEVERE, "Error saving task", ex);
        }
        return a;
    }

    public List<Task> getAllTasks(Connection con, String uname) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE uname = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, uname);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String tid = rs.getString("tid");
                String tname = rs.getString("tname");
                String tdis = rs.getString("tdis");
                String startDate = rs.getString("startDate");
                String deadline = rs.getString("deadline");
                String priority = rs.getString("priority");
                String assignedTo = rs.getString("assignedTo");
                String status = rs.getString("status");
                Task task = new Task(tname, tdis, startDate, deadline, priority);
                task.setStatus(status);
                task.setAssignedTo(assignedTo);
                task.setTid(Integer.parseInt(tid));
                tasks.add(task);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Task.class.getName()).log(Level.SEVERE, null, ex);
        }

        return tasks;
    }

    public void getATask(Connection con) {
        String sql = "SELECT * FROM tasks WHERE tid = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(this.tid));
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                this.tname = rs.getString("tname");
                this.tdis = rs.getString("tdis");
                this.startDate = rs.getString("startDate");
                this.deadline = rs.getString("deadline");
                this.priority = rs.getString("priority");
                this.assignedTo = rs.getString("assignedTo");
                this.status = rs.getString("status");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Task.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    

    
    
        public static int getCompletedTaskCount(Connection con) {
       String sql = "SELECT COUNT(*) FROM tasks WHERE status='Completed' ";
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
    
    

        
        
        
        public static int getPendingTaskCount(Connection con) {
       String sql = "SELECT COUNT(*) FROM tasks WHERE status='Pending' ";
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
    

        
        
         
        public static int getAllTaskTaskCount(Connection con) {
      String sql = "SELECT COUNT(*) FROM tasks";

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
        
        
    


    public boolean assignTask(Connection con) {
        boolean a = false;
        String sql = "UPDATE tasks SET assignedTo = ? ,status = ? WHERE tid = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.assignedTo);
            pstmt.setString(2, "Assigned");
            pstmt.setInt(3, this.tid);
            if (pstmt.executeUpdate() > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Task.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public boolean editTask(Connection con) {
        boolean a = false;
        String sql = "UPDATE tasks SET tname = ?, tdis = ?, startDate = ?, deadline = ?, priority = ? WHERE tid = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.getTname());
            pstmt.setString(2, this.getTdis());
            pstmt.setString(3, this.getStartDate());
            pstmt.setString(4, this.getDeadline());
            pstmt.setString(5, this.getPriority());
            pstmt.setInt(6, this.getTid());
            if (pstmt.executeUpdate() > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Task.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public boolean deleteTask(Connection con) {
        boolean a = false;
        String sql = "DELETE FROM tasks WHERE tid = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, this.tid);
            if (pstmt.executeUpdate() > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Task.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public List<Task> getAllTasksForMember(Connection con, String uname) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE assignedTo = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, uname);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String tid = rs.getString("tid");
                String tname = rs.getString("tname");
                String tdis = rs.getString("tdis");
                String startDate = rs.getString("startDate");
                String deadline = rs.getString("deadline");
                String priority = rs.getString("priority");
                String assignedTo = rs.getString("assignedTo");
                String status = rs.getString("status");
                Task task = new Task(tname, tdis, startDate, deadline, priority);
                task.setStatus(status);
                task.setAssignedTo(assignedTo);
                task.setTid(Integer.parseInt(tid));
                tasks.add(task);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Task.class.getName()).log(Level.SEVERE, null, ex);
        }

        return tasks;
    }

    public boolean updateStatus(Connection con) {
        boolean a = false;
        String sql = "UPDATE tasks SET status = ? WHERE tid = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.status);
            pstmt.setInt(2, this.tid);
            if (pstmt.executeUpdate() > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Task.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

}
