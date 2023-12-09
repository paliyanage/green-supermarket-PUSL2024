<%--
  Created by IntelliJ IDEA.
  User: rohan
  Date: 2023-12-30
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Add your custom styling or links to external stylesheets here -->
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .error-container {
            text-align: center;
            flex: 1;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container error-container">
    <h1 class="display-1">Oops!</h1>
    <p class="lead">Something went wrong.</p>
    <p class="lead">The page you are looking for does not exist.</p>
    <!-- Add any additional content or links here -->
    <a class="btn btn-primary" href="index.jsp">Go to Home</a>
</div>

<%@ include file="footer.jsp" %>

<!-- Add Bootstrap JS and Popper.js links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

