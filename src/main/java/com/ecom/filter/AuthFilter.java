package com.ecom.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override()
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        System.out.println("Auth Filter Processing");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(true);
        String url = ((HttpServletRequest) request).getRequestURI();
        System.out.println(url);
        if (authCheck(url)) {
            if (session != null && session.getAttribute("userid") != null) {
                // User is logged in, continue with the request
                System.out.println("Filter Done");
                chain.doFilter(request, response);
            } else {
                // User is not logged in, redirect to the login page
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
                return;
            }
        }
        else {
        System.out.println("Filter not applied");
        chain.doFilter(request,response);
        }
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }

    public Boolean authCheck(String url) {
        List<String> authUrls = Arrays.asList("/Ecom_war/addcart", "/Ecom_war/profile.jsp", "/Ecom_war/cart.jsp");

        for (String authUrl : authUrls) {
            if (url.equals(authUrl)) {
                return true;
            }
        }

        return false;
    }


    }

