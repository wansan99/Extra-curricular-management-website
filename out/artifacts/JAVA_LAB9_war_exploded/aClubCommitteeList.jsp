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
                    <h4><%= rs.getString("name")%> > Committees</h4>
                    <%--            customize club name--%>
                </div>
                <div class="operation">
                    <a href="aClubCommitteeCreate.jsp?cid=<%= rs.getString("id")%>"><button>Apply Committees</button></a>
                </div>
                <%
                    }
                %>
                <table id=t01>
                    <tr id=trHeader>
                        <th>Committee ID</th>
                        <th>Committee Name</th>
                        <th>Committee Student ID</th>
                        <th>Position</th>
                        <th>Operation</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection connf = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stmf = conn.createStatement();
                        String ccid=request.getParameter("cid");
                        int No = Integer.parseInt(ccid);
                        ResultSet rsf = stm.executeQuery("select * from clubcommittee where clubid ='" + No + "'");
                        while(rsf.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rsf.getString("id")%></td>
                        <td><%= rsf.getString("name")%></td>
                        <td><%= rsf.getString("studentid")%></td>
                        <td><%= rsf.getString("position")%></td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">Do something...</button>
                                <div class="dropdownContent">
                                    <a href="aClubCommitteeManage.jsp?cmid=<%= rsf.getString("id")%>&cid=<%= rsf.getString("clubid")%>">Manage Committee</a>
                                    <a href="aClubCommitteeDelete.jsp?cmid=<%= rsf.getString("id")%>&cid=<%= rsf.getString("clubid")%>">Delete Committee</a>
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

