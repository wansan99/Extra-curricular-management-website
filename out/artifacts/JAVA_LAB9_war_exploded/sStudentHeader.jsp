<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 13/7/2020
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--login double check--%>
<%
    if (session.getAttribute("username")==null)
        response.sendRedirect("index.jsp");
%>

<div class="header">
<%--    extract the username with the login student id--%>
    <%
        String sid= (String) session.getAttribute("sid");
        int no = Integer.parseInt(sid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection connhe = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
        Statement stmhe = connhe.createStatement();
        ResultSet rshe = stmhe.executeQuery("select * from studentprofile where userid='" + no + "'");
        while(rshe.next())
        {
    %>
    <div>
        <h2>Welcome, <%= rshe.getString("name")%>!</h2>
    </div>
    <%
        }
    %>
<%--    show only 2 notification than belong to the user in the notification icon--%>
    <div class="buttons">
        <div class="notification">
            <button class="bell"><i class="far fa-bell"></i></button>
            <div class="notiDropdown">
                <h4>Notifications</h4>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connd = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                    Statement stmd = connd.createStatement();
                    ResultSet rsd = stmd.executeQuery("select * from notification where tag = 'ALL' || tag = 'SWE'");
                    int times = 0;
                    while(rsd.next())
                    {
                        times++;
                        if(times<3){


                %>
                    <ul>
                        <li><%= rsd.getString("subject")%></li>
                    </ul>
                <%
                        }
                        else
                            break;
                    }
                %>
                <a class="viewAll" href="dashboardNotification.jsp">View all</a>
            </div>
        </div>

<%--        show username, my profile link and logout button--%>
        <div class="user">
            <button id="dropdown" class="avatar"><i class="far fa-user"></i></button>
            <div class="userDropdown">
                <h4><%= session.getAttribute("username")%></h4>
                <ul>
                    <li><a href="dashboardMyProfile.jsp"><i class="fas fa-info"></i>My Profile</a></li>
                    <li>
                        <form id="logout" action="LogoutServlet" method="get">
                            <i class="fas fa-sign-out-alt"></i>
                            <input class="button" type="submit" value="Logout" onclick="document.getElementById('logout').submit();">
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
