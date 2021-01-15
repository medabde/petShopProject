<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ma.noobs.pet.model.Category , ma.noobs.pet.dao.CategoryDao"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
	CategoryDao catdao = new CategoryDao();
	List<Category> cats = catdao.getAll();
	request.setAttribute("cats", cats);
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
		    <jsp:param name="page" value="categories"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
        	<div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>Categories</div> 
                
                <ul class="list">
                	<li><a href="./category.jsp?id=0">All</a></li>
	                <c:forEach items="${cats}" var="cat">
	                	<li><a href="./category.jsp?id=<c:out value="${cat.getId()}"/>"><c:out value="${cat.getName()}"/></a></li>
	                </c:forEach>                                      
                </ul>
                
          
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <%@include file="pageParts/side.jsp" %>
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <%@include file="pageParts/footer.jsp"  %>
    

</div>

</body>
</html>