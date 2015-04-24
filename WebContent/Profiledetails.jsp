<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="music.dao.UserDao,music.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String idStr = request.getParameter("id");
Integer id = Integer.parseInt(idStr);

UserDao dao = new UserDao();
User user=dao.findUserById(id);
%>

	<div class="container">
		<form action="Profiledetails.jsp">
		<table class="table table-striped">
			<tbody>

				<tr>
					<td><%= user.getId() %></td>
					<td><%= user.getName() %></td>
					<td><%= user.getSex() %></td>
					<td><%= user.getDescription() %></td>
				</tr>
	
			</tbody>
		</table>
		</form>
	</div>
	<a href="hello.jsp?id=<%= user.getId() %>" >return</a>   
</body>
</html>