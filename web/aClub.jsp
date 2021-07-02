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

<%--table--%>
        <div class="adminCS">
            <div class="operation">
                <a href="aClubCreate.jsp"><button>Add Club& Society</button></a>
            </div>
            <div class="clubList">
                <h2 style="margin-bottom: 50px;">All Club& Society</h2>
                <table id=t01>
                    <tr id=trHeader>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Operation</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from club");
                        while(rs.next())
                        {
                    %>
                    <tr id="trRow">
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("type")%></td>
                        <td><%= rs.getString("bio")%></td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">Do something...</button>
                                <div class="dropdownContent">
                                    <a href="aClubEdit.jsp?cid=<%= rs.getString("club.id")%>">Edit Club</a>
                                    <a href="aEventMileStone.jsp?cid=<%= rs.getString("club.id")%>">Manage Article</a>
                                    <a href="aClubMemberList.jsp?cid=<%= rs.getString("club.id")%>">Manage Club Member</a>
                                    <a href="aClubCommitteeList.jsp?cid=<%= rs.getString("club.id")%>">Manage Committee</a>
                                    <a href="aClubDelete.jsp?cid=<%= rs.getString("club.id")%>">Delete club</a>
                                </div>
                            </div>
                        </td>
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