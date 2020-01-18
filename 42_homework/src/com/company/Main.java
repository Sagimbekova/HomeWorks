package com.company;

public class Main {
    static DB db = new DB();
    public static void main(String[] args) {
        System.out.println(db.getAllStudents());
        System.out.println(db.getAllGroups());
    }
}
