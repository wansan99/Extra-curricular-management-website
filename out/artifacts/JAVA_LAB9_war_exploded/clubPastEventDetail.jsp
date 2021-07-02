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
            String cludid = request.getParameter("cid");
            String pasteventid = request.getParameter("peid");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stm = conn.createStatement();
            String data = "select * from pastevent join club on club.id = '" + cludid + "' where pastevent.id = '" + pasteventid + "'";
            ResultSet rs = stm.executeQuery(data);
            while(rs.next())
            {
        %>

        <div id="directory" style="display: flex; margin: 20 0 0 50;">
            <div><a href="club.jsp">Club& Society</a></div>
            <h4> > </h4>
            <div><a href="club.jsp?cid=<%=rs.getString("club.id")%>"><%=rs.getString("club.name")%></a></div>
            <h4> > </h4>
            <div><a href="clubPastEvent.jsp?cid=<%=rs.getString("club.id")%>">Past Event List</a></div>
            <h4> > </h4>
            <div><a href=""><%=rs.getString("pastevent.name")%></a></div>
        </div>

        <div class="articleContent">
            <div class="top">
                <div class="title"><h2><%=rs.getString("pastevent.name")%></h2></div>
                <div class="date"><%=rs.getString("pastevent.date")%></div>
            </div>
            <div class="paragraph">
                <p><%=rs.getString("pastevent.article")%></p>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>

</html>
