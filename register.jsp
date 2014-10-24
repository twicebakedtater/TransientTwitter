<html>
<title>Quacker</title>
<jsp:include page="menu.jsp" />
<head></br><h1>Register</h1></head>
<body>
</br>

<form action = "registerController.jsp" method = get>
Pick a username:
	<input type = text name = username />
</br>
Pick a password:
	<input type = password name = password1 />
</br>
Re-enter password:
	<input type = password name = password2 />
</br><hr>
	<input type = submit value = "Register" />
<%
%>	
</form>
</body>
</html>
