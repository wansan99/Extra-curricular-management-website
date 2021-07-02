<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 13/7/2020
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
<%--    admin page header--%>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection connhe = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
        Statement stmhe = connhe.createStatement();
        ResultSet rshe = stmhe.executeQuery("select * from adminlogin");
        while(rshe.next())
        {
    %>
    <div>
        <h2>Welcome, <%= rshe.getString("username")%>!</h2>
    </div>

<%--    admin logout feature--%>
    <div class="buttons">
        <div class="user">
            <button class="avatar"><i class="far fa-user"></i></button>
            <div class="userDropdown">
                <h4><%= rshe.getString("username")%></h4>
                <ul>
                    <li>
                        <form id="logout" action="LogoutServlet" method="get">
                            <i class="fas fa-sign-out-alt"></i>
                            <input type="submit" value="Logout" onclick="document.getElementById('logout').submit();">
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%
    }
%>