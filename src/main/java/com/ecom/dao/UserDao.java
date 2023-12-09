package com.ecom.dao;

import com.ecom.model.User;

import java.sql.*;

public class UserDao {

    public User getUser(String username) {
        User user = new User();
        try {
            DatabaseConnect connection = DatabaseConnect.getInstance();
            Connection dbConnection = connection.getConnection();

            // Use a prepared statement to safely handle parameters
            String query = "SELECT * FROM users WHERE username = ?";
            try (PreparedStatement preparedStatement = dbConnection.prepareStatement(query)) {
                preparedStatement.setString(1, username);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        user.setUser_id(resultSet.getInt("user_id"));
                        user.setEmail(resultSet.getString("email"));
                        user.setUsername(resultSet.getString("username"));
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public User getUserbyUserid(int userid) {
        User user = new User();
        try {
            DatabaseConnect connection = DatabaseConnect.getInstance();
            Connection dbConnection = connection.getConnection();

            // Use a prepared statement to safely handle parameters
            String query = "SELECT * FROM users WHERE user_id = ?";
            try (PreparedStatement preparedStatement = dbConnection.prepareStatement(query)) {
                preparedStatement.setString(1, String.valueOf(userid));

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        user.setUser_id(resultSet.getInt("user_id"));
                        user.setEmail(resultSet.getString("email"));
                        user.setUsername(resultSet.getString("username"));
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public User putUser(User updatedUser) {
        try {
            DatabaseConnect connection = DatabaseConnect.getInstance();
            Connection dbConnection = connection.getConnection();

            // Use a prepared statement to safely handle parameters
            String query = "UPDATE users SET email = ?, username = ? WHERE user_id = ?";
            try (PreparedStatement preparedStatement = dbConnection.prepareStatement(query)) {
                preparedStatement.setString(1, updatedUser.getEmail());
                preparedStatement.setString(2, updatedUser.getUsername());
                preparedStatement.setInt(3, updatedUser.getUser_id());

                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    // Update successful, return the updated user
                    return updatedUser;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // If the update fails or no rows were affected, return null or handle as appropriate
        return null;
    }

}
