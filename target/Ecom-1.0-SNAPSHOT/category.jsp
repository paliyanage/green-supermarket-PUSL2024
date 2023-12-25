<%@ page import="com.ecom.model.Categories" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: pasindu
  Date: 2023-12-30
  Time: 00:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Categories</title>
  <!-- Add Bootstrap CSS link here -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

<%@ include file="header.jsp" %>


<main class="container mt-5">
  <h2>Product Categories</h2>

  <div class="list-group">
    <%
      List<Categories> categories = (List<Categories>) request.getAttribute("Categories");
      if (categories != null && !categories.isEmpty()) {
        for (Categories category : categories) {
    %>
    <a href="ProductServlet?category=<%= category.getName() %>" class="list-group-item list-group-item-action"><%= category.getName() %></a>
    <%
        }
      }
    %>
  </div>

</main>

<%@ include file="footer.jsp" %>

<!-- Add Bootstrap JS and Popper.js links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

