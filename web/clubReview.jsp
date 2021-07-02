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

        <div style="display: flex;  margin: 20 0 0 50">
            <div id="directory"><a href="s_dashboard.html">Dashboard</a></div>
            <h4> > </h4>
            <div id="directory"><a href="s_myEventreview.html">Event Review</a></div>
            <h4> > </h4>
            <div id="directory"><a href="s_myEventreview.html">Pending Review</a></div>
        </div>

        <div class="eventReviewContent">
            <div class="operation" style="display: flex;">
                <a href="s_myEventreview.html"><h4 style="margin-right: 20px;">Pending Review</h4></a>
                <h4>   •  </h4>
                <a href="s_reviewed.html"><h4 style="margin-left: 20px;">Reviewed</h4></a>
            </div>
            <div class="eventList">
                <div class="event">
                    <div style="display: flex;">
                        <div><img style="width: 200px;margin: 0 30 0 0;"src="image/event_img1.jpg"></div>
                        <div>
                            <h2 style="margin-bottom: 10px;">X-Concert</h2>
                            <textarea placeholder="Write your review here..."></textarea>
                            <h4 style="font-weight: 400;">From 1 as lowest till 5 as highest, rank this event:</h4>
                            <input type="radio" name="rank" value="1"> 1
                            <input type="radio" name="rank" value="2"> 2
                            <input type="radio" name="rank" value="3"> 3
                            <input type="radio" name="rank" value="4"> 4
                            <input type="radio" name="rank" value="5"> 5
                        </div>
                    </div>
                    <a href="#"><button class="submit">Submit</button></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!--script for icon dropdown list-->
<%@include file="sJavaScript.jsp"%>>
</body>
</html>
