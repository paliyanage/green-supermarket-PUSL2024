<%--
  Created by IntelliJ IDEA.
  User: rohan
  Date: 2023-12-31
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PayPal Payment Integration</title>
    <!-- Include Bootstrap CSS -->
    <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet">

    <style>
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

<%@include file="header.jsp" %>

<main class="container mt-5">
    <h1 class="mb-4">Pay with PayPal</h1>

    <!-- PayPal Payment Form -->
    <form action="PayPalPaymentServlet" method="post">
        <!-- Add your form fields here (e.g., product details,
quantity) -->

        <!-- PayPal Pay Now Button -->
        <button type="submit" class="btn btn-primary">Pay with
            PayPal</button>
    </form>
</main>

<%@include file="footer.jsp" %>

<!-- Include Bootstrap JS and Popper.js -->
<script
        src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
