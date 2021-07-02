<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 3:02 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sLogin.jsp"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>Edit Club Info | X-Life: Admin</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<html>
<head>
    <meta charset="UTF-8">
    <title>Club&Society | X-Life: Admin</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="wrapper">
    <%@include file="sAdminSidebar.jsp"%>

    <div class="mainContent" id="main">
        <%@include file="sAdminHeader.jsp"%>

        <div style="display: flex; margin: 20 0 0 50;">
            <div id="directory"><a href="aStudentManagement.jsp">Student Log</a></div>
            <h4> > Add student</h4>
        </div>

        <%--add Student--%>
        <div class="faqAdd">
            <form  method="post">

                <h2 style="margin-bottom: 20px;">Add New Student</h2>

                <div class="fillInItem">Login ID:<br>
                    <input class="inputbox" type="text" name="id" >
                </div>

                <div class="fillInItem">Student ID:
                    <input class="inputbox" type="text" name="studentid" >
                </div>

                <div class="fillInItem">Password
                    <input class="inputbox" type="text" name="password" value=""">
                </div>
                <button class="button" style="float: right;" type="submit">Add Student User</button>
        </div>
        </form>
        <a href="aStudentManagement.jsp"><button class="button" style="float: right;" >Back</button></a>
    </div>
</div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>
</html>

    <%
    String host =  "jdbc:mysql://localhost:3306/xlife";
    Connection conn = null;
    Statement stat = null;
    ResultSet rs = null;
    PreparedStatement stmt = null;
    PreparedStatement stmt1 = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");

    String a = request.getParameter("id");
    String b = request.getParameter("studentid");
    String c = request.getParameter("password");


    if(a!=null && b!=null && c!=null){
        String query = "insert studentlogin (id,username,password) values (?,?,?)";
        stmt = conn.prepareStatement(query);
        assert stmt != null;
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.executeUpdate();
        stmt.close();

        String query1 = "insert studentprofile (userid,studentid) values (?,?)";
        stmt1 = conn.prepareStatement(query1);
        assert stmt1 != null;
        stmt1.setString(1,a);
        stmt1.setString(2,b);
        stmt1.executeUpdate();
        stmt1.close();
        response.sendRedirect("aStudentManagement.jsp");
    }
%>

