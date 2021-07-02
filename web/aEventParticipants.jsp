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

        <div class="adminUM">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                Statement stm = conn.createStatement();
                String eid=request.getParameter("eid");
                int no = Integer.parseInt(eid);
                ResultSet rs = stm.executeQuery("select * from event where event.id ='" + no + "'");
                while(rs.next())
                {
            %>
            <div class="userList">
                <h3 style="margin-bottom: 50px;">Participants from : <%= rs.getString("name")%></h3>
            <%
                }
            %>
                <table id=t01>
                    <tr id=trHeader>
                        <th>No</th>
                        <th>Student ID</th>
                        <th>Join Date</th>
                        <th>Operation</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection connf = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stmf = conn.createStatement();
                        ResultSet rsf = stm.executeQuery("select * from eventparticipants where eventid='" + no + "'");
                        while(rsf.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rsf.getString("id")%></td>
                        <td><%= rsf.getString("studentid")%></td>
                        <td><%= rsf.getString("joinDate")%></td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">Do something...</button>
                                <div class="dropdownContent">
                                    <a href="aEventParticipantsDelete.jsp?pid=<%= rsf.getString("id")%>&eid=<%= rsf.getString("eventid")%>">Delete participants</a>
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
