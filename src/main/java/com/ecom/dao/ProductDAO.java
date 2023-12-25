package com.ecom.dao;

import com.ecom.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> getProducts() {
        List<Product> products = new ArrayList<>();

        try (Connection connection = DatabaseConnect.getInstance().getConnection()) {
            String query = "SELECT * FROM products";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Product product = new Product();
                        product.setProduct_id((int) resultSet.getLong("product_id"));
                        product.setName(resultSet.getString("name"));
                        product.setDescription(resultSet.getString("description"));
                        product.setPrice(resultSet.getDouble("price"));
                        product.setStock_quantity(resultSet.getInt("stock_quantity"));
                        product.getCategory_id(resultSet.getInt("category_id"));
                        products.add(product);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error while fetching categories from the database", e);
        }

        return products;
    }

    public List<Product> getProductsbyCategory(String category_id) {
        List<Product> products = new ArrayList<>();

        try (Connection connection = DatabaseConnect.getInstance().getConnection()) {
            String query = "SELECT * FROM products where category_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, String.valueOf(category_id));
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Product product = new Product();
                        product.setProduct_id((int) resultSet.getLong("product_id"));
                        product.setName(resultSet.getString("name"));
                        product.setDescription(resultSet.getString("description"));
                        product.setPrice(resultSet.getDouble("price"));
                        product.setStock_quantity(resultSet.getInt("stock_quantity"));
                        product.getCategory_id(resultSet.getInt("category_id"));
                        products.add(product);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error while fetching categories from the database", e);
        }

        return products;
    }

    public Product getProductbyID(String productid){
        Product product = new Product();
        try (Connection connection = DatabaseConnect.getInstance().getConnection()) {
            String query = "SELECT * FROM products where product_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, String.valueOf(productid));
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    resultSet.next();
                    product.setName(resultSet.getString("name"));
                    product.setPrice(resultSet.getDouble("price"));
                }
            }
            return product;
        } catch (SQLException e) {
            throw new RuntimeException("Error while fetching categories from the database", e);
        }

    }
}
