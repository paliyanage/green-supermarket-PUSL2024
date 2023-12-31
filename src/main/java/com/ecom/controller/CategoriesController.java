package com.ecom.controller;

import com.ecom.dao.CategoriesDAO;
import com.ecom.dao.UserDao;
import com.ecom.model.Categories;
import com.ecom.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/categories")
public class CategoriesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        System.out.println("inside Categories");
        List<Categories> categories = categoriesDAO.getCategories();

        req.setAttribute("Categories", categories);
        System.out.println("List of catogories");
        for (Categories category : categories) {
            System.out.println(category.getName());
            System.out.println("good");
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("category.jsp");
        requestDispatcher.forward(req,resp);
    }
}
