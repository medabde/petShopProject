<%@page import="ma.noobs.pet.model.User"%>
<%@page import="ma.noobs.pet.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , ma.noobs.pet.model.Currency , ma.noobs.pet.model.Category , ma.noobs.pet.dao.CategoryDao,ma.noobs.pet.model.Pet , ma.noobs.pet.dao.PetDao"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%

UserDao UD = new UserDao();
List<User> allUsers = UD.getAll();
request.setAttribute("newUsers", allUsers);

if(request.getSession().getAttribute("admin")==null) response.sendRedirect("../AdminLogin.jsp");

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Font Awesome -->
        <link rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
            integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
            crossorigin="anonymous">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Candal|Lora"
            rel="stylesheet">

        <!-- Custom Styling -->
        <link rel="stylesheet" href="../styleadmin.css">

        <!-- Admin Styling -->
        <link rel="stylesheet" href="../admin.css">

        <title>Admin User</title>
    </head>

    <body>
        <header>
            <div class="logo">
                <h1 class="logo-text"><span>Pet</span>Shop</h1>
            </div>
            <i class="fa fa-bars menu-toggle"></i>
            <ul class="nav">
                <li>
                    <a href="../myAccountAdmin.jsp">
                        <i class="fa fa-user"></i>
                         ${admin.getUsername()}
                        <i class="fa fa-chevron-down" style="font-size: .8em;"></i>
                    </a>
                    <ul>
                        <li><a href="../../DisconnectAdmin" class="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </header>

        <!-- Admin Page Wrapper -->
        <div class="admin-wrapper">

            <!-- Left Sidebar -->
            <div class="left-sidebar">
                <ul>
                    <li><a href="../Pet/AdminPet.jsp">Manage Pets</a></li>
                    <li><a href="../Category/AdminCategory.jsp">Manage Categories</a></li>
                    <li><a href="../User/AdminUser.jsp">Manage Users</a></li>
                </ul>
            </div>
            <!-- // Left Sidebar -->


            <!-- Admin Content -->
            <div class="admin-content">
                <div class="button-group">
                    <a href="AdminUserCreate.jsp" class="btn btn-big">Add User</a>
                    <a href="AdminUser.jsp" class="btn btn-big">Manage Users</a>
                </div>


                <div class="content">

                    <h2 class="page-title">Manage Users</h2>


            <table border="1">
           <thead><th>Id</th><th>Username</th><th>Password</th><th>Email</th><th>Phone</th><th>Company</th><th>Adress</th>
           <th>isAdmin</th></thead>
	           		<c:forEach items="${newUsers}" var="user">
	           		<tr>
	           		<td><c:out value="${user.getId()}"/></td>
	           		<td><c:out value="${user.getUsername()}"/></td>
					<td><c:out value="${user.getPassword()}"/></td>
					<td><c:out value="${user.getEmail()}"/></td>
					<td><c:out value="${user.getPhone()}"/></td>
					<td><c:out value="${user.getCompany()}"/></td>
					<td><c:out value="${user.getAddress()}"/></td>
					<td><c:out value="${user.isAdmin()}"/></td>
					<td> <a href="AdminUserUpdate.jsp?id=<c:out value="${user.getId()}"/>" class="edit">Edit</a></td>
					<td> <a href="AdminUserDelete.jsp?id=<c:out value="${user.getId()}"/>" class="delete">Delete</a></td>
	           		
	           		</tr>
	           		

                    </c:forEach>  
                    </table>    


                </div>

            </div>
            <!-- // Admin Content -->

        </div>
        <!-- // Page Wrapper -->



        <!-- JQuery -->
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Custom Script -->
        <script src="../../js/scripts.js"></script>

    </body>

</html>