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

@WebServlet("/login")
public class LoginController extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
//            Login login = new Login();
            if (Login.isvalidUser(username, password)){
                System.out.println("Login Success");

                UserDao userDao = new UserDao();
                User user = userDao.getUser(username);

                HttpSession session = request.getSession();
                session.setAttribute("userid",user.getUser_id());

                request.setAttribute("user", user);
                System.out.println("Login redirected");

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("profile.jsp");
                requestDispatcher.forward(request,response);
            }else {
                System.out.println("Login Failed");
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException | IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

}
