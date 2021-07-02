<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 2:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
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

        <%--        directory guide--%>
        <div style="display: flex;  margin: 20 0 0 50">
            <div id="directory"><a href="dashboard.jsp">Dashboard</a></div>
            <h4> > My Notification</h4>
        </div>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select * from notification where tag = 'ALL' || tag = 'SWE'");
            while(rs.next())
            {
        %>
        <%--        notificationcontent--%>
        <div class="myClubContent">
            <div class="clubList">
                <div class="club">
                    <div style="display: flex;">
                        <div class="detail">
                            <div><h2><%= rs.getString("subject")%></h2></div>
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
</div>

<%@ include file="sJavaScript.jsp"%>>
</body>

</html>
