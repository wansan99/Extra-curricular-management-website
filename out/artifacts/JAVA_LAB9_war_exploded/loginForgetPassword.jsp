<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 1:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String result;
    final String email = request.getParameter("email");
    String host = "smtp.gmail.com";
%>
<html>
<head>
    <title>Forgot Password | X-Life</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body class="forgotPw">
<div class="forgotPwContainer">
    <form action="loginMailProcess.jsp">
        <h2 style="margin-bottom:50px">Forgot your password?</h2>
        <p>Don't worry. Resetting your password is easy. Just tell us your campus studentid. </p>
        <input type="text" name="id" placeholder="Enter your studentid.">
    </form>
    <%
        String a = request.getParameter("id");
    %>
    <a href="loginNewpassword.jsp?sid='" + a +"'"><button>Send</button></a><br>
    <a href="index.jsp"> < Back to login </a>
</div>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
</body>
</html>
