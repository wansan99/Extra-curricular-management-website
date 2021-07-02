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

<%--        Category--%>
        <div class="csContent">
            <h2>All Club & Society</h2>

<%--            Clubs--%>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    Statement stm = conn.createStatement();
                    ResultSet rs = stm.executeQuery("select * from club");
                    while(rs.next())
                    {
                %>
            <div class="club">
                <div class="up">
                    <h2> <%= rs.getString("name")%> </h2>
                </div>
                <div class="down">
                    <div class="clubCat"> Category: <%= rs.getString("type")%></div>
                    <div class="clubDes"> Description: <%= rs.getString("bio")%></div>
                    <a href="clubProfile.jsp?cid=<%= rs.getString("id")%>"><button name="clubid">Read More</button></a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>

</html>