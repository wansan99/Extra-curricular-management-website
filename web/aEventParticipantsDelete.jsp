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
    String pid=request.getParameter("pid");
    String eid=request.getParameter("eid");
    int no = Integer.parseInt(pid);
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
    Statement st=conn.createStatement();
    st.executeUpdate("delete from eventparticipants where id='"+no+"'");
    response.sendRedirect("aEventParticipants.jsp?eid=" + eid +"");
%>
