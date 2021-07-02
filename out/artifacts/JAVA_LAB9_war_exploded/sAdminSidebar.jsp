<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 13/7/2020
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--adminpage side menu bar--%>
<div id="mySidebar" class="sidebar" onmouseover="toggleSidebar()" onmouseout="toggleSidebar()">
    <ul>
        <li><a href="aDashboard.jsp"><i class="fas fa-qrcode"></i>Dashboard</a></li>
        <li><a href="aEvent.jsp"><i class="fas fa-clipboard-list"></i>Event</a></li>
        <li><a href="aClub.jsp"><i class="fas fa-volleyball-ball"></i>Club&Society</a></li>
        <li><a href="aNotification.jsp"><i class="fas fa-qrcode"></i>Notification</a></li>
        <li><a href="aStudentManagement.jsp"><i class="fas fa-users-cog"></i>Student</a></li>
        <li><a href="aAdminManagement.jsp"><i class="fas fa-users-cog"></i>Admin</a></li>
        <li><a href="aFAQ.jsp"><i class="fas fa-question"></i>FAQ</a></li>
    </ul>
</div>
