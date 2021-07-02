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

  <script type="text/javascript">
    function validate()
    {
      var a = document.getElementById("a");
      var b = document.getElementById("b");
      var c = document.getElementById("a").value;
      var d = document.getElementById("b").value;
      var valid = true;
      if(a.value.length<=0 || b.value.length<=0)
      {
        alert("Don't leave the field empty!");
        valid = false;
      }
      // else{
      //   if(isNaN(c) || isNaN(d)){
      //     alert("Enter a number");
      //     valid = false;}
      // }
      return valid;
    };
  </script>
</head>

<body class="loginPage">

  <div class="brand">
    <img src="image/xlife.jpg" class="logo">
    <div class="slogan">Proudly made for XMUM Students</div>
  </div>

  <div class="loginbox">
    <form id="lg" action="StudentLoginServlet" method="post">
      <label >User ID</label>
      <input type="text" name="username" placeholder="Enter user ID" id="a">
      <span class="error">${errors.origin}</span>
      <p>Password</p>
      <input type="password" name="password" placeholder="Enter password" id="b"><br>
      <div onclick="document.getElementById('lg').submit();">
        <input type="submit" name="" value="Login">
      </div>
      <a href="loginForgetPassword.jsp">Forgot your password?</a> <br>
      <a href="aLogin.jsp">Admin Login</a> <br>
    </form>
  </div>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
</body>
<script type="text/javascript">

  $(document).ready(function() {
    $("#loginForm").validate({a
      rules: {
        email: {
          required: true,
          email: true
        },

        password: "required",
      },

      messages: {
        email: {
          required: "Please enter email",
          email: "Please enter a valid email address"
        },

        password: "Please enter password"
      }
    });

  });
</script>
</html>