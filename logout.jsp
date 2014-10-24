<%@ page import="twitter.User" %>

<% 
session.setAttribute("currentUser", null);
response.sendRedirect("login.jsp");
%>
