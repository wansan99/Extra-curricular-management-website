<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 2:05 AM
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
    <title>Dashboard | X-Life</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
<div class="wrapper">
    <%@ include file="sStudentSidebar.jsp"%>

    <div class="mainContent" id="main">
        <%@ include file="sStudentHeader.jsp"%>

<%--        directory guide--%>
        <div style="display: flex;  margin: 20 0 0 50">
            <div id="directory"><a href="dashboard.jsp">Dashboard</a></div>
            <h4> > My Club</h4>
        </div>
        <%
            String studentid= (String) session.getAttribute("username");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select clubmember.status, club.name, club.id, clubmember.position , clubmember.startDate " +
                    "from clubmember join club on club.id = clubmember.clubid where clubmember.studentid = '"+studentid+"'");
            while(rs.next())
            {
        %>
<%--        myclubcontent--%>
        <div class="myClubContent">
            <div class="clubList">
                <div class="club">
                    <div style="display: flex;">
                        <div><img style="width: 200px;margin: 0 30 0 0;" src="image/clublogo1.png"></div>
                        <div>
                            <h2 style="margin-bottom: 30px;"><%=rs.getString("club.name")%></h2>
                            <h4>Status: <%=rs.getString("clubmember.status")%></h4>
                            <h4>Position:<%=rs.getString("clubmember.position")%></h4><br>
                            <h4>Join From:<%=rs.getString("clubmember.startDate")%></h4>
                        </div>
                    </div>
                    <a href="clubProfile.jsp?cid=<%=rs.getString("club.id")%>"><button class="readMore">Visit Club</button></a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

<%@ include file="sJavaScript.jsp"%>>
</body>

</html>
