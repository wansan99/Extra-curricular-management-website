<%--
  Created by IntelliJ IDEA.
  User: Tan
  Date: 13/7/2020
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("username")==null)
        response.sendRedirect("index.jsp");
%>
