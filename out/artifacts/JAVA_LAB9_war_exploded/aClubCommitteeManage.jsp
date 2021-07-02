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
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sLogin.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Club Info | X-Life: Admin</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="wrapper">
    <%@include file="sAdminSidebar.jsp"%>

    <div class="mainContent" id="main">
        <%@include file="sAdminHeader.jsp"%>

        <div style="display: flex; margin: 20 0 0 50;">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection connl = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                Statement stml = connl.createStatement();
                String cid=request.getParameter("cid");
                int no = Integer.parseInt(cid);
                ResultSet rsl = stml.executeQuery("select * from club where id ='" + no + "'");
                while(rsl.next())
                {
            %>
            <h3 style="margin-bottom: 50px;"><%= rsl.getString("name")%> > Manage membership</h3>
            <%
                }
            %>
        </div>
        <div class="clubEdit">
            <form action="" method="post">
                <h2 style="margin-bottom: 20px;">Manage Membership</h2><br>
                <%
                    String host =  "jdbc:mysql://localhost:3306/xlife";
                    Connection connm = null;
                    Statement statm = null;
                    ResultSet rsm = null;
                    PreparedStatement stmt = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connm = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    statm = connm.createStatement();
                    String cmid = request.getParameter("cmid");
                    int id = Integer.parseInt(cmid);
                    String data = "select * from clubcommittee where id ='" + id + "'";
                    rsm = statm.executeQuery(data);
                    while(rsm.next())
                    {
                %>
                <div class="fillInItem">
                    <label> Committee ID: <%= rsm.getString("id")%></label>
                </div>
                <div class="fillInItem">
                    <label> Committee Name:</label>
                    <input class="inputbox" type="text" name="name" value="<%= rsm.getString("name")%>"/>
                </div>

                <div class="fillInItem">
                    <label> Committee Student ID:</label>
                    <input class="inputbox" type="text" name="studentid" value="<%= rsm.getString("studentid")%>"/>
                </div>

                <div class="fillInItem">
                    <label> Position:</label><br>
                    <input class="inputbox" type="text" name="position" value="<%= rsm.getString("position")%>"/>
                </div>

                <div style="float:right">
                    <button class="button" type="submit" style="float: right;">Submit</button>
                </div>
                <%
                    }
                %>
            </form>
            <a href="aClubCommitteeList.jsp?cid=<%= cid %>"><button class="button" style="float: right;">Back</button></a>
        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>
</body>
</html>

<%--update jsp script--%>
<%
    String a = request.getParameter("cmid");
    String b = request.getParameter("cid");
    String c = request.getParameter("name");
    String d = request.getParameter("studentid");
    String e = request.getParameter("position");

    if(a!=null && b!=null && c!=null && d!=null && e!=null){
        String query = "update clubcommittee set name=?,studentid=?,position=? where  id ='"+ a + "' ";
        try {
            stmt = connm.prepareStatement(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            assert stmt != null;
            stmt.setString(1,c);
            stmt.setString(2,d);
            stmt.setString(3,e);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("aClubCommitteeList.jsp?cid=" + cid + "");
    }
%>
