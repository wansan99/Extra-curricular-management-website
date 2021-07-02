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
            <div id="directory"><a href="aClub.jsp">Club</a></div>
            <h4> > Edit Club info</h4>
            <%--            customize club name--%>
        </div>
        <%
            String host =  "jdbc:mysql://localhost:3306/xlife";
            Connection conn = null;
            Statement stat = null;
            ResultSet rs = null;
            PreparedStatement stmt = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
        %>
        <div class="clubEdit">
            <form action="" method="post">
                <%
                    stat = conn.createStatement();
                    String cid = request.getParameter("cid");
                    int id = Integer.parseInt(cid);
                    String data = "select * from club where id ='" + id + "'";
                    rs = stat.executeQuery(data);
                    while(rs.next())
                    {
                %>
                <h2 style="margin-bottom: 20px;">Edit club information</h2>
                <div class="fillInItem">
                    <label>Club ID:</label>
                    <input class="inputbox" type="text" name="id" value='<%=rs.getString("id")%>'/>
                </div>
                <div class="fillInItem">
                    <label>Club Name:</label>
                    <input class="inputbox" type="text" name="clubName" value='<%=rs.getString("name")%>'/>
                </div>
<%--                <div class="fillInItem">--%>
<%--                    Category:--%>
<%--                    <select>--%>
<%--                        <option>Sport</option>--%>
<%--                        <option>Arts</option>--%>
<%--                        <option>Others</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
                <div class="fillInItem">
                    <label>Club Description:</label>
<%--                    <textarea class="inputbox" name="clubBio" value='<%=rs.getString("bio")%>'>       </textarea>--%>
                    <input class="inputbox" type="text" name="clubBio" value='<%=rs.getString("bio")%>'/>
                </div>
                <div class="fillInItem">
                    <label>Club benefit:</label>
                    <input class="inputbox" type="text" name="clubBenefit" value='<%=rs.getString("club_benefits")%>'/>
                </div>
                <div class="fillInItem">
                    <label>Number of member</label>
                    <input class="inputbox" type="text" name="memberNumber" value='<%=rs.getString("memberNo")%>'/>
                </div>
                <div style="float:right">
<%--                    <input class="button" type="submit" value="Submit">--%>
                    <button class="button" type="submit" style="float: right;">Update</button>
                </div>
                <%
                    }
                %>
            </form>
            <a href="aClub.jsp"><button class="button" style="float: right;">Back</button></a>
        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>
</body>
</html>

<%
    String a = request.getParameter("id");
    String b = request.getParameter("clubName");
    String c = request.getParameter("clubBio");
    String d = request.getParameter("clubBenefit");
    String e = request.getParameter("memberNumber");

    if(a!=null && b!=null && c!=null && d!=null && e!=null){
        String query = "update club set name=?, bio=?, club_benefits=?, memberNo =? where id ='"+ a + "'";
        try {
            stmt = conn.prepareStatement(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            assert stmt != null;
            stmt.setString(1,b);
            stmt.setString(2,c);
            stmt.setString(3,d);
            stmt.setString(4,e);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("aClub.jsp");
    }
%>
