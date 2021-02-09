<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , ma.noobs.pet.model.Currency , ma.noobs.pet.model.Category , ma.noobs.pet.dao.CategoryDao,ma.noobs.pet.model.Pet , ma.noobs.pet.dao.PetDao"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%
CategoryDao cd = new CategoryDao();
List<Category> allcategory = cd.getAll();
request.setAttribute("allcateg", allcategory);

PetDao petDao = new PetDao();
List<Pet> allpets = petDao.getAll();
request.setAttribute("newPets", allpets);
int id = Integer.parseInt(request.getParameter("id"));
Pet onePet = petDao.get(id);
request.setAttribute("onePet", onePet);

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

        <title>Admin Pet - Delete Pet</title>
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

                    <h2 class="page-title">Delete Pet</h2>
	<form action="../../PetDelete?id=<%=onePet.getId()%>" method="post"> 
                   
                    	<div>
                            <img style="height:87px;width: 93px;" src="<c:out value="<%=onePet.getPicture()%>"/>" alt="" title="" class="thumb" border="0" />
                        </div>
                        <div>
                            <label>Id</label>
                                <input type="text" name="name" class="text-input" value="<%=onePet.getId()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>Name</label>
                                <input type="text" name="name" class="text-input" value="<%=onePet.getName()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>Picture</label>
                            <input type="text" name="picture" class="text-input" value="<%=onePet.getPicture()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>Description</label>
                            <input type="text" name="description" class="text-input" value="<%=onePet.getDescription()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>Details</label>
                            <input type="text" name="details" class="text-input" value="<%=onePet.getDetails()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>Price</label>
                            <input type="text" name="price" class="text-input" value="<%=onePet.getPrice()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>Promotion</label>
                            <input type="text" name="promotion" class="text-input" value="<%=onePet.getPromotion()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>isSpecial</label>
                            <input type="text" name="isspecial" class="text-input" value="<%=onePet.isSpecial()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>isNew</label>
                            <input type="text" name="isnew" class="text-input" value="<%=onePet.isNew()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>idCategory</label>
							<input type="text" name="isnew" class="text-input" value="<%=onePet.getCategory().getId()%>" disabled="disabled"/>
                        </div>
                        <div>
                            <label>isFeatured</label>
                            <input type="text" name="isfeatured" class="text-input" value="<%=onePet.isFeatured()%>" disabled="disabled"/>
                        </div>        
                        <div>
                            <button type="submit" class="btn btn-big">Delete</button>
                            
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