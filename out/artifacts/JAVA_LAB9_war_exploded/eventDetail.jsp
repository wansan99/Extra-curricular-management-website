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
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String eventid = request.getParameter("eid");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stm = conn.createStatement();
            String data = "select * from event join club on event.clubID= club.id where event.id ='" + eventid + "'";
            ResultSet rs = stm.executeQuery(data);
            while(rs.next())
            {
        %>
<%--guidebar--%>
        <div id="directory" style="display: flex; margin: 20 0 0 50">
            <div><a href="event.jsp">Upcoming Events</a></div>
            <h4> > </h4>
            <div><a href=""><%=rs.getString("name")%></a></div>
            <h4> > </h4>
            <div><a href="">About</a></div>
        </div>

        <div class="eDetailContent">
<%--            eventheading--%>
            <div class="top" class="club">
                <div class="summary">
                    <div><h2><%=rs.getString("name")%></h2></div>
                    <div><h5>Date: <%=rs.getString("startDate")%></h5></div>
                    <div><h5>Time: <%=rs.getString("startTime")%></h5></div>
                    <div><h5>Organizer: <%=rs.getString("club.name")%></h5></div>
                </div>
            </div>

<%--            eventmanager--%>
            <div class="csDetailContent">
                <div class="club">
                    <div class="operation">
                        <a href="eventDetail.jsp?eid=<%=rs.getString("id")%>"><button style="border-right: none;">About</button></a>
                        <a href="eventJoinPage.jsp?eid=<%=rs.getString("id")%>"><button style="border-right: none;">Register</button></a>
                        <a href="eventAddToWishlist.jsp?eid=<%=rs.getString("id")%>"><button style="border-right: none;">Add to wishlist</button></a>
                    </div>

    <%--             eventdetails--%>
                    <div class="detail">
                        <div><h2>Description</h2></div>
                        <div><%=rs.getString("description")%></div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <%
        }
    %>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>
</html>