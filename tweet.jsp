<%@ page import="twitter.UserRepository" %>
<%@ page import="twitter.User" %>
<%@ page import="twitter.Tweet" %>
<html>
<head>
</head>
<body>
<%
String message = request.getParameter("message");
User u = (User) session.getAttribute("currentUser");
u.tweet(message);
response.sendRedirect("home.jsp");
%>
</body>
</html>
