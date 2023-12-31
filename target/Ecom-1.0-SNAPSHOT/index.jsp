<%@ page import="com.ecom.dao.ProductDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecom.model.Product" %>
<%@ page import="com.ecom.dao.ProductImageDAO" %>
<%@ page import="com.ecom.model.ProductImages" %>

<%--
  Created by IntelliJ IDEA.
  User: rohan
  Date: 2023-12-29
  Time: 02:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* Add your custom styling for product display here */
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin-top: 20px;
        }

        .product-card {
            width: 22%;
            margin-bottom: 20px;
        }

        .card-img-top {
            max-height: 200px;
            object-fit: cover;
        }

        .card-body {
            text-align: center;
        }

        .btn-add-to-cart {
            margin-top: 10px;
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
<body class="text-center">


<%@ include file="header.jsp" %>
<main class="container">
    <h2 class="mt-4">Product List</h2>

    <!-- Product List -->
    <div class="product-container">
        <!-- Replace the items below with your actual product data -->

        <%
            System.out.println("index inside");
            ProductDAO productDAO = new ProductDAO();
            List<Product> products = productDAO.getProducts();
            ProductImageDAO productImageDAO = new ProductImageDAO();
            String iurl;
            for (Product product: products){
                ProductImages uri = productImageDAO.getImgURL(product.getProduct_id());
                iurl = uri.getImage_url();
                System.out.println(iurl);
        %>
        <div class="card product-card">
            <img src="<%=iurl%>" class="card-img-top" alt="Product <%=iurl%>">
            <div class="card-body">
                <form action="/Ecom_war/cartoadd" method="get">
                <h5 class="card-title"><%=product.getName()%></h5>
                    <h5 class="card-title">USD <%=product.getPrice()%></h5>
                <p class="card-text"><%=product.getDescription()%></p>
                    <input type="number" class="form-control" placeholder="Quantity" name="qti"/>
                    <input type="hidden" name="product" value="<%=product.getProduct_id()%>">
                <button class="btn btn-primary btn-add-to-cart" type="submit">Add to Cart</button>
                </form>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Next Page Button -->
    <div class="text-center mt-4">
        <button class="btn btn-primary">Next Page</button>
    </div>


</main>
<%@ include file="footer.jsp" %>

<!-- Add Bootstrap JS and Popper.js links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>


