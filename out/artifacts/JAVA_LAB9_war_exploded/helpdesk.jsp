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

        <div class="faq">
            <h2 style="margin-bottom:20px">Frequently Asked Questions</h2>
            <%--            FAQs--%>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xlife","root","0111");
                Statement stm = conn.createStatement();
                ResultSet rs = stm.executeQuery("select * from faq");
                while(rs.next())
                {
            %>
            <div class="qna">
                <div id="question"><%= rs.getString("faqQuestion")%></div>
                <div id="answer"><%= rs.getString("faqAnswer")%></div>
            </div>
            <%
                }
            %>
        </div>

        <div class="contactInfo">
            <h2 style="margin-bottom: 15px;">Couldn't find a solution?</h2>
            <div style="display: flex; align-items: center;">
                <div>
                    <img style="width: 100px; margin-right: 15px;border: 0.5px solid grey;border-radius: 5px; padding: 10px;"src="image/xlife.jpg">
                </div>
                <div>
                    <p>ECA office is just an email away and always ready to answer your question.</p>
                    <p>Send your enquiries to <b>xlife@xmu.edu.my</b></p>
                </div>
            </div>

        </div>
    </div>
</div>

<%@include file="sJavaScript.jsp"%>>
</body>

</html>