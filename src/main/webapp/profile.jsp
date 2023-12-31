        <%--
  Created by IntelliJ IDEA.
  User: pasindu
  Date: 2023-12-29
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.ecom.model.User" %>
<%@ page import="com.ecom.dao.UserDao" %>
        <%@ page import="jakarta.servlet.RequestDispatcher" %>

        <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Profile</title>
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

<%
    System.out.println("Before redirect");
    if (session.getAttribute("userid") == null) {
        System.out.println("Redirecting to login.jsp with userid " + session.getAttribute("userid"));
        response.sendRedirect("/Ecom_war/login.jsp");
        return;
    }
    System.out.println("After redirect " + session.getAttribute("userid"));

%>

<%@ include file="header.jsp" %>

<main class="container mt-5">
  <h2>User Profile</h2>

  <div class="card">
    <div class="card-body">
      <%-- Retrieve user information from the session or database --%>
      <%
          User user = null;
          if (session.getAttribute("userid") != null) {
              UserDao userDao = new UserDao();
              user = userDao.getUserbyUserid((Integer) session.getAttribute("userid"));
          } else {
              System.out.println("redirected to login");
              response.sendRedirect("/Ecom_war/login.jsp");
              return;
          }
      %>

      <h5 class="card-title">Username: <%=user.getUsername()%></h5>
      <h5 class="card-title">Email: <%=user.getEmail()%></h5>

<%--      <h5 class="mt-3">Update Profile</h5>--%>
<%--      <form action="UpdateProfileServlet" method="put">--%>
<%--        <div class="form-group">--%>
<%--          <label for="userName">User Name:</label>--%>
<%--          <input type="text" class="form-control" id="userName" name="userName" value="<%= user.getUsername() %>">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--          <label for="email">Email:</label>--%>
<%--          <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>">--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Update Profile</button>--%>
<%--      </form>--%>

      <div class="mt-3">
        <a href="/Ecom_war/logout" class="btn btn-danger">Logout</a>
      </div>
    </div>
  </div>
</main>

<%@ include file="footer.jsp" %>

<!-- Add Bootstrap JS and Popper.js links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>


