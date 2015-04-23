<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="music.dao.UserDao,music.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String message = (String)(request.getAttribute("message")); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
</head>
<body>
hello!
<%UserDao dao=new UserDao();
int id=Integer.parseInt(message);
User user=dao.findUserById(id);
out.println(user.getName());
%>
<a href="Profiledetails.jsp?id=<%= user.getId() %>">nnu my profile</a>    
</body>
</html>