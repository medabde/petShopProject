<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import='ma.noobs.pet.dao.* , ma.noobs.pet.model.*'%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
PetDao petDao = new PetDao();
List<Pet> newpets = petDao.getNewPets();
List<Pet> featuredpets = petDao.getFeaturedPets();
request.setAttribute("newPets", newpets);
request.setAttribute("featuredPets", featuredpets);

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="style.css" />

</head>
<body>
<div id="wrap">

       
       <jsp:include page="pageParts/head.jsp" flush="true">
		    <jsp:param name="page" value="home"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>${messages.getString('home_title_principale') }</div>
	        	<c:forEach items="${featuredPets}" var="pet">
		        	<div class="feat_prod_box">
		            
		            	<div class="prod_img"><a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><img style="height:118px;width: 125px;" src="<c:out value="${pet.getPicture()}"/>" alt="" title="" border="0" /></a></div>
		                
		                <div class="prod_det_box">
		                	<div class="box_top"></div>
		                    <div class="box_center">
		                    <div class="prod_title"><c:out value="${pet.getName()}"/></div>
		                    <p class="details"><c:out value="${pet.getDescription()}"/></p>
		                    <a href="details.jsp?id=<c:out value="${pet.getId()}"/>" class="more">${messages.getString('special_more_details') }</a>
		                    <div class="clear"></div>
		                    </div>
		                    
		                    <div class="box_bottom"></div>
		                </div>    
		            <div class="clear"></div>
		            </div>	
	            </c:forEach>
            
        	
            
           <div class="title"><span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>${messages.getString('home_new_pet') }</div> 
           
           <div class="new_products">
           
	           		<c:forEach items="${newPets}" var="pet">
	                    <div class="new_prod_box">
	                        <a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><c:out value="${pet.getName()}"/></a>
	                        <div class="new_prod_bg">
	                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
	                        <a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><img style="height:87px;width: 93px;" src="<c:out value="${pet.getPicture()}"/>" alt="" title="" class="thumb" border="0" /></a>
	                        </div>           
	                    </div>
                    </c:forEach>     
            
            </div> 
          
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <%@include file="pageParts/side.jsp"  %>
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
       <%@include file="pageParts/footer.jsp"  %>
       
    

</div>

</body>
</html>