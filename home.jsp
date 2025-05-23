<h1>Welcome to Our Page!!!</h1>
<%
	String name=(String)session.getAttribute("NAME");
%>
<h2>Name:<%=name%></h2>
<br>
<a href="logout.jsp">Logout</a> <br>
<a href="listuser.jsp">List Users</a>