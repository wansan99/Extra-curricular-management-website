<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 1:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<h1>New password</h1>
<p>Please enter the new password at least 8 character, one upper case letter and one number. </p>
<input type="password" name="" placeholder="New Password">
<input type="password" name="" placeholder="Confirm new password">
<button>change</button>
<a><back to login page</a>
</body>
</html>
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
    <title>New Password| X-Life</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body class="forgotPw">
<div class="forgotPwContainer">
    <form action="loginMailProcess.jsp">
        <h2 style="margin-bottom:50px">New password</h2>
        <p>Please enter the new password at least 8 character, one upper case letter and one number.  </p>
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