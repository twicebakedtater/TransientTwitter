<%@ page import="twitter.UserRepository" %>
<%@ page import="twitter.User" %>

<html>
<jsp:include page="menu.jsp" />
<head>
</head>
<body>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
User u = UserRepository.instance().getUser(username);
if(u == null || u.getPassword().equals(password)) {
	session.setAttribute("currentUser", u);
	response.sendRedirect("home.jsp");
	return;
}
else {
	out.println("Wrong username/password entered.");
}
%>
</body>
</html>
