<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 2:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
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
            Connection connl = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stml = connl.createStatement();
            String data = "select * from event where id ='" + eventid + "'";
            ResultSet rsl = stml.executeQuery(data);
            while(rsl.next())
            {
        %>

        <div id="directory" style="display: flex; margin: 20 0 0 50">
            <div><a href="event.jsp">Upcoming Events</a></div>
            <h4> > </h4>
            <div><a href=""><%=rsl.getString("name")%></a></div>
            <h4> > </h4>
            <div><a href="">Registeration</a></div>
        </div>

        <div class="eDetailContent">
            <%--            eventheading--%>
            <div class="top" class="club">
                <img src="image/event_img1.jpg" style="width:150px">
                <div class="summary">
                    <div><h2><%=rsl.getString("name")%></h2></div>
                    <div><h5>Date: <%=rsl.getString("startDate")%></h5></div>
                    <div><h5>Time: <%=rsl.getString("startTime")%></h5></div>
                    <div><h5>Organizer: <%=rsl.getString("clubId")%></h5></div>
                </div>
            </div>
            <%--            eventmanager--%>
                <div class="csDetailContent">
                    <div class="club">
                        <div class="operation">
                            <a href="eventDetail.jsp?eid=<%=rsl.getString("id")%>"><button style="border-right: none;">About</button></a>
                            <a href="eventJoinPage.jsp?eid=<%=rsl.getString("id")%>"><button style="border-right: none;">Register</button></a>
                            <a href="eventAddToWishlist.jsp?eid=<%=rsl.getString("id")%>"><button style="border-right: none;">Add to wishlist</button></a>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            <%--             eventdetails--%>
                <div>
                    <div class="eRegisterContent">
                        <h2 style="margin-bottom: 10px;">Registration Form</h2>
                        <form method="post">
                        <div class="fillInItem">Name:</b></div> <input class="inputbox" type="text" name="name"/>
                        <div class="fillInItem">Student ID:</div> <input class="inputbox" type="text" name="studentid"/>
                        <div class="fillInItem">Today Date:</div> <input class="inputbox" type="text" name="date"/>
                        <div style="float: right"> <input class="submit" type="submit"> </div>
                        <button style="float: right;" onclick="showHide()">Cancel</button>
                        </form>
                    </div>
                </div>
        </div>
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
    java.sql.PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");

    String a = request.getParameter("eid");
    String b = request.getParameter("studentid");
    String c = request.getParameter("date");

    if(a!=null && b!=null && c!=null){
        String query = "insert eventparticipants (eventid,studentid,joinDate) values (?,?,?)";
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
        response.sendRedirect("dashboardMyEvent.jsp");
    }
//    else
//        response.sendRedirect("eventJoinPage.jsp?eid=" + eventid + "");
%>