package com.company;

import models.Group;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DB {
    private final static String url = "jdbc:postgresql://localhost:5432/";
    private final static String user = "postgres";
    private final static String password = "123";

    public static Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected successfully");
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return conn;
    }


    public int getAllStudents() {
        int count = 0;
        //List<Student> students = new ArrayList<>();
        String sql = "select count(*) from students";
        try (Connection conn = DB.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            rs.next();
            count = rs.getInt(1);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }

    public List<Group> getAllGroups() {
        List<Group> groups = new ArrayList<>();
        String sql = "select * from groups";
        try (Connection conn = DB.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()){
                Group group = new Group();
                group.setId(rs.getInt("ID"));
                group.setCode(rs.getString("CODE"));
                group.setFacultyID(rs.getInt("Faculty_ID"));
                groups.add(group);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return groups;
    }
}