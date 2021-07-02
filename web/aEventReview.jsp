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
            <div class="eventList">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    Statement stm = conn.createStatement();
                    String cid=request.getParameter("cid");
                    int no = Integer.parseInt(cid);
                    ResultSet rs = stm.executeQuery("select * from club where id ='" + no + "'");
                    while(rs.next())
                    {
                %>
                <h3 style="margin-bottom: 50px;">Participants from : <%= rs.getString("name")%></h3>
                <%
                    }
                %>
                <h2 style="margin-bottom: 50px;">All upcoming event</h2>
                <table id=t01>
                    <tr id=trHeader>
                        <th>Event id</th>
                        <th>Event Name</th>
                        <th>Date</th>
                        <th>Rating</th>
                        <th>Article</th>
                        <th>Operation</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection connf = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stmf = conn.createStatement();
                        String ccid=request.getParameter("cid");
                        int No = Integer.parseInt(ccid);
                        ResultSet rsf = stm.executeQuery("select * from event where clubID ='" + No + "'");
                        while(rsf.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rsf.getString("id")%></td>
                        <td><%= rsf.getString("name")%></td>
                        <td><%= rsf.getString("startDate")%></td>
                        <td><%= rsf.getString("rating")%></td>
                        <td><%= rsf.getString("article")%></td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">Do something...</button>
                                <div class="dropdownContent">
                                    <a href="aEventMileStoneCreate.jsp?eid=<%= rsf.getString("id")%>">Add article</a>
                                    <a href="aEventMileStoneEdit.jsp?eid=<%= rsf.getString("id")%>">Edit article</a>
                                    <a href="aEventReview.jsp?eid=<%= rsf.getString("id")%>">Review the comments</a>
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
