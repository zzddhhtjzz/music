<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="music.dao.UserDao,music.model.User,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Users</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
    <h1>Users</h1>
    
    <%
    UserDao userDAO = new UserDao();
    
    String action = request.getParameter("action");
    String id = request.getParameter("id");
    String username  = request.getParameter("username");
    String password = request.getParameter("password");
    String sex = request.getParameter("sex");
    String des = request.getParameter("des");
    String type = request.getParameter("type");
    
    if("create".equals(action))
    {
    	User user = new User();
        
        user.setUsername(username);
        user.setPassword(password);
        user.setSex(sex);
        user.setDescription(des);
        user.setType(type);
        userDAO.insertUser(user);

    }
    else if("delete".equals(action))
    {
        int idInt = Integer.parseInt(id);
        userDAO.removeUser(idInt);   
    }
    else if("update".equals(action))
    {
        int idInt = Integer.parseInt(id);
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setSex(sex);
        user.setDescription(des);
        user.setType(type);
        user.setPlaylists(userDAO.findUserById(idInt).getPlaylists());
        userDAO.updateUser(idInt, user);
    }
    
   List<User> users = userDAO.findAllUsers();
    %>
    
    <form action="manage.jsp">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>username</th>
                <th>password</th>
                <th>sex</th>
                 <th>description</th>
                 <th>type</th>
            </tr>
            <tr>
                <th><input class="form-control" name="id" value="<%=id%>" readonly/></th>
                <th><input class="form-control" name="username" placeholder="Username" value="<%=username%>"/></th>
                <th><input class="form-control" name="password" placeholder="Passsword" value="<%=password%>"/></th>
                <th><input class="form-control" name="sex" placeholder="sex" value="<%=sex%>"/></th>
                 <th><input class="form-control" name="des" placeholder="desription" value="<%=des%>"/></th>
                 <th><input class="form-control" name="type" placeholder="type" value="<%=type%>"/></th>
                <th>
                    <button class="btn btn-success" name="action" value="create">Add</button>
                    <button class="btn btn-primary" name="action" value="update">Update</button>
                </th>
            </tr>
        </thead>
        <tbody>
    <%
    for(User user : users)
    {
        %>
            <tr>
                <td><%=user.getId() %></td>
                <td><a href="Profiledetails.jsp?id=<%=user.getId()%>"><%=user.getUsername() %></a></td>
                <td><%=user.getUsername() %></td>
                <td><%=user.getPassword() %></td>
                <td><%=user.getSex() %></td>
                  <td><%=user.getDescription() %></td>
                    <td><%=user.getType() %></td>  
                  
                <td>
                    <a class="btn btn-danger" href="manage.jsp?action=delete&id=<%=user.getId() %>">Delete</a>
                    <a class="btn btn-warning" href="manage.jsp?action=select&id=<%=user.getId() %>&username=<%=user.getName()%>&password=<%=user.getPassword()%>&sex=<%=user.getSex()%>&des=<%=user.getDescription()%>&type=<%=user.getType()%>">Select</a>
                </td>
            </tr>
        <%
    }
    %>
        </tbody>
    </table>
    </form>
    </div>
</body>
</html>