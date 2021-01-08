<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , ma.noobs.pet.model.Currency"%>

<div class="right_content">
        	<div class="languages_box">
            <span class="red">Languages:</span>
            <a href="./ChangeLanguage?ln=en&page=<%= request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1) %>" <% 
         if(((ResourceBundle)request.getSession().getAttribute("messages")).getBaseBundleName().equals("MessagesBundleEN")) out.println("class='selected'");
         %>><img src="images/gb.gif" alt="" title="" border="0" /></a>
            <a href="./ChangeLanguage?ln=fr&page=<%= request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1) %>" <% 
         if(((ResourceBundle)request.getSession().getAttribute("messages")).getBaseBundleName().equals("MessagesBundleFR")) out.println("class='selected'");
         %>><img src="images/fr.gif" alt="" title="" border="0" /></a>
            <a href="./ChangeLanguage?ln=de&page=<%= request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1) %>" <% 
         if(((ResourceBundle)request.getSession().getAttribute("messages")).getBaseBundleName().equals("MessagesBundleDE")) out.println("class='selected'");
         %>><img src="images/de.gif" alt="" title="" border="0" /></a>
            </div>
                <div class="currency">
                <span class="red">Currency: </span>
                <a href="./ChangeCurrency?curr=GBP&page=<%= request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1) %>"
                <% 
         if(((Currency)request.getSession().getAttribute("currency")).getName().equals("GBP")) out.println("class='selected'");
         %>
                >GBP</a>
                <a href="./ChangeCurrency?curr=EUR&page=<%= request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1) %>"
                <% 
         if(((Currency)request.getSession().getAttribute("currency")).getName().equals("EUR")) out.println("class='selected'");
         %>
                >EUR</a>
                <a href="./ChangeCurrency?curr=USD&page=<%= request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1) %>" 
                <% 
         if(((Currency)request.getSession().getAttribute("currency")).getName().equals("USD")) out.println("class='selected'");
         %>
                >USD</a>
                </div>
                
                
              <div class="cart">
                  <div class="title"><span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>My cart</div>
                  <div class="home_cart_content">
                  3 x items | <span class="red">TOTAL: 100$</span>
                  </div>
                  <a href="cart.html" class="view_cart">view cart</a>
              
              </div>
                       
            	
        
        
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About Our Shop</div> 
             <div class="about">
             <p>
             <img src="images/about.gif" alt="" title="" class="right" />
             Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>Promotions</div> 
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>              
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>Categories</div> 
                
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
                <li><a href="#">pets gifts</a></li>
                <li><a href="#">specials</a></li>                                              
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>Partners</div> 
                
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
        
        
       