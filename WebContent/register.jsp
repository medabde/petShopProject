<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	if(request.getSession().getAttribute("user")!=null) response.sendRedirect("myAccount.jsp");
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
		    <jsp:param name="page" value="register"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>${messages.getString('nav_bar_register')}</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
             Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">${messages.getString('from_register') }</div>
                 <form name="register" action="./CheckRegister" method="post">          
                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString('form_Username') }:</strong></label>
                    <input type="text" name="username" class="contact_input" required/>
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString('form_Password') }:</strong></label>
                    <input type="password" name="pass" class="contact_input" required/>
                    </div> 

                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString('form_Email') }:</strong></label>
                    <input type="email" name="email" class="contact_input" required/>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString('form_Phone') }:</strong></label>
                    <input type="text" name="phone" class="contact_input"required />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString('form_Company') }:</strong></label>
                    <input type="text" name="company" class="contact_input" required/>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString('form_Adrress') }:</strong></label>
                    <input type="text" name="address" class="contact_input" required />
                    </div>                    

                    <div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" required />
                        ${messages.getString('form_checkbox_register') } <a href="#">terms &amp; conditions</a>                        </div>
                    </div> 
                    <p style="color:red">
                    	${errorMessage}
                    </p>
                    
                    <div class="form_row">
                    <input type="submit" class="register" value="${messages.getString('nav_bar_register')}" />
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