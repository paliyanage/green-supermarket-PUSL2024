package com.ecom.controller;

import com.ecom.dao.Login;
import com.ecom.dao.Signup;
import com.ecom.dao.UserDao;
import com.ecom.model.User;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/signup")
public class SignupController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            if (Login.isvalidUser(username, password)){
                System.out.println("Login Success");

                UserDao userDao = new UserDao();
                User user = userDao.getUser(username);

                HttpSession session = (HttpSession) req.getSession();
                session.setAttribute("userid",user.getUser_id());

                req.setAttribute("user", user);
                System.out.println("Login redirected");

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("profile.jsp");
                requestDispatcher.forward(req,resp);
            } else {
                // Register the user
                if (Signup.registerUser(username, email, password)) {
                    UserDao userDao = new UserDao();
                    User user = userDao.getUser(username);

                    HttpSession session = (HttpSession) req.getSession();
                    session.setAttribute("userid",user.getUser_id());

                    req.setAttribute("user", user);
                    System.out.println("Login redirected");

                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("profile.jsp");
                    requestDispatcher.forward(req,resp);
                } else {
                    // Registration failed, handle accordingly (e.g., show an error message)
                    resp.sendRedirect("signup.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection error
            resp.sendRedirect("signup.jsp");
        }
    }
}
