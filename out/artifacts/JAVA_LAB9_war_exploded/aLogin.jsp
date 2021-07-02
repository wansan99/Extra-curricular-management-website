<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 1:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login | X-Life</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body class="loginPage">
<div class="brand">
    <img src="image/xlife.jpg" class="logo">
    <div class="slogan">Proudly made for XMUM Students</div>
</div>
<div class="loginbox">
    <form id="lg" action="AdminLoginServlet" method="post">
        <p>User ID</p>
        <input type="text" name="username" placeholder="Enter user ID">
        <p>Password</p>
        <input type="password" name="password" placeholder="Enter password"><br>
        <div onclick="document.getElementById('lg').submit();">
            <input type="submit" name="" value="Login">
        </div>
        <a href="loginForgetPassword.jsp">Forgot your password?</a> <br>
        <a href="aLogin.jsp">Back to student Login</a> <br>

    </form>
</div>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
</body>
</html>