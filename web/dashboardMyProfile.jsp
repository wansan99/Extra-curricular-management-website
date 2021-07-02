<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 2:05 AM
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
    <title>Dashboard | X-Life</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
<div class="wrapper">
    <%@ include file="sStudentSidebar.jsp"%>

    <div class="mainContent" id="main">
        <%@ include file="sStudentHeader.jsp"%>

        <div style="display: flex; margin: 20 0 0 50;">
            <div id="directory"><a href="dashboard.jsp">Dashboard</a></div>
            <h4> > My Info</h4>
        </div>
        <%
            String studentid= (String) session.getAttribute("username");
            int stid = Integer.parseInt(studentid);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select * from studentprofile where studentid = '"+stid+"'");
            while(rs.next())
            {
        %>
        <div class="myinfoContent">
            <div class="infoContainer">
<%--                <div class="displayPicture">--%>
<%--                    <img src="image/dp.jpg">--%>
<%--                </div>--%>
                <div class="displayText">
                    <div class="left">
                        <p>Name:</p>
                        <p>Student ID:</p>
                        <p>Gender:</p>
                        <p>Programme:</p>
                        <p>Nationality:</p>
                        <p>Contact Number:</p>
                        <p>Email:</p>
                    </div>
                    <div class="right">
                        <p><%= rs.getString("name")%></p>
                        <p><%= rs.getString("studentid")%></p>
                        <p><%= rs.getString("gender")%></p>
                        <p><%= rs.getString("programme")%></p>
                        <p><%= rs.getString("nationalityl")%></p>
                        <p><%= rs.getString("contact")%></p>
                        <p><%= rs.getString("emailaddress")%></p>
                    </div>
                </div>
            </div>
            <a href="dashboardMyProfileEdit.jsp?sid=<%= rs.getString("studentid")%>.jsp"><button>Change Info</button></a>
        </div>
        <%
            }
        %>
    </div>
</div>

<!--script for icon dropdown list-->
<%@include file="sJavaScript.jsp"%>>
</body>

</html>