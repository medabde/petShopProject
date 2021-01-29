<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , ma.noobs.pet.model.Currency ,ma.noobs.pet.model.Order, ma.noobs.pet.model.Category , ma.noobs.pet.dao.CategoryDao,ma.noobs.pet.model.Pet , ma.noobs.pet.dao.PetDao"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
	CategoryDao dao = new CategoryDao();
	PetDao petdao = new PetDao();
	
	List<Category> categories = dao.getAll();
	List<Pet> promotedPets = petdao.getPromotedPets();
	request.setAttribute("cats", categories);
	request.setAttribute("promotedPets", promotedPets);
	
	Currency curr =(Currency)session.getAttribute("currency");
	
	request.setAttribute("currencyCode", curr.getCode());
	request.setAttribute("currencyMultiplier", curr.getMultiplier());
	
	List<Order> o = (List) request.getSession().getAttribute("orders"); 
	double total =0.0;
	for(int i = 0;i< o.size();i++){
		total += (o.get(i).getPet().getPrice()*o.get(i).getQuantity());
	}
	request.setAttribute("total", total);
	
	
%>

<div class="right_content">
        	<div class="languages_box">
            <span class="red">Languages:</span>
            <a href="./ChangeLanguage?ln=en" <% 
         if(((ResourceBundle)request.getSession().getAttribute("messages")).getBaseBundleName().equals("MessagesBundleEN")) out.println("class='selected'");
         %>><img src="images/gb.gif" alt="" title="" border="0" /></a>
            <a href="./ChangeLanguage?ln=fr" <% 
         if(((ResourceBundle)request.getSession().getAttribute("messages")).getBaseBundleName().equals("MessagesBundleFR")) out.println("class='selected'");
         %>><img src="images/fr.gif" alt="" title="" border="0" /></a>
            <a href="./ChangeLanguage?ln=de" <% 
         if(((ResourceBundle)request.getSession().getAttribute("messages")).getBaseBundleName().equals("MessagesBundleDE")) out.println("class='selected'");
         %>><img src="images/de.gif" alt="" title="" border="0" /></a>
            </div>
                <div class="currency">
                <span class="red">Currency: </span>
                <a href="./ChangeCurrency?curr=GBP"
                <% 
         if(((Currency)request.getSession().getAttribute("currency")).getName().equals("GBP")) out.println("class='selected'");
         %>
                >GBP</a>
                <a href="./ChangeCurrency?curr=EUR"
                <% 
         if(((Currency)request.getSession().getAttribute("currency")).getName().equals("EUR")) out.println("class='selected'");
         %>
                >EUR</a>
                <a href="./ChangeCurrency?curr=USD" 
                <% 
         if(((Currency)request.getSession().getAttribute("currency")).getName().equals("USD")) out.println("class='selected'");
         %>
                >USD</a>
                </div>
                
                
              <div class="cart">
                  <div class="title"><span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>${messages.getString('My_cart') }</div>
                  <div class="home_cart_content">
                  ${orders.size()} x ${messages.getString('home_cart_content') } | <span class="red">${messages.getString('home_cart_content_TOTAL')}: ${String.format("%.2f", total * currencyMultiplier)} ${currencyCode}</span>
                  </div>
                  <a href="cart.jsp" class="view_cart">${messages.getString('home_cart_content_view_cart') }</a>
              
              </div>
                       
            	
        
        
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>${messages.getString('About_Our_Shop_title') }</div> 
             <div class="about">
             <p>
             <img src="images/about.gif" alt="" title="" class="right" />
             ${messages.getString("about_our_shop_info") }
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>Promotions</div> 
                    
                    <%int i=0; %>
                    <c:forEach items="${promotedPets}" var="pet">
		                        <%if(i==3)break;else i++; %>
		                        <div class="new_prod_box">
			                        <a href="details.jsp?id=${pet.getId()}">${pet.getName()}</a>
			                        <div class="new_prod_bg">
			                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
			                        <a href="details.jsp?id=${pet.getId()}"><img style="height:87px;width: 93px;" src="${pet.getPicture()}" alt="" title="" class="thumb" border="0" /></a>
			                        </div>           
			                    </div>
	                        
					</c:forEach>
                              
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>${messages.getString('Categories_title') }</div> 
                
                <ul class="list">
                <li><a href="./category.jsp?id=0&page=1">All</a></li>
	                <c:forEach items="${cats}" var="cat">
	                	<li><a href="./category.jsp?id=<c:out value="${cat.getId()}"/>&page=1"><c:out value="${cat.getName()}"/></a></li>
	                </c:forEach>                                      
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>${messages.getString('Partners_title') }</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#">pets gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">pets gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>                              
                </ul>      
             
             </div>         
             
        
</div>
        
        
       