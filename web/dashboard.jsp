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

        <div class="dashboardContent">
            <div style="display: flex; width: 90%; margin-left: 50px;">
<%--            Myevent--%>
                <div class="event" style="margin-right:10px">
                    <h2 style="color: #123456;">My Events </h2>
                    <%
                        String studentid= (String) session.getAttribute("username");
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stm3 = conn3.createStatement();
                        ResultSet rs3 = stm3.executeQuery("select event.name, event.endDate from eventparticipants join event on event.id=eventparticipants.eventid join studentprofile on eventparticipants.studentid = '"+studentid+"'");
                        int time3 = 0;
                        while(rs3.next() )
                        {
                            time3++;
                            if(time3<3){
                    %>
                    <ul>
                        <li><h4><%= rs3.getString("event.name")%> :</h4> <h6><%=rs3.getString("event.endDate")%></h6> </li>
                    </ul>
                    <%
                            }
                            else
                                break;
                        }
                    %>
                    <br><h5><a href="dashboardMyEvent.jsp?sid=<%=session.getAttribute("sid")%>"> View more</a></h5>
                </div>
<%--             Myclub--%>
                <div class="club" style="margin-left:10px">
                    <h2 style="color: #123456;">My Club</h2>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stm4 = conn4.createStatement();
                        ResultSet rs4 = stm4.executeQuery("select club.name, clubmember.position from clubmember join club on club.id=clubmember.clubid join studentprofile on clubmember.studentid = '"+studentid+"'");
                        int time2 = 0;
                        while(rs4.next())
                        {
                            time2++;
                            if(time2<3){


                    %>
                    <ul>
                        <li><h4><%= rs4.getString("club.name")%> :</h4> <h6><%=rs4.getString("clubmember.position")%></h6> </li>
                    </ul>
                    <%
                            }
                            else
                                break;
                        }
                    %>
                    <br><h5><a href="dashboardMyClub.jsp?sid=<%=session.getAttribute("sid")%>">View more</a></h5>
                </div>
            </div>
<%--         Mynotification--%>
            <div class="notification">
                <h2 style="color: #123456;">My Notification</h2>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    Statement stm1 = conn1.createStatement();
                    ResultSet rs1 = stm1.executeQuery("select * from notification where tag = 'ALL' || tag = 'SWE'");
                    int time = 0;
                    while(rs1.next())
                    {
                        time++;
                        if(time<4){


                %>
                <ul>
                    <li><h4><%= rs1.getString("subject")%> :</h4> <%=rs1.getString("description")%> </li>
                </ul>
                <%
                        }
                        else
                            break;
                    }
                %>
                <br><h5><a href="dashboardNotification.jsp?sid=<%=session.getAttribute("sid")%>">View More</a></h5>
            </div>
<%--            MyWishlist--%>
            <div class="wishlist">
                <h2 style="color: #123456;">My Wishlist</h2>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    Statement stm2 = conn2.createStatement();
                    ResultSet rs2 = stm2.executeQuery("select event.name, event.endDate from wishlist join event on event.id=wishlist.eventid join studentprofile on wishlist.studentid = '"+studentid+"'");
                    int time1 = 0;
                    while(rs2.next())
                    {
                        if(time1<3){
                %>
                <ul>
                    <li><h4><%= rs2.getString("event.name")%> : </h4><%=rs2.getString("event.endDate")%> </li>
                </ul>
                <%
                        }
                        time1++;
                    }
                %>
                <br><h5><a href="dashboardMyWishlist.jsp?sid=<%=session.getAttribute("sid")%>">View More</a></h5>
            </div>
        </div>
    </div>
</div>
<%@ include file="sJavaScript.jsp"%>

</body>

</html>