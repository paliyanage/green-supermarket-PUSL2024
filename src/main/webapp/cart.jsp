<%--
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
        }

        .item-quantity {
            width: 50px;
        }

        .btn-update {
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
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        footer {
            margin-top: auto;
        }
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        main{
            flex: 1;
        }

        footer {
            margin-top: auto;
        }
    </style>
</head>
<body>

<main class="container">
    <h2 class="mt-4">Shopping Cart</h2>

    <!-- Cart Items -->
    <div class="cart-container">
        <!-- Replace the items below with your actual cart items data -->
        <div class="cart-item">
            <div class="item-details">
                <span>Laptop</span>
                <span>$999.00</span>
            </div>
            <div class="item-details">
                <input type="number" class="form-control item-quantity" value="1" />
                <button class="btn btn-primary btn-update">Update</button>
                <span class="btn-remove" onclick="removeItem()">Remove</span>
            </div>
        </div>

        <div class="cart-item">
            <div class="item-details">
                <span>T-shirt</span>
                <span>$19.99</span>
            </div>
            <div class="item-details">
                <input type="number" class="form-control item-quantity" value="1" />
                <button class="btn btn-primary btn-update">Update</button>
                <span class="btn-remove" onclick="removeItem()">Remove</span>
            </div>
        </div>
    </div>

    <!-- Total -->
    <div class="total">
        <p>Total: $1018.99</p>
        <a href="paynow.jsp" class="btn btn-primary">Checkout</a>
    </div>
</main>

<%@ include file="footer.jsp" %>

<!-- Add Bootstrap JS and Popper.js links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function removeItem() {
        // Implement logic to remove the item from the cart
        alert("Item removed from the cart");
    }
</script>

</body>
</html>

