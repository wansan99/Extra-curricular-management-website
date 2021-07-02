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

        <div class="adminDashboard">
            <div class="eventManage">
                <h2 style="color: #123456; margin-bottom: 10px;">Event Management</h2>
                <div><a href="aEvent.jsp">View all upcoming events</a></div>
                <div><a href="aEventCreate.jsp">Register new event</a></div>
            </div>
            <div class="clubManage">
                <h2 style="color: #123456; margin-bottom: 10px;">Club Management</h2>
                <div><a href="aClub.jsp">View all clubs</a></div>
                <div><a href="aClubCreate.jsp">Register new club</a></div>
            </div>
            <div class="faqManage">
                <h2 style="color: #123456; margin-bottom: 10px;">FAQ</h2>
                <div>
                    <a href="aFAQ.jsp">Edit FAQ</a>
                </div>
            </div>
            <div class="faqManage">
                <h2 style="color: #123456; margin-bottom: 10px;">Notification</h2>
                <div>
                    <a href="aNotificationCreate.jsp">Edit Notification</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>
</html>
