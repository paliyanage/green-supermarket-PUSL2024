<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecom.model.CartItem" %>
<%@ page import="com.ecom.model.Product" %>
<%@ page import="com.ecom.dao.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: pasindu
  Date: 2023-12-31
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<html>
<head>
    <title>Shopping Cart</title>
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Add your custom styling or links to external stylesheets here -->
    <style>
        /* Add your custom styling for the cart display here */
        .cart-container {
            margin-top: 20px;
        }

        .cart-item {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
        }

        .item-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .item-quantity {
            width: 70px;
        }

        .btn-update,
        .btn-remove {
            margin-left: 10px;
        }

        .btn-remove {
            color: red;
            cursor: pointer;
        }

        .total {
            margin-top: 20px;
            text-align: right;
        }
        body{
             display: flex;
             flex-direction: column;
             min-height: 100vh;
         }

        main{
            flex: 1;
        }

        footer{
            margin-top: auto;
        }
    </style>
</head>
<body>

<main class="container">
    <h2 class="mt-4">Shopping Cart</h2>

    <%
        float total = 0;
        HttpSession session1 = request.getSession();
        List<CartItem> cartItemList = (List<CartItem>) session1.getAttribute("cartlist");
        ProductDAO productDAO = new ProductDAO();
        if (cartItemList !=null){
        for (CartItem cartItem : cartItemList){
            String productid = cartItem.getproductID();
            Product product = productDAO.getProductbyID(productid);
            System.out.println(cartItem.getQuantity());
    %>

    <!-- Cart Items -->
    <div class="cart-container">
        <!-- Replace the items below with your actual cart items data -->
        <div class="cart-item">
            <div class="item-details">
                <span class="font-weight-bold"><%=product.getName()%></span>
                <%
                    float productPrice = (float) product.getPrice()*cartItem.getQuantity();
                    total = total +productPrice;
                %>
                <span class="font-weight-bold">$ <%=productPrice%></span>
            </div>
            <div class="item-details">
                <input type="number" class="form-control item-quantity" value=<%=cartItem.getQuantity()%> />
                <button class="btn btn-primary btn-update">Update</button>
                <span class="btn btn-danger btn-remove" onclick="removeItem(<%=product.getProduct_id()%>)">Remove</span>
            </div>
        </div>
        <%}%>
    </div>

    <!-- Total -->
    <div class="total">
            <p class="font-weight-bold">Total: $<%=total%></p>
            <a href="paynow.jsp?total=<%=total%>" class="btn btn-primary">Checkout</a>
    </div>
    <% }else{ %>
        <div id="empty-cart-message" class="alert alert-info mt-3 text-center mx-auto">
            Your cart is empty.
        </div>
    <% } %>

</main>

<%@ include file="footer.jsp" %>

<!-- Add Bootstrap JS and Popper.js links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>

