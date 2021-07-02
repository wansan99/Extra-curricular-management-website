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
<%@page import="java.sql.*,java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sLogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String eid=request.getParameter("eid");
    String studentid= (String) session.getAttribute("username");
    String status= "still available";
    int no = Integer.parseInt(eid);

    String host =  "jdbc:mysql://localhost:3306/xlife";
    Connection conn = null;
    Statement stat = null;
    ResultSet rs = null;
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
    Statement st=conn.createStatement();
    if(eid!=null && studentid!=null && status!=null) {
        String query = "insert wishlist (eventid,studentid,status) values (?,?,?)";
        stmt = conn.prepareStatement(query);
        assert stmt != null;
        stmt.setString(1, eid);
        stmt.setString(2, studentid);
        stmt.setString(3, status);
        stmt.executeUpdate();
        stmt.close();
        response.sendRedirect("dashboardMyWishlist.jsp");
    }
    else
        response.sendRedirect("eventDetail.jsp?eid=" + eid + "");
%>

