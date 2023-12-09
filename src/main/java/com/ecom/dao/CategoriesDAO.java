package com.ecom.dao;

import com.ecom.model.Categories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAO {

    public List<Categories> getCategories() {
        List<Categories> categories = new ArrayList<>();

        try (Connection connection = DatabaseConnect.getInstance().getConnection()) {
            String query = "SELECT * FROM product_categories";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Categories Categories = new Categories();
                        Categories.setCategory_id((int) resultSet.getLong("category_id"));
                        Categories.setName(resultSet.getString("name"));
                        categories.add(Categories);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error while fetching categories from the database", e);
        }

        return categories;
    }
}
