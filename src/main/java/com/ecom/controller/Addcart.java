package com.ecom.controller;

import com.ecom.model.CartItem;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet("/addcart")
public class Addcart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("Add to cart works well");
        String quti = req.getParameter("qti");
        String productid = req.getParameter("product");
        System.out.println(quti+" Qt form Product id "+productid+" add to cart successfully");
        HttpSession session = req.getSession(true);
        List<CartItem> cartlist = (List<CartItem>) session.getAttribute("cartlist");
        if(cartlist==null){
            cartlist = new ArrayList<>();
            cartlist.add(new CartItem(productid, quti));
        }else{
            boolean found = false;
            for(CartItem cartItem: cartlist){
                if(Objects.equals(cartItem.getproductID(), productid)){
                    int existingQuantity = cartItem.getQuantity();
                    int newQuantity = Integer.parseInt(quti);
                    int updatedQuantity = existingQuantity + newQuantity;
                    cartItem.setQuantity(updatedQuantity);
                    found = true;
                    break;
                }
            }
            if (!found) {
                // If no matching product ID was found, add a new CartItem to the list
                cartlist.add(new CartItem(productid, quti));
            }

        }
        {

        }

        session.setAttribute("cartlist", cartlist);
        System.out.println("cart items begin print");
        for (CartItem cart: cartlist){
            System.out.println("cart item "+ cart.getproductID());
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
        requestDispatcher.forward(req,resp);
    }
}
