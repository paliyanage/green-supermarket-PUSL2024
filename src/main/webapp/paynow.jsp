<%--
  Created by IntelliJ IDEA.
  User: pasindu
  Date: 2023-12-31
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PayPal Payment Integration</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        main {
            flex: 1;
        }

        footer {
            margin-top: auto;
        }
    </style>
</head>
<body>

<%@include file="header.jsp" %>

<main class="container mt-5">
    <h1 class="mb-4">Pay with PayPal</h1>

    <!-- PayPal Payment Form -->
    <form id="paypal-form">
        <!-- Add your form fields here (if any) -->
        <%
            String totalParam = request.getParameter("total");
            double total = Double.parseDouble(totalParam);
            // Now you have the 'total' value that was passed from the previous page
        %>
        <p>Total Amount: $<%= total %></p>

        <!-- PayPal Pay Now Button -->
        <div id="paypal-button-container"></div>
    </form>
</main>

<%@include file="footer.jsp" %>

<!-- Include Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- Include PayPal JavaScript SDK for Sandbox -->
<script src="https://www.paypal.com/sdk/js?client-id=<pestid here>&currency=USD&enable-funding=venmo"></script>

<!-- PayPal Smart Payment Buttons Configuration -->
<script>
    paypal.Buttons({
        createOrder: function(data, actions) {
            // Set up the transaction
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: '<%=total%>', // Replace with your JSP variable
                        currency_code: 'USD'
                    }
                }]
            });
        },
        onApprove: function(data, actions) {
            // Capture the funds from the transaction
            return actions.order.capture().then(function(details) {
                // Send details to your server for verification
                alert('Transaction completed by ' + details.payer.name.given_name);
                // You can redirect to a success page or handle further processing here
            });
        }
    }).render('#paypal-button-container');
</script>

</body>
</html>
