<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


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
		    <jsp:param name="page" value="about"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>${messages.getString('About_Our_Shop_title') }</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            <img src="images/about.gif" alt="" title="" class="right" /> 
              ${messages.getString("about_our_shop_info") }</p>
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