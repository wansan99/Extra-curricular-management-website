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
        <%--guidebar--%>
        <div style="display: flex; margin: 20 0 0 50;">
            <div id="directory"><a href="aEvent.jsp">Event</a></div>
            <h4> > Create New Event</h4>
        </div>
<%--        create new event--%>
        <div class="clubEdit">
            <form action="" method="post">
                <h2 style="margin-bottom: 20px;">Add new Event</h2>
                <div class="fillInItem">
                    <label>Event ID:</label>
                    <input class="inputbox" type="text" name="id"/>
                </div>
                <div class="fillInItem">
                    <label>Event Name:</label>
                    <input class="inputbox" type="text" name="eventName"/>
                </div>
                <div class="fillInItem">
                    <label>Event Date: (format: YYYY-MM-DD)</label>
                    <input class="inputbox" type="text" name="eventDate"/>
                </div>
                <div class="fillInItem">
                    <label>Event Venue:</label>
                    <input class="inputbox" type="text" name="eventvenue"/>
                </div>

                <div class="fillInItem">
                    Category:
                    <select name="organizer">
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conno = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                            Statement stmo = conno.createStatement();
                            ResultSet rso = stmo.executeQuery("select * from club");
                            while(rso.next())
                            {
                        %>
                        <option><%= rso.getString("id")%></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="fillInItem">
                    <label>Event Description:</label>
                    <input class="inputbox" type="text" name="eventBio" />
                </div>
<%--                <div class="fillInItem">Display Photo (150px*150px preferred):--%>
<%--                    <input class="fileUpload" type="file" name="image"/>--%>
<%--                </div> --%>
                <div style="float:right">
                    <button class="button" type="submit" style="float: right;">Submit</button>
                </div>
            </form>
            <a href="aClub.jsp"><button class="button" style="float: right;">Back</button></a>
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

    String a = request.getParameter("id");
    String b = request.getParameter("eventName");
    String c = request.getParameter("eventDate");
    String d = request.getParameter("eventvenue");
    String e = request.getParameter("organizer");
    String f = request.getParameter("eventBio");

    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
        String query = "insert event (id,name,startDate,venue,clubId,description) values (?,?,?,?,?,?)";
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
            stmt.setString(4,d);
            stmt.setString(5,e);
            stmt.setString(6,f);
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
