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
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String cludid = request.getParameter("cid");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
            Statement stm = conn.createStatement();
            String data = "select * from club where id ='" + cludid + "'";
            ResultSet rs = stm.executeQuery(data);
            while(rs.next())
            {
        %>

        <div id="directory" style="display: flex; margin: 20 0 0 50;">
            <div><a href="club.jsp">Club& Society</a></div>
            <h4> > </h4>
            <div><a href=""><%=rs.getString("name")%></a></div>
            <h4> > </h4>
            <div><a href="">Past Event</a></div>
        </div>

        <div class="csDetailContent">
            <div class="club">
                <div class="top">
                    <div class="logoName" style="display: flex;">
                        <img src="image/clublogo1.png" style="width:150px">
                        <div><h2><%=rs.getString("name")%></h2></div>
                    </div>
                </div>
                <div class="operation">
                    <a href=""><button style="border-right: none;">About</button></a>
                    <a href="clubCommitteeBoard.jsp?cid=<%=rs.getString("id")%>"><button style="border-right: none;">Committee Board</button></a>
                    <a href="clubPastEvent.jsp?cid=<%=rs.getString("id")%>"><button>Past Events</button></a>
                </div>
                <%
                    }

                    Class.forName("com.mysql.jdbc.Driver");
                    String cid = request.getParameter("cid");
                    Connection conni = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    Statement stmi = conni.createStatement();
                    String datai = "select * from pastevent where clubid ='" + cid + "'";
                    ResultSet rsi = stmi.executeQuery(datai);
                    while(rsi.next())
                    {
                %>
                <div class="myeventContent">
                    <div class="eventList">
                        <div class="event">
                            <div style="display: flex;">
                                <div class="detail">
                                    <h2><%=rsi.getString("name")%></h2>
                                    <h5><%=rsi.getString("date")%></h5>
                                    <a href="clubPastEventDetail.jsp?peid=<%=rsi.getString("id")%>&cid=<%=rsi.getString("clubid")%>"><button class="readMore">Read More</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>

</html>