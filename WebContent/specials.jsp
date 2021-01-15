<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
PetDao petDao = new PetDao();
List<Pet> specialpets = petDao.getSpecialPets();
request.setAttribute("specialPets", specialpets);

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
		    <jsp:param name="page" value="specials"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Special gifts</div>
        
        <c:forEach items="${specialPets}" var="pet">
		        	<div class="feat_prod_box">
		            
		            	<div class="prod_img"><a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><img style="height:118px;width: 125px;" src="<c:out value="${pet.getPicture()}"/>" alt="" title="" border="0" /></a></div>
		                
		                <div class="prod_det_box">
                           	<span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
		                	<div class="box_top"></div>
		                    <div class="box_center">
		                    <div class="prod_title"><c:out value="${pet.getName()}"/></div>
		                    <p class="details"><c:out value="${pet.getDescription()}"/></p>
		                    <a href="details.jsp?id=<c:out value="${pet.getId()}"/>" class="more">- more details -</a>
		                    <div class="clear"></div>
		                    </div>
		                    
		                    <div class="box_bottom"></div>
		                </div>    
		            <div class="clear"></div>
		            </div>	
	            </c:forEach>            
            
                      <div class="pagination">
            <span class="disabled"><<</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>...<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
            </div>   
                     
            
        <div class="clear"></div>
        </div><!--end of left content-->
        <%@include file="pageParts/side.jsp" %>
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <%@include file="pageParts/footer.jsp" %>
    

</div>

</body>
</html>