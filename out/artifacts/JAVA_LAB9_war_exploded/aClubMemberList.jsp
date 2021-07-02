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
                <div style="display: flex; margin: 20 0 0 50;">
                    <div id="directory"><a href="aClub.jsp">Club > </a></div>
                    <h4><%= rs.getString("name")%> > Members</h4>
                    <%--            customize club name--%>
                </div>
                <div class="operation">
                    <a href="aClubMemberCreate.jsp?cid=<%= rs.getString("id")%>"><button>Add Membership</button></a>
                </div>
                <%
                    }
                %>
                <table id=t01>
                    <tr id=trHeader>
                        <th>Member ID</th>
                        <th>Member Name</th>
                        <th>Member Student ID</th>
                        <th>Status</th>
                        <th>Position</th>
                        <th>Start Date</th>
                        <th>Operation</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection connf = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stmf = conn.createStatement();
                        String ccid=request.getParameter("cid");
                        int No = Integer.parseInt(ccid);
                        ResultSet rsf = stm.executeQuery("select * from clubmember where clubid ='" + No + "'");
                        while(rsf.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rsf.getString("id")%></td>
                        <td><%= rsf.getString("name")%></td>
                        <td><%= rsf.getString("studentid")%></td>
                        <td><%= rsf.getString("status")%></td>
                        <td><%= rsf.getString("position")%></td>
                        <td><%= rsf.getString("startDate")%></td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">Do something...</button>
                                <div class="dropdownContent">
                                    <a href="aClubMemberManage.jsp?mid=<%= rsf.getString("id")%>&cid=<%= rsf.getString("clubid")%>">Manage Membership</a>
                                    <a href="aClubMemberDelete.jsp?mid=<%= rsf.getString("id")%>&cid=<%= rsf.getString("clubid")%>">Delete member</a>
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
