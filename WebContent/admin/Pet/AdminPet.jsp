<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , ma.noobs.pet.model.Currency , ma.noobs.pet.model.Category , ma.noobs.pet.dao.CategoryDao,ma.noobs.pet.model.Pet , ma.noobs.pet.dao.PetDao"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%
PetDao petDao = new PetDao();
List<Pet> allpets = petDao.getAll();
request.setAttribute("newPets", allpets);
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

        <title>Admin Pet</title>
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
                    <a href="AdminPetCreate.jsp" class="btn btn-big">Add Pet</a>
                    <a href="AdminPet.jsp" class="btn btn-big">Manage Pets</a>
                </div>


                <div class="content">

                    <h2 class="page-title">Manage Pets</h2>


           <table>
           <thead><th>Picture</th><th>Id</th><th>Name</th><th>Description</th><th>Details</th><th>Price</th><th>Promotion</th>
           <th>isSpecial</th><th>isNew</th><th>isFeatured</th><th>idCategory</th></thead>
           <tbody>
	           		<c:forEach items="${newPets}" var="pet">
	           		<tr>
	           		<td> <a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><img style="height:50px;width: 50px;" src="<c:out value="${pet.getPicture()}"/>" alt="" title="" class="thumb" border="0" /></a></td>
	           		<td> <a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><c:out value="${pet.getId()}"/></a></td>
	           		<td> <a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><c:out value="${pet.getName()}"/></a></td>
					<td><c:out value="${pet.getDescription()}"/></td>
					<td><c:out value="${pet.getDetails()}"/></td>
					<td><c:out value="${pet.getPrice()}"/></td>
					<td><c:out value="${pet.getPromotion()}"/></td>
					<td><c:out value="${pet.isSpecial()}"/></td>
					<td><c:out value="${pet.isNew()}"/></td>		
					<td><c:out value="${pet.isFeatured()}"/></td>
					<td><c:out value="${pet.getCategory().getId()}"/></td>
					<td> <a href="AdminPetUpdate.jsp?id=<c:out value="${pet.getId()}"/>" class="edit">Edit</a></td>
					<td> <a href="AdminPetDelete.jsp?id=<c:out value="${pet.getId()}"/>" class="delete">Delete</a></td>
	           		
	           		</tr>
	           		

                    </c:forEach>  
                    </tbody>
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