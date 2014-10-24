<%@ page import="twitter.UserRepository" %>
<%@ page import="twitter.User" %>
<%@ page import="twitter.Tweet" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>

<html>
<title>Quacker</title>
<jsp:include page="menu.jsp" />
<head></br>
</head>
<body>
<div align ="right">
<a href="logout.jsp">Logout</a></div>
<%
User u = (User) session.getAttribute("currentUser");
String username = "";
if (u == null) {
	response.sendRedirect("login.jsp");
	return;
	}
	else {
		username = u.getUsername();
	}
out.println("<h1>*Quack* Welcome, " + username + "! *Quack*</h2>");
%>
</br>
</br>
<form action = "tweet.jsp" method ="get" >
<h2>What's on your mind wise quacker?</h2> <input type = text size = 35 name = message />
	<input type = submit value = "Quack it!" />
</form>
<%
	ArrayList<User> subscribedTo = u.getSubscribedTo();
	ArrayList<User> allUsers = new ArrayList<User>(UserRepository.instance().getAllUsers());
	
%>
<hr>
<%
	DateFormat df = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
	ArrayList<Tweet> allTweets = new ArrayList<Tweet>();

	for (int i = 0; i < subscribedTo.size(); i++) {
		allTweets.addAll(subscribedTo.get(i).getTweets());
	}

	java.util.Collections.sort(allTweets);

	for(int i = allTweets.size()-1; i>=0; i--) {
	Tweet t = allTweets.get(i);
	out.println("<i>" + t.getAuthor().getUsername() + "</i>: " + t.getText() + " <span style=\"font-style:italic;font-size:small;\">(" + df.format(t.getDate()) + ") <a href=\"unfollow.jsp?user=" + t.getAuthor().getUsername() + "\">Stop following</a></span><br/>");
	}

ArrayList<User> notSubscribedTo = new ArrayList<User>();

for(int i=0; i <allUsers.size(); i++) {
	if(!subscribedTo.contains(allUsers.get(i)) && allUsers.get(i) != u) {
		notSubscribedTo.add(allUsers.get(i));
	}
}
if(notSubscribedTo.size() > 0) {
%>
<form action = "follow.jsp" method = get>
Follow this user:
<select name ="follow">
<%
	for(int i = 0; i <notSubscribedTo.size(); i++) {
		out.println("<option value=\"" + notSubscribedTo.get(i).getUsername() + "\">" + notSubscribedTo.get(i).getUsername() + "</option>");
	}
%>	
	</select>
<input type = submit value = "Follow!" />
<%
	}
	else {
	out.println("<i>You are already following everyone.</i>");
	}
%>
</form>

</body>
</html>
