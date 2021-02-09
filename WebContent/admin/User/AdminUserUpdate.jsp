<%@page import="ma.noobs.pet.model.User"%>
<%@page import="ma.noobs.pet.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , ma.noobs.pet.model.Currency , ma.noobs.pet.model.Category , ma.noobs.pet.dao.CategoryDao,ma.noobs.pet.model.Pet , ma.noobs.pet.dao.PetDao"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%

UserDao UD = new UserDao();
List<User> allUsers = UD.getAll();
request.setAttribute("newUsers", allUsers);
long id = Integer.parseInt(request.getParameter("id"));
User U = UD.get(id);

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

        <title>Admin User - Update User</title>
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

                    <h2 class="page-title">Update User</h2>

            <form action="../../UserUpdate?id=<%=U.getId()%>" method="post">
            			<div>
                            <label>ID</label>
                            <input type="text" name="id" value="<%=U.getId()%>" disabled="disabled" class="text-input"/>
                        </div>
                        <div>
                            <label>Username</label>
                            <input type="text" name="username" value="<%=U.getUsername()%>" class="text-input"/>
                        </div>
                        <div>
                            <label>Password</label>
                            <input type="text" name="password" value="<%=U.getPassword()%>" class="text-input"/>
                        </div>
                        <div>
                            <label>Email</label>
                            <input type="text" name="email" value="<%=U.getEmail()%>" class="text-input"/>
                        </div>
                        <div>
                            <label>Phone</label>
                            <input type="text" name="phone" value="<%=U.getPhone()%>" class="text-input"/>
                        </div>
                        <div>
                            <label>Company</label>
                            <input type="text" name="company" value="<%=U.getCompany()%>" class="text-input"/>
                        </div>
                        <div>
                            <label>Address</label>
                            <input type="text" name="address" value="<%=U.getAddress()%>" class="text-input"/>
                        </div>
                        
                        <div>
                            <label>isAdmin</label>                           
                            <div class="radiodiv">
	                            <input type="radio" name="isadmin" value="true" <%if(U.isAdmin()==true){%> checked<%} %>>
								<label>True</label>
								<input type="radio" name="isadmin" value="false" <%if(U.isAdmin()==false){%> checked<%} %>>
								<label>False</label>
							</div>

                        </div>
                              
                        <div>
                            <button type="submit" class="btn btn-big">Update</button>
                        </div>
                    </form>

                </div>

            </div>
            <!-- // Admin Content -->

        </div>
        <!-- // Page Wrapper -->



        <!-- JQuery -->
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Ckeditor -->
        <script
            src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
        <!-- Custom Script -->
        <script src="../../js/scripts.js"></script>

    </body>

</html>