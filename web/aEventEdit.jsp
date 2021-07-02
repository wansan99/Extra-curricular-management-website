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
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sLogin.jsp"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>Edit Club Info | X-Life: Admin</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
<div class="wrapper">
    <%@include file="sAdminSidebar.jsp"%>

    <div class="mainContent" id="main">
        <%@include file="sAdminHeader.jsp"%>

        <div style="display: flex; margin: 20 0 0 50;">
            <div id="directory"><a href="aClub.jsp">Event</a></div>
            <h4> > Edit event info</h4>
            <%--            customize club name--%>
        </div>
        <div class="clubEdit">
            <form action="" method="post">
                <%
                    String host =  "jdbc:mysql://localhost:3306/xlife";
                    Connection conn = null;
                    Statement stat = null;
                    ResultSet rs = null;
                    PreparedStatement stmt = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    stat = conn.createStatement();
                    String eid = request.getParameter("eid");
                    int id = Integer.parseInt(eid);
                    String data = "select * from event where id ='" + id + "'";
                    rs = stat.executeQuery(data);
                    while(rs.next())
                    {
                %>
                <h2 style="margin-bottom: 20px;">Edit event information</h2>
                <div class="fillInItem">
                    <label>Event ID:</label>
                    <input class="inputbox" type="text" name="id" value="<%= rs.getString("id")%>"/>
                </div>
                <div class="fillInItem">
                    <label>Event Name:</label>
                    <input class="inputbox" type="text" name="eventName" value="<%= rs.getString("name")%>" />
                </div>
                <div class="fillInItem">
                    <label>Event Date: (format: YYYY-MM-DD)</label>
                    <input class="inputbox" type="text" name="eventDate" value="<%= rs.getString("startDate")%>"/>
                </div>
                <div class="fillInItem">
                    <label>Event Venue:</label>
                    <input class="inputbox" type="text" name="eventvenue" value="<%= rs.getString("venue")%>"/>
                </div>

                <div class="fillInItem">
                    Category:
                    <select name="organizer">
                        <option><%= rs.getString("clubId")%></option>
                    </select>
                </div>

                <div class="fillInItem">
                    <label>Event Description:</label>
                    <textarea class="inputbox" type="text" name="eventBio" value="<%= rs.getString("description")%>"><%= rs.getString("description")%></textarea>
                </div>
                <div style="float:right">
                    <button class="button" type="submit" style="float: right;">Submit</button>
                </div>
                <%
                    }
                %>
            </form>
            <a href="aClub.jsp"><button class="button" style="float: right;">Back</button></a>
        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>
</body>
</html>

<%
    String a = request.getParameter("id");
    String b = request.getParameter("eventName");
    String c = request.getParameter("eventDate");
    String d = request.getParameter("eventvenue");
    String e = request.getParameter("organizer");
    String f = request.getParameter("eventBio");

    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
        String query = "update event set name=?,startDate=?,venue=?,clubId=?,description=? where  id ='"+ a + "'";
        try {
            stmt = conn.prepareStatement(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            assert stmt != null;
            stmt.setString(1,b);
            stmt.setString(2,c);
            stmt.setString(3,d);
            stmt.setString(4,e);
            stmt.setString(5,f);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("aEvent.jsp");
    }
%>
