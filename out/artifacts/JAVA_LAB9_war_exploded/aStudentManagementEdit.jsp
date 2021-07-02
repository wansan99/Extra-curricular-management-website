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
            <h4> > Change Password</h4>
        </div>

        <%--add Student--%>
        <div class="faqAdd">
            <form  method="post">
                    <%
                    String host =  "jdbc:mysql://localhost:3306/xlife";
                    Connection conn = null;
                    Statement stat = null;
                    ResultSet rs = null;
                    PreparedStatement stmt = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    stat = conn.createStatement();
                    String sid = request.getParameter("sid");
                    int id = Integer.parseInt(sid);
                    String data = "select * from studentlogin where id ='" + id + "'";
                    rs = stat.executeQuery(data);
                    while(rs.next())
                    {
                %>
                <h2 style="margin-bottom: 20px;">Add new FAQ</h2>
                <div class="fillInItem">Login ID: <%= rs.getString("id")%><br></div>
                <div class="fillInItem">Student ID: <%= rs.getString("username")%><br></div>

                <div class="fillInItem">Password</div>
                    <input class="inputbox" type="text" name="password" value="<%= rs.getString("password")%>">
                <div style="float:right" ">
                <button class="button" style="float: right;" type="submit">Change Password</button>
        </div>
        <%
            }
        %>
        </form>
        <a href="aStudentManagement.jsp"><button class="button" style="float: right;" >Back</button></a>
    </div>
</div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>
</html>

    <%
    String a = request.getParameter("sid");
    String b = request.getParameter("password");

    if(a!=null && b!=null){
        String query = "update studentlogin set password=? where id ='"+ a + "'";
        stmt = conn.prepareStatement(query);
        assert stmt != null;
        stmt.setString(1,b);
        stmt.executeUpdate();
        stmt.close();
        response.sendRedirect("aStudentManagement.jsp");
    }
%>

