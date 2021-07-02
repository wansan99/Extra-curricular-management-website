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

        <div class="adminEvent">
            <div class="operation">
                <a href="aEventCreate.jsp"><button>Add Event</button></a>
            </div>
            <div class="eventList">
                <h2 style="margin-bottom: 50px;">All Events</h2>
                <table id=t01>
                    <tr id=trHeader>
                        <th>Event id</th>
                        <th>Event Name</th>
                        <th>Date</th>
                        <th>Venue</th>
                        <th>Organizing club</th>
                        <th>Description</th>
                        <th>Operation</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from event");
                        while(rs.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("startDate")%></td>
                        <td><%= rs.getString("venue")%></td>
                        <td><%= rs.getString("clubId")%></td>
                        <td><%= rs.getString("description")%></td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">Do something...</button>
                                <div class="dropdownContent">
                                    <a href="aEventEdit.jsp?eid=<%= rs.getString("id")%>">Edit Event</a>
                                    <a href="aEventParticipants.jsp?eid=<%= rs.getString("id")%>">Notify participants</a>
                                    <a href="aEventDelete.jsp?eid=<%= rs.getString("id")%>">Delete event</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>

    </div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>

</html>