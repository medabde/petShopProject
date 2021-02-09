<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="ma.noobs.pet.dao.*"%>


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
		    <jsp:param name="page" value="contact"/>
		</jsp:include>
		
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>${messages.getString("nav_bar_contact_us_pet") }</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            ${messages.getString("contact_details")} 
            </p>
           
              	<div class="contact_form">
                <div class="form_subtitle">${messages.getString("form_contact") }</div>
                <form id="frmContact" name="frmContact" action="mailmessage.jsp" method="post">          
                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString("form_Username") }:</strong></label>
                    <input type="text" class="contact_input"  name="name" required/>
                    </div>  

                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString("form_Email")}:</strong></label>
                    <input type="email" class="contact_input" name="email" required/>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString("form_Phone") }:</strong></label>
                    <input type="text" class="contact_input"  name="phone" required/>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString("form_Company") }:</strong></label>
                    <input type="text" class="contact_input" name="phone" required/>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>${messages.getString("form_Message") }:</strong></label>
                    <textarea class="contact_textarea"  name="message" required></textarea>
                    </div>

                    
                    <div class="form_row">
                            <input type="submit"  name="submit" value="Send Mail"/>            
                            </div>  
                            
                        
                        
                </div>  
                </form>
                
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