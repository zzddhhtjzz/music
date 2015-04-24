<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="music.dao.*,music.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<%
		UserDao dao2 = new UserDao();
			PlaylistDao dao = new PlaylistDao();
		
			String message = (String)(session.getAttribute("userid"));
			Integer idd=Integer.parseInt(message);
			String action = request.getParameter("action");
			String idStr  = request.getParameter("id");
			String name  = request.getParameter("name");
			Integer id=null;
			if(idStr!=null)
			id = Integer.parseInt(idStr);
			
					
			if("create".equals(action))
			{
				 Playlist playlist = new Playlist(null, name,dao2.findUserById(idd));
				dao.createPlaylist(playlist); 
			}
			else if("delete".equals(action))
			{
				dao.deletePlaylist(id);
			}
				
			List<Playlist> playlists = dao.readAllPlaylists(idd);
		%>
		<h1>
			Playlists
		</h1>
		<form action="playlist.jsp">
		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td><input name="name" class="form-control"/></td>
				<td>
					<button class="btn btn-primary" type="submit" name="action" value="create" name="idd" value=idd>Create</button>
				</td>
			</tr>
		<%
			for(Playlist playlist : playlists)
			{
		%>	<tr>
				<td>
					<a href="playlistDetails.jsp?id=<%= playlist.getId() %>">
					<%= playlist.getName() %>
					</a>
				<td>
					<a href="playlist.jsp?action=delete&id=<%= playlist.getId() %>" class="btn btn-danger">Delete</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
		</form>
	</div>
</body>
</html>