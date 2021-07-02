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
            <h3 style="margin-bottom: 50px;"><%= rsl.getString("name")%> > Add membership</h3>
<%--            <div id="directory"><a href="aClub.jsp"><%= rsl.getString("name")%></a></div>--%>
<%--            <h4> > Add membership</h4>--%>
            <%--            customize club name--%>
        </div>
        <div class="clubEdit">
            <form action="" method="post">
                <h2 style="margin-bottom: 20px;">Add club member</h2><br>
                <div class="fillInItem">
                    <label>Club ID: <%= rsl.getString("id")%></label>
                </div><br>
            <%
                }
            %>
                <div class="fillInItem">
                    <label> Member ID:</label>
                    <input class="inputbox" type="text" name="id"/>
                </div>
                <div class="fillInItem">
                    <label> Member Name:</label>
                    <input class="inputbox" type="text" name="membername"/>
                </div>

                <div class="fillInItem">
                    <label> Member Student ID:</label>
                    <input class="inputbox" type="text" name="studentid"/>
                </div>

                <div class="fillInItem">
                    <label> Status:</label><br>
                    <input class="inputbox" type="text" name="status"/>
                </div>

                <div class="fillInItem">
                    <label> Position:</label><br>
                    <input class="inputbox" type="text" name="position"/>
                </div>

                <div class="fillInItem">
                    <label>Start Date: </label>
                    <input class="inputbox" type="text" name="startdate" />
                </div>
                <div style="float:right">
                    <button class="button" type="submit" style="float: right;">Submit</button>
                </div>
            </form>
            <a href="aClub.jsp"><button class="button" style="float: right;">Back</button></a>
        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>
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

    String a = request.getParameter("id");
    String b = request.getParameter("cid");
    String c = request.getParameter("membername");
    String d = request.getParameter("studentid");
    String e = request.getParameter("status");
    String f = request.getParameter("position");
    String g = request.getParameter("startdate");


    if(a!=null && b!=null && c!=null && d!=null && e!=null){
        String query = "insert clubmember (id,clubid,name,studentid,startDate,status,position) values (?,?,?,?,?,?,?)";
        try {
            stmt = conn.prepareStatement(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            assert stmt != null;
            stmt.setString(1,a);
            stmt.setString(2,b);
            stmt.setString(3,c);
            stmt.setString(4,d);
            stmt.setString(5,e);
            stmt.setString(6,f);
            stmt.setString(7,g);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("aClubMemberList.jsp?cid=" + cid + "");
    }
%>

