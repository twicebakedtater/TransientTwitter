<%@ page import="twitter.UserRepository" %>
<%@ page import="twitter.User" %>
<%@ page import="twitter.Tweet" %>
<%@ page import="java.util.*" %>

<html>
<head>
</head>
<body>
<%
User u = (User) session.getAttribute("currentUser");
String follow = request.getParameter("follow");
u.subscribeTo(UserRepository.instance().getUser(follow));
response.sendRedirect("home.jsp");



%>
</body>
</html>
