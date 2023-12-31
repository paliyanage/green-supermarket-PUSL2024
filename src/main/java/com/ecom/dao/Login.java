package com.ecom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
    public static boolean isvalidUser(String username, String password) throws SQLException {
        try(Connection connection = DatabaseConnect.getInstance().getConnection()){
            String sql = "select * from users where username = ? and password = ?";
            try(PreparedStatement preparedStatement = connection.prepareStatement(sql)){
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                ResultSet resultSet = preparedStatement.executeQuery();
                System.out.println("Valid user");
                return resultSet.next();
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}
