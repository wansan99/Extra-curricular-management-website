<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 14/7/2020
  Time: 10:36 PM
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ClubEditProcess</title>
</head>
<body>
<%
    String host =  "jdbc:mysql://localhost:3306/xlife";
    Connection conn = null;
    Statement stat = null;
    ResultSet rs = null;
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
%>
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
            stmt.setString(1,a);
            stmt.setString(2,b);
            stmt.setString(3,c);
            stmt.setString(4,d);
            stmt.setString(5,e);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            int i = stmt.executeUpdate();
            stmt.close();
            if(i > 0)
            {
                %><h1>"Record Updated Successfully"</h1><%
            }
            else
            {
                %><h1>"There is a problem in updating Record."</h1><%
            }
        }
        catch(SQLException sql)
        {
            request.setAttribute("error", sql);
            out.println(sql);
        }
        response.sendRedirect("aClub.jsp");
    }


%>
</body>
</html>
