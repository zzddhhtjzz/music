<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="music.dao.*,music.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
UserDao dao = new UserDao();
String message = (String)(session.getAttribute("userid"));
Integer id=Integer.parseInt(message);
if("admin".equals(dao.findUserById(id).getType()))
		{
	if(request.getParameter("id")!=null)
	session.setAttribute("invest",  request.getParameter("id"));
	id=Integer.parseInt((String)session.getAttribute("invest"));
	
		}
User user=dao.findUserById(id);
String action = request.getParameter("action");
String username  = request.getParameter("username");
String password  = request.getParameter("password");

String sex  = request.getParameter("sex");

String description  = request.getParameter("description");

		
if("update".equals(action))
{
	 User newuser = new User(user.getId(), username,password,sex,description,"user",user.getPlaylists());
	dao.updateUser(user.getId(),newuser); 
}
%>
<h1>
			Profiles
		</h1>
	<div class="container">
		<form action="Profiledetails.jsp">
		<table class="table table-striped">
			<tr>
				<th>username</th>
				<th>password</th>
				<th>sex</th>
				<th>description</th>
		     	<th>type</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td><input name="username" class="form-control"/></td>
				<td><input name="password" class="form-control"/></td>
				<td><input name="sex" class="form-control"/></td>
				<td><input name="description" class="form-control"/></td>
	<td>&nbsp;</td>
				<td>
					<button class="btn btn-primary" type="submit" name="action" value="update">update</button>
				</td>
			</tr>
			<tbody>

				<tr>
					<td><%= user.getName() %></td>
					<td><%= user.getPassword() %></td>
					<td><%= user.getSex() %></td>
					<td><%= user.getDescription() %></td>
					<td><%= user.getType() %></td>
				</tr> 
	
			</tbody>
		</table>
		</form>
	</div>
	<a href="hello.jsp?id=<%= Integer.parseInt((String)session.getAttribute("userid")) %>" >return</a>   
</body>
</html>