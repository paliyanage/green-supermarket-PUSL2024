package com.ecom;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*") // Define the URL pattern to filter, you might want to adjust this based on your application structure
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Get the session, if it exists
        HttpSession session = httpRequest.getSession(false);

        // Check if the user is logged in by verifying if the userid attribute is present in the session
        boolean isLoggedIn = (session != null && session.getAttribute("userid") != null);

        // Get the requested URL
        String requestURI = httpRequest.getRequestURI();
        System.out.println("Request URI: " + requestURI);

        // If the requested URL requires authentication and the user is not logged in, redirect to the login page
        if (requiresAuthentication(requestURI) && !isLoggedIn) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        } else {
            // Continue with the request chain
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }

    private boolean requiresAuthentication(String requestURI) {
        // Add logic here to determine if a URL requires authentication
        // For example, you might check if the URL starts with "/secured/" or "/admin/"
        return requestURI.startsWith("/checkout") || requestURI.endsWith("/profile.jsp");
    }
}
