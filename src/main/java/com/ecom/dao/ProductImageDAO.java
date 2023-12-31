package com.ecom.dao;

import com.ecom.model.ProductImages;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductImageDAO {
    public ProductImages getImgURL(int product_id){
        ProductImages url = new ProductImages();
        try (Connection connection = DatabaseConnect.getInstance().getConnection()) {
            String query = "SELECT image_url FROM product_images where product_images.product_id =?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, String.valueOf(product_id));
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    resultSet.next();
                    url.setImage_url(resultSet.getString("image_url"));
                    } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error while fetching categories from the database", e);
        }
        return url;
    }

}
