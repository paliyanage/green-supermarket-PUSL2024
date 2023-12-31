<%--
  Created by IntelliJ IDEA.
  User: pasindu
  Date: 2023-12-31
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<html>
<head>
  <title>User Registration</title>
  <!-- Add Bootstrap CSS link here -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Add your custom styling or links to external stylesheets here -->
  <style>
    /* Add your custom styling for the registration form here */
    .registration-container {
      margin-top: 20px;
    }

    .form-container {
      max-width: 400px;
      margin: auto;
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

<main class="container registration-container">
  <h2 class="mt-4">User Registration</h2>

  <div class="form-container">
    <form action="RegisterServlet" method="post">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" class="form-control" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>
      <div class="form-group">
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
      </div>
      <button type="submit" class="btn btn-primary">Register</button>
    </form>
  </div>
</main>

<%@ include file="footer.jsp" %>

<!-- Add Bootstrap JS and Popper.js links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

