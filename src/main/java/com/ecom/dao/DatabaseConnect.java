/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pasindu
 */
public class DatabaseConnect {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ecom";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "";
    private static DatabaseConnect instance;

    private DatabaseConnect(){}
    public static synchronized DatabaseConnect getInstance(){
        if (instance == null){
            instance = new DatabaseConnect();
        }
        return instance;
    }
    public Connection getConnection() throws SQLException {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL,USER_NAME,PASSWORD);

        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        }
    }
}
