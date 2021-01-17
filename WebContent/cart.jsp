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
		    <jsp:param name="page" value="cart"/>
		</jsp:include>
       
       <%
       Currency cu =(Currency)session.getAttribute("currency");

       	request.setAttribute("currencyCode", cu.getCode());
       	request.setAttribute("currencyMultiplier", cu.getMultiplier());
       	
       	List<Order> or = (List) request.getSession().getAttribute("orders"); 
       	double totalCart =0.0;
       	for(int i = 0;i< or.size();i++){
       		totalCart += (or.get(i).getPet().getPrice()*or.get(i).getQuantity());
       	}
       	request.setAttribute("total", totalCart);
       	

       %>
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My cart</div>
        
        	<div class="feat_prod_box_details">
            
            <table class="cart_table">
            	<tr class="cart_title">
                	<td>Item pic</td>
                	<td>Book name</td>
                    <td>Unit price</td>
                    <td>Qty</td>
                    <td>Total</td>               
                </tr>
                
               <c:forEach items="${orders}" var="order">
                    
                    <tr>
	                	<td><a href="details.jsp?id=<c:out value="${order.getPet().getId()}"/>"><img style="height:37px;width: 35px;" src="<c:out value="${order.getPet().getPicture()}"/>" alt="" title="" border="0" class="cart_thumb" /></a></td>
	                	<td>${order.getPet().getName()}</td>
	                    <td>${String.format("%.2f", order.getPet().getPrice() * currencyMultiplier)} ${currencyCode}</td>
	                    
	                    
	                    <td>${order.getQuantity()}</td>
	                    <td>${String.format("%.2f", order.getPet().getPrice() * currencyMultiplier * order.getQuantity())} ${currencyCode}</td>               
                	</tr>  
                   </c:forEach>
                
                

                <tr>
                <td colspan="4" class="cart_total"><span class="red">TOTAL SHIPPING:</span></td>
                <td> Free Shipping!</td>                
                </tr>  
                
                <tr>
                <td colspan="4" class="cart_total"><span class="red">TOTAL:</span></td>
                <td> ${String.format("%.2f", total * currencyMultiplier)} ${currencyCode}</td>                
                </tr>                  
            
            </table>



             <a href="home.jsp" class="continue">&lt; continue</a>
            <a href="#" class="checkout">checkout&gt;</a> 
            
            </div>	
            
              

            

            
        <div class="clear"></div>
        </div><!--end of left content-->
        
       <%@include file="pageParts/side.jsp" %>
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <%@include file="pageParts/footer.jsp"  %>
    

</div>

</body>
</html>