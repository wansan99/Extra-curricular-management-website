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
            <div class="operation">
                <a href="aStudentManagementCreate.jsp"><button>Add User</button></a>
            </div>
            <div class="userList">
                <h2 style="margin-bottom: 50px;">All users</h2>

                <table id=t01>
                    <tr id=trHeader>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Password</th>
                        <th>Profile</th>
                        <th>Operation</th>
                    </tr>
                      <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from studentlogin");
                        while(rs.next())
                        {
                      %>
                    <tr id="trRow">
                    <td><%= rs.getString("username")%></td>
                    <td><%= rs.getString("id")%></td>
                    <td><%= rs.getString("password")%></td>
                    <td>
                        <div class="dropdown">
                            <button class="dropbtn">Profile</button>
                            <div class="dropdownContent">
                                <a href="aStudentProfile.jsp?sid=<%= rs.getString("id")%>">Edit</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <button class="dropbtn">Amend</button>
                            <div class="dropdownContent">
                                <a href="aStudentManagementEdit.jsp?sid=<%= rs.getString("id")%>">Edit</a>
                                <a href="aStudentManagementDelete.jsp?sid=<%= rs.getString("id")%>">Remove</a>
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