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
            <div id="directory"><a href="aFAQ.jsp">FAQ</a></div>
            <h4> > Edit Q&A</h4>
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
                    String fid = request.getParameter("fid");
                    int id = Integer.parseInt(fid);
                    String data = "select * from faq where id ='" + id + "'";
                    rs = stat.executeQuery(data);
                    while(rs.next())
                    {
                %>
                <h2 style="margin-bottom: 20px;">Edit FAQ</h2>
                <div class="fillInItem">Id: <%= rs.getString("id")%><br></div>
                <div class="fillInItem">Question:<br>
                    <input class="inputbox" type="text" name="question" value="<%= rs.getString("faqQuestion")%>">
                </div>
                <div class="fillInItem">Answer:<br>
                    <textarea class="inputbox" type="text" name="answer" value="<%= rs.getString("faqAnswer")%>"><%= rs.getString("faqAnswer")%></textarea>
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
    String a = request.getParameter("fid");
    String b = request.getParameter("question");
    String c = request.getParameter("answer");

    if(a!=null && b!=null && c!=null ){
        String query = "update faq set faqQuestion=?, faqAnswer=? where id ='"+ a + "'";
        stmt = conn.prepareStatement(query);
        assert stmt != null;
        stmt.setString(1,b);
        stmt.setString(2,c);
        stmt.executeUpdate();
        stmt.close();
        response.sendRedirect("aFAQ.jsp");
    }
%>

