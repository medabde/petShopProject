<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import='ma.noobs.pet.dao.* , ma.noobs.pet.model.*'%>
    
<%
   
	if(request.getSession().getAttribute("user")==null) response.sendRedirect("login.jsp");
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
		    <jsp:param name="page" value="myAccount"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My Account</div>
         
          <div class="feat_prod_box_details">
            <p class="details">
             Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">My account</div>
                 <form name="register" action="Updateuser" method="post">          
                    <div class="form_row">
	                    <input type="hidden" class="contact_input" name="id" value="${user.getId()}"/>
                    </div>
                    <div class="form_row">
	                    <label class="contact"><strong>${messages.getString('form_Username') }:</strong></label>
	                    <input type="text" class="contact_input" name="username" value="${user.getUsername()}"/>
                    </div> 
                    <div class="form_row">
	                    <label class="contact"><strong>${messages.getString('form_Email') }:</strong></label>
	                    <input type="text" class="contact_input" name="email" value="${user.getEmail()}"/>
                    </div>  
                    <div class="form_row">
	                    <label class="contact"><strong>${messages.getString('form_Phone') }:</strong></label>
	                    <input type="text" class="contact_input" name="phone" value="${user.getPhone()}" />
                    </div>
                    <div class="form_row">
	                    <label class="contact"><strong>${messages.getString('form_Adrress') }:</strong></label>
	                    <input type="text" class="contact_input" name="address" value="${user.getAddress()}"/>
                    </div>
                     <div class="form_row">
	                    <label class="contact"><strong>${messages.getString('form_Company') }:</strong></label>
	                    <input type="text" class="contact_input" name="company" value="${user.getCompany()}" />
                    </div>   
                                         
                    <div class="form_row">
                    	<input type="submit" class="register"  value="Edit" />
                    </div>   
                    
                  </form>
                    
                </div>  
            
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