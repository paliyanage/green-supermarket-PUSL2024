package com.ecom.dao;

import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionTest {
    public static void main(String[] args){
        testDatabaseConnection();
    }
    public static void testDatabaseConnection(){
        try{
            Connection connection = DatabaseConnect.getInstance().getConnection();
            System.out.println("Connection to the database successful!");
            connection.close();
        } catch (SQLException e) {
            System.err.println("Unable to connect to the database. Check your connection parameters.");
            throw new RuntimeException(e);
        }
    }
}
