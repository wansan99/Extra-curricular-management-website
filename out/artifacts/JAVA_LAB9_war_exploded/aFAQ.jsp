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
                <a href="aFAQCreate.jsp"><button>Add Q&A</button></a>
            </div>
            <div class="qnaList">
                <h2 style="margin-bottom: 50px;">Frequently Asked Question List</h2>
                <table id=t01>
                    <tr id=trHeader>
                        <th>Category</th>
                        <th>Question</th>
                        <th>Answer</th>
                        <th>Operation</th>
                    </tr>
<%--                    Show faq list --%>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from faq");
                        while(rs.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("faqQuestion")%></td>
                        <td><%= rs.getString("faqAnswer")%></td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">Amend</button>
                                <div class="dropdownContent">
                                    <a href="aFAQEdit.jsp?fid=<%= rs.getString("id")%>">Edit</a>
                                    <a href="aFAQDelete.jsp?fid=<%= rs.getString("id")%>">Remove</a>
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
