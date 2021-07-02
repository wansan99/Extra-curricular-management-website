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
<%--guidebar--%>
        <div style="display: flex;  margin: 20 0 0 50">
            <div id="directory"><a href="dashboard.jsp">Dashboard</a></div>
            <h4> > My Registered Event</h4>
        </div>

        <%
            String studentid= (String) session.getAttribute("username");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select eventparticipants.joinDate, event.name, event.id, event.description, event.startDate, event.startTime" +
                    " from eventparticipants join event on event.id = eventparticipants.eventid where eventparticipants.studentid = '"+studentid+"'");
            while(rs.next())
            {
        %>
        <%--      myeventcontent--%>
        <div class="myeventContent">
            <div class="eventList">
                <div class="event">
                    <div style="display: flex;">
                        <div><img style="width: 200px;margin: 0 30 0 0;"src="image/event_img1.jpg"></div>
                        <div>
                            <div class="eName"><h2><%= rs.getString("event.name")%></h2></div>
                            <div class="eDateTime"><h4><%= rs.getString("event.startDate")%>, <%= rs.getString("event.startTime")%></h4></div>
                            <div class="eDescription"><%= rs.getString("event.description")%></div>
                            <div class="eDateTime"><h6>Joined at <%= rs.getString("eventparticipants.joinDate")%></h6></div>
                        </div>
                    </div>
                    <a href="eventDetail.jsp?eid=<%= rs.getString("event.id")%>"><button class="readMore">Know my event More</button></a>
                </div>
            </div>
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