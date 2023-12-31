package com.ecom.controller;


import com.ecom.dao.Login;
import com.ecom.dao.UserDao;
import com.ecom.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLOutput;

public class AddtoCartController extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response){
        String name = (String) request.getAttribute("qti");
        String productid = (String) request.getAttribute("product");

        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
            requestDispatcher.forward(request,response);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }

    }

}
