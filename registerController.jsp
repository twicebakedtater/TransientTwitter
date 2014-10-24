<%@ page import="twitter.UserRepository" %>
<%@ page import="twitter.User" %>

<html>
<jsp:include page="menu.jsp" />
<head>
</head>
<body>
<%
	if(request.getParameter("password1").equals(request.getParameter("password2"))) {
		String username = request.getParameter("username");
		String password = request.getParameter("password1");
		User u = UserRepository.instance().createNewUser(username, password);
		if(u == null) {
			out.println("That username is already taken.");
		}
		else {
			session.setAttribute("currentUser", u);
			response.sendRedirect("home.jsp");
		}
	}
	else {
		out.println("The passwords you have entered do not match.");
	}
%>
</body>
</html>
