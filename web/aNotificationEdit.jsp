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
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sLogin.jsp"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>Edit Club Info | X-Life: Admin</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

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

        <div style="display: flex; margin: 20 0 0 50;">
            <div id="directory"><a href="aNotification.jsp">Notification</a></div>
            <h4> > Edit Notification</h4>
        </div>

        <%--add FAQ--%>
        <div class="faqAdd">
            <form  method="post">
                    <%
                    String host =  "jdbc:mysql://localhost:3306/xlife";
                    Connection conn = null;
                    Statement stat = null;
                    ResultSet rs = null;
                    PreparedStatement stmt = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    stat = conn.createStatement();
                    String nid = request.getParameter("nid");
                    int id = Integer.parseInt(nid);
                    String data = "select * from notification where id ='" + id + "'";
                    rs = stat.executeQuery(data);
                    while(rs.next())
                    {
                %>
                <h2 style="margin-bottom: 20px;">Edit FAQ</h2>
                <div class="fillInItem">Notification Id: <%= rs.getString("id")%><br></div>
                <div class="fillInItem">Subject:<br>
                    <input class="inputbox" type="text" name="subject" value="<%= rs.getString("subject")%>">
                </div>
                <div class="fillInItem">Content:<br>
                    <textarea class="inputbox" type="text" name="content"><%= rs.getString("description")%></textarea>
                </div>
                <div class="fillInItem">Tag:<br>
                    <input class="inputbox" type="text" name="tag" value="<%= rs.getString("tag")%>">
                </div>
                <button class="button" style="float: right;" type="submit">Update</button>
                <%
                    }
                %>
            </form>
        </div>
        <a href="aFAQ.jsp"><button class="button" style="float: right;" >Back</button></a>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>
</html>

    <%
    String a = request.getParameter("nid");
    String b = request.getParameter("subject");
    String c = request.getParameter("content");
    String d = request.getParameter("tag");

    if(a!=null && b!=null && c!=null ){
        String query = "update notification set subject=?, description=?,tag=? where id ='"+ a + "'";
        stmt = conn.prepareStatement(query);
        assert stmt != null;
        stmt.setString(1,b);
        stmt.setString(2,c);
        stmt.setString(3,d);
        stmt.executeUpdate();
        stmt.close();
        response.sendRedirect("aNotification.jsp");
    }
%>

