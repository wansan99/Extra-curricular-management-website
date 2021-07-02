<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 3:02 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sLogin.jsp"%>

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
            <div id="directory"><a href="aNotification.jsp">Notification</a></div>
            <h4> > Add Notification</h4>
        </div>

        <%--add FAQ--%>
        <div class="faqAdd">
            <form id="faq"  method="post">
                <h2 style="margin-bottom: 20px;">Add new Notification</h2>
                <div class="fillInItem">Subject:<br></div>
                <input class="inputbox" type="text" name="subject">
                <div class="fillInItem">Content:<br></div>
                <input class="inputbox" type="text" name="content">
                <div class="fillInItem">Tag</div>
                <input class="inputbox" type="text" name="tag">
                <input class="button" type="submit" value="Submit">
        </div>
        <a href="aFAQ.jsp"><button class="button" style="float: right;" >Back</button></a>
        </form>
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
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");

    String a = request.getParameter("subject");
    String b = request.getParameter("content");
    String c = request.getParameter("tag");

    if(a!=null && b!=null){
        String query = "insert notification (subject,description,tag) values (?,?,?)";
        try {
            stmt = conn.prepareStatement(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            assert stmt != null;
            stmt.setString(1,a);
            stmt.setString(2,b);
            stmt.setString(3,c);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("aNotification.jsp");
    }
%>
