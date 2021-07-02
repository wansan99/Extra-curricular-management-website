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
            <html>


                    <h2 style="margin:30px 0px 10px 50px">Calendar</h2>
                    <div class="calender" style="overflow: hidden;">
                        <!-- July 2020 Calendar Courtesy of WinCalendar.com -->
                        <table cellspacing='0' cellpadding='0' align=center>
                            <tr>
                                <td>
                                    <table cellspacing='0' cellpadding='0' align=center  border='1' width='1000px' overflow='hidden'>
                                        <td  align=center bgcolor='#123456'>  </td>
                                        <td colspan=5 align=center bgcolor='#123456'><font size='3' color='white'>Jul 2020  </td>
                                        <td  align=center bgcolor='#123456'>  </td>
                                        <tr>
                                            <td><font size='3' ><b>S</b></font></td>
                                            <td><font size='3' ><b>M</b></font></td>
                                            <td><font size='3' ><b>T</b></font></td>
                                            <td><font size='3' ><b>W</b></font></td>
                                            <td><font size='3' ><b>T</b></font></td>
                                            <td><font size='3' ><b>F</b></font></td>
                                            <td><font size='3' ><b>S</b></font></td>
                                        </tr>
                                        <tr>
                                            <td> </td>
                                            <td> </td>
                                            <td> </td>
                                            <td valign=top><font size='2' >1 <br></font></td>
                                            <td valign=top><font size='2' >2 <br>Music Festival 2020</font></td>
                                            <td valign=top><font size='2' >3 <br></font></td>
                                            <td valign=top><font size='2' >4 <br></font></td>
                                        </tr>
                                        <tr>
                                            <td valign=top><font size='2' >5 <br></font></td>
                                            <td valign=top><font size='2' >6 <br></font></td>
                                            <td valign=top><font size='2' >7 <br></font></td>
                                            <td valign=top><font size='2' >8 <br></font></td>
                                            <td valign=top><font size='2' >9 <br></font></td>
                                            <td valign=top><font size='2' >10 <br></font></td>
                                            <td valign=top><font size='2' >11 <br></font></td>
                                        </tr>
                                        <tr>
                                            <td valign=top><font size='2' >12 <br></font></td>
                                            <td valign=top><font size='2' >13 <br></font></td>
                                            <td valign=top><font size='2' >14 <br></font></td>
                                            <td valign=top><font size='2' >15 <br></font></td>
                                            <td valign=top><font size='2' >16 <br>Business Case Study 2020</font></td>
                                            <td valign=top><font size='2' >17 <br>Volleyball Competition 2020</font></td>
                                            <td valign=top><font size='2' >18 <br></font></td>
                                        </tr>
                                        <tr>
                                            <td valign=top><font size='2' >19 <br></font></td>
                                            <td valign=top><font size='2' >20 <br></font></td>
                                            <td valign=top><font size='2' >21 <br></font></td>
                                            <td valign=top><font size='2' >22 <br></font></td>
                                            <td valign=top><font size='2' >23 <br>Run n Gun Photomarathon</font></td>
                                            <td valign=top><font size='2' >24 <br></font></td>
                                            <td valign=top><font size='2' >25 <br></font></td>
                                        </tr>
                                        <tr>
                                            <td valign=top><font size='2' >26 <br></font></td>
                                            <td valign=top><font size='2' >27 <br></font></td>
                                            <td valign=top><font size='2' >28 <br></font></td>
                                            <td valign=top><font size='2' >29 <br></font></td>
                                            <td valign=top><font size='2' >30 <br>3 0n 3 Men's Basketball competition 2020</font></td>
                                            <td valign=top><font size='2' >31 <br></font></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <%@include file="sJavaScript.jsp"%>
            </body>

            </html>