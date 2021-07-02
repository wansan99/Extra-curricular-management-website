<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 3:02 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page import="java.sql.*" %>
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
        <%
            String host =  "jdbc:mysql://localhost:3306/xlife";
            Connection connm = null;
            Statement statm = null;
            ResultSet rsl = null;
            PreparedStatement stmt = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connm = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            statm = connm.createStatement();
            String sid = request.getParameter("sid");
            int id = Integer.parseInt(sid);
            String data = "select * from studentprofile where userid ='" + id + "'";
            rsl = statm.executeQuery(data);
            while(rsl.next())
            {
        %>

        <div style="display: flex; margin: 20 0 0 50;">
            <div id="directory"><a href="aStudentManagement.jsp">Student Log</a></div>
            <h4> > View user profile </h4>
        </div>

        <div class="faqAdd">
            <form method="post">
                <div class="userAdd">
                    <h2 style="margin-bottom: 20px;">Edit Student Profile</h2>
                    <div class="fillInItem">ID</b><br>
                        <input class="inputbox" type="text" name="id" value="<%= rsl.getString("userid")%>"/>
                    </div>

                    <div class="fillInItem">Name</b><br>
                        <input class="inputbox" type="text" name="name" value="<%= rsl.getString("name")%>"/>
                    </div>

                    <div class="fillInItem">Student ID
                    <input class="inputbox" type="text" name="studentid" value="<%= rsl.getString("studentid")%>"/>
                </div>

                <div class="fillInItem">Intake</b><br>
                    <input class="inputbox" type="text" name="intake" value="<%= rsl.getString("intake")%>"/>
                </div>

                <div class="fillInItem">Gender
                    <input class="inputbox" type="text" name="gender" value="<%= rsl.getString("gender")%>"/>
                </div>

                <div class="fillInItem">Nationality</b>
                    <input class="inputbox" type="text" name="nation" value="<%= rsl.getString("nationalityl")%>"/>
                </div>

                <div class="fillInItem">Contact NO.</b>
                    <input class="inputbox" type="text" name="contact" value="<%= rsl.getString("contact")%>"/>
                </div>

                <div class="fillInItem">Email<br>
                    <input class="inputbox" type="text" name="email" value="<%= rsl.getString("emailaddress")%>"/>
                </div>
                    <button class="button" style="float: right;" type="submit">Update</button>
            </form>
        </div>
    <%
        }
    %>
    </div>
</div>


<%@include file="sJavaScript.jsp"%>>
</body>
</html>
<%
    String a = request.getParameter("sid");
    String b = request.getParameter("name");
    String c = request.getParameter("studentid");
    String d = request.getParameter("intake");
    String e = request.getParameter("gender");
    String f = request.getParameter("nation");
    String g = request.getParameter("contact");
    String h = request.getParameter("email");

    if(a!=null && b!=null && c!=null){
        String query = "update studentprofile set name=?,studentid=?,intake=?,gender=?,nationalityl=?, contact=? , emailaddress=? where  userid ='"+ a + "'";
        try {
            stmt = connm.prepareStatement(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            assert stmt != null;
            stmt.setString(1,b);
            stmt.setString(2,c);
            stmt.setString(3,d);
            stmt.setString(4,e);
            stmt.setString(5,f);
            stmt.setString(6,g);
            stmt.setString(7,h);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("aStudentProfile.jsp?sid=" + a + "");
    }
%>