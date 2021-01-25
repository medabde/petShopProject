<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import='ma.noobs.pet.dao.* , ma.noobs.pet.model.*'%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%

try{	
	PetDao petDao = new PetDao();
	Pet pet = petDao.get(Integer.parseInt(request.getParameter("id")));
	if(pet==null) response.sendRedirect("home.jsp");
	request.setAttribute("pet", pet);
	request.setAttribute("relatedPets",petDao.getFromCat((long)pet.getCategory().getId()) );
	Currency c =(Currency)session.getAttribute("currency");
	
	request.setAttribute("currencyCode", c.getCode());
	request.setAttribute("currencyMultiplier", c.getMultiplier());
	
	double d = (double) request.getAttribute("currencyMultiplier");
	/*
	HashMap<String,String> hash = new HashMap<>();

	hash.put("idcategory", String.valueOf(4));
	
	
	
	petDao.update(pet,hash);
	*/
}catch(Exception e){
	response.sendRedirect("home.jsp");
}


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="style.css" />
	<link rel="stylesheet" href="lightbox.css" type="text/css" media="screen" />
	
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/java.js"></script>
</head>
<body>
<div id="wrap">

       <jsp:include page="pageParts/head.jsp" flush="true">
		    <jsp:param name="page" value="details"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="home.jsp">home</a> &gt;&gt; <c:out value="${pet.getName()}"/>
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span><c:out value="${pet.getName()}"/></div>
        
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img"><a href="details.jsp?id=${pet.getId()}"><img style="height:87px;width: 93px;" src="${pet.getPicture()}" alt="" title="" border="0" /></a>
                <br /><br />
                <a href="images/big_pic.jpg" rel="lightbox"><img src="images/zoom.gif" alt="" title="" border="0" /></a>
                </div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">${messages.getString('price_Details_title') }</div>
                    <p class="details">${pet.getDescription()}</p>
                    <div class="price"><strong>${messages.getString('price_Details_content_price') }:</strong> <span class="red">${String.format("%.2f", pet.getPrice() * currencyMultiplier)} ${currencyCode}</span></div>
                    <a href="./PlaceOrder?id=${pet.getId()}" class="more"><img src="images/order_now.gif" alt="" title="" border="0" /></a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
              
            <div id="demo" class="demolayout">

                <ul id="demo-nav" class="demolayout">
                <li><a class="active" href="#tab1">${messages.getString('price_Details_content_more_details') }</a></li>
                <li><a class="" href="#tab2">${messages.getString('price_Details_content_related_books') }</a></li>
                </ul>
    
            <div class="tabs-container">
            
                    <div style="display: block;" class="tab" id="tab1">
                                        <p class="more_details">${pet.getDetails()}
                                        </p>                     
                    </div>	
                    
                            <div style="display: none;" class="tab" id="tab2">
                    
                    
                    <%int j=0; %>
                    <c:forEach items="${relatedPets}" var="mapet">
		                        <%if(j==5)break;else j++; %>
		                        <c:if test="${mapet.getId() != pet.getId()}">
								   <div class="new_prod_box">
			                        <a href="details.jsp?id=${mapet.getId()}">${mapet.getName()}</a>
			                        <div class="new_prod_bg">
			                        <a href="details.jsp?id=${mapet.getId()}"><img style="height:87px;width: 93px;" src="${mapet.getPicture()}" alt="" title="" class="thumb" border="0" /></a>
			                        </div>           
			                    </div>
								</c:if>
					</c:forEach>
                    <div class="clear"></div>
                            </div>	
            
            </div>


			</div>
            

            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <%@include file="pageParts/side.jsp" %>
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <%@include file="pageParts/footer.jsp" %>
    

</div>
<script type="text/javascript">

var tabber1 = new Yetii({
id: 'demo'
});

</script>

</body>
</html>