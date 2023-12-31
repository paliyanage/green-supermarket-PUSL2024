package com.ecom.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("Entering LogoutController");
        HttpSession session = request.getSession();
        try {
            session.removeAttribute("user_id");
            session.invalidate();
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            System.out.println("Error in LogoutController: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
