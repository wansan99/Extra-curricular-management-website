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
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stmn = connn.createStatement();
            String cid=request.getParameter("cid");
            int no = Integer.parseInt(cid);
            ResultSet rsn = stmn.executeQuery("select * from club where id ='" + no + "'");
            while(rsn.next())
            {
        %>
        <div style="display: flex; margin: 20 0 0 50;">
            <h3 style="margin-bottom: 50px;">Clubs from : <%= rsn.getString("name")%></h3>
            <h4> > Create New Event Article</h4>
        </div>
        <%
            }
        %>
        <%--        create new event article--%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conna = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stma = conna.createStatement();
            String aid=request.getParameter("aid");
            int non = Integer.parseInt(aid);
            ResultSet rsa = stma.executeQuery("select * from pastevent where id ='" + non + "'");
            while(rsa.next())
            {
        %>
        <div class="clubEdit">
            <form action="" method="post">
                <h2 style="margin-bottom: 20px;">Add new Event Article</h2>
                <h3 style="margin-bottom: 20px;">Event article ID :<%= rsa.getString("id")%> </h3>
                <div class="fillInItem">
                    <label>Event Name:</label>
                    <input class="inputbox" type="text" name="name" value="<%= rsa.getString("name")%>"/>
                </div>
                <div class="fillInItem">
                    <label>Event Date: (format: YYYY-MM-DD)</label>
                    <input class="inputbox" type="text" name="date" value="<%= rsa.getString("date")%>"/>
                </div>
                <div class="fillInItem">
                    <label>Event Article</label>
                    <input class="inputbox" type="text" name="article" value="<%= rsa.getString("article")%>"/>
                </div>
                <button class="button" type="submit" style="float: right;">Submit</button>
        </div>
        </form>
        <a href="aClub.jsp"><button class="button" style="float: right;">Back</button></a>
    </div>
    <%
        }
    %>
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

    String a = request.getParameter("name");
    String b = request.getParameter("aid");
    String c = request.getParameter("date");
    String d = request.getParameter("article");

    if(a!=null && b!=null && c!=null && d!=null){
        String query = "update pastevent set name=?,date=? ,article=? where  id ='"+ b + "' ";
        try {
            stmt = conn.prepareStatement(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            assert stmt != null;
            stmt.setString(1,a);
            stmt.setString(2,c);
            stmt.setString(3,d);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("aEventMileStone.jsp?cid=" + cid + "");
    }
%>