<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="music.dao.UserDao,music.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
</head>
<body>
hello!
<%

String idStr = request.getParameter("id");
Integer id = Integer.parseInt(idStr);
UserDao dao=new UserDao();
User user=dao.findUserById(id);
String type=user.getType();
out.println(user.getName());
%>
<a href="Profiledetails.jsp?id=<%= user.getId() %>">my profile</a>  
<a href="playlist.jsp">my playlist</a> 
<%if("admin".equals(type)) 
out.print("<a href=\"manage.jsp\">manage users</a>"); %>
<a href="userlogin.jsp">log out</a>      
</body>
</html>