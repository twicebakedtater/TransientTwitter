<%@ page import="twitter.User" %>
<%@ page import="twitter.UserRepository" %>
<%@ page import="twitter.Tweet" %>
<%@ page import="java.util.*" %>

<html>
<head>
</head>
<body>

<%
String unfollow = request.getParameter("user");
User u =(User) session.getAttribute("currentUser");
u.unsubscribeTo(UserRepository.instance().getUser(unfollow));
response.sendRedirect("home.jsp");
%>
