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

        <div class="eventContent">
            <h2 style="margin-bottom: 15px;">All Upcoming Events</h2>
            <div class="photos">
                <img src="image/event_img1.jpg" alt="X-Concert" style="width: 300px;">
                <img src="image/event_img2.jpg" alt="Global Village" style="width: 300px;">
                <img src="image/event_img3.jpg" alt="Volleyball Competition" style="width: 300px;">
            </div>
            <%--            Clubs--%>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                Statement stm1 = conn1.createStatement();
                ResultSet rs1 = stm1.executeQuery("select * from event");
                while(rs1.next())
                {
            %>
            <div class="eventList">
                <div class="event">
                    <div class="eName"><h2><%= rs1.getString("name")%></h2></div>
                    <div class="eDateTime"><h5><%= rs1.getString("startDate")%>, <%= rs1.getString("startTime")%></h5></div>
                    <div class="eDescription"><%= rs1.getString("description")%></div>
                    <a href="eventDetail.jsp?eid=<%= rs1.getString("id")%>"><button class="button">Read More</button></a>
                    <a href="eventJoinPage.jsp?eid=<%= rs1.getString("id")%>"><button class="button">Register Now</button></a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>

</html>