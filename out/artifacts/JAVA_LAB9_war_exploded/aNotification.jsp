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

        <div class="faqManage">
            <div class="operation">
                <a href="aNotificationCreate.jsp"><button>Add Notification</button></a>
            </div>
            <div class="qnaList">
                <h2 style="margin-bottom: 50px;">Notification List</h2>
                <table id=t01>
                    <tr id=trHeader>
                        <th>Category</th>
                        <th>Subject</th>
                        <th>Content</th>
                        <th>Tag</th>
                        <th>Operation</th>
                    </tr>
                    <%--                    Show faq list --%>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from notification");
                        while(rs.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("subject")%></td>
                        <td><%= rs.getString("description")%></td>
                        <td><%= rs.getString("tag")%></td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">Amend</button>
                                <div class="dropdownContent">
                                    <a href="aNotificationEdit.jsp?nid=<%= rs.getString("id")%>">Edit</a>
                                    <a href="aNotificationDelete.jsp?nid=<%= rs.getString("id")%>">Remove</a>
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
