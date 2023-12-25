<%--
  Created by IntelliJ IDEA.
  User: pasindu
  Date: 2023-12-30
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<html>
<head>
    <title>Product List</title>
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Add your custom styling or links to external stylesheets here -->
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
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4">Product List</h2>

    <!-- Product List -->
    <div class="product-container">
        <!-- Replace the items below with your actual product data -->
        <% for (int i = 1; i <= 8; i++) { %>
        <div class="card product-card">
            <img src="product<%= i %>.jpg" class="card-img-top" alt="Product <%= i %>">
            <div class="card-body">
                <h5 class="card-title">Product <%= i %></h5>
                <p class="card-text">Product description goes here.</p>
                <input type="number" class="form-control" placeholder="Quantity" />
                <button class="btn btn-primary btn-add-to-cart">Add to Cart</button>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Next Page Button -->
    <div class="text-center mt-4">
        <button class="btn btn-primary">Next Page</button>
    </div>
</div>

<%@ include file="footer.jsp" %>

<!-- Add Bootstrap JS and Popper.js links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

