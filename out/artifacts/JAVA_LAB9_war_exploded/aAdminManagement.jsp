<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 25/6/2020
  Time: 3:02 AM
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
    <title>Club&Society | X-Life: Admin</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="wrapper">
    <%@include file="sAdminSidebar.jsp"%>

    <div class="mainContent" id="main">
        <%@include file="sAdminHeader.jsp"%>

        <div class="adminUM">
            <div class="userList">
                <h2 style="margin-bottom: 50px;">All Admin</h2>

                <table id=t01>
                    <tr id=trHeader>
                        <th>Name</th>
                        <th>ID</th>
                        <th>Password</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from adminlogin");
                        while(rs.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rs.getString("username")%></td>
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("password")%></td>
                    </tr>
                    <%
                        }
                    %>

                </table>
            </div>
        </div>

    </div>
</div>

<script>
    document.querySelector(".header .buttons .user").addEventListener("click",
        function(){
            this.classList.toggle("active");
        });
</script>

<script>
    document.querySelector(".header .buttons .notification").addEventListener("click",
        function(){
            this.classList.toggle("active");
        });
</script>

<script>
    var mini = true;

    function toggleSidebar() {
        if (mini) {
            console.log("opening sidebar");
            document.getElementById("mySidebar").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
            this.mini = false;
        } else {
            console.log("closing sidebar");
            document.getElementById("mySidebar").style.width = "85px";
            document.getElementById("main").style.marginLeft = "85px";
            this.mini = true;
        }
    }
</script>

<script src="https://kit.fontawesome.com/01129367d3.js"></script>
</body>

</html>