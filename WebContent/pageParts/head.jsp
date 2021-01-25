<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , ma.noobs.pet.model.Currency , ma.noobs.pet.model.Order , ma.noobs.pet.model.User,ma.noobs.pet.dao.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
if(request.getSession().getAttribute("messages") == null){
	ResourceBundle messagesEN = ResourceBundle.getBundle("MessagesBundleEN", new Locale("en", "US"));
	request.getSession().setAttribute("messages", messagesEN);
}
if(request.getSession().getAttribute("currency")==null){
	Currency curr = new Currency("USD",9.0,"&#36;");
	request.getSession().setAttribute("currency", curr);
}

if(request.getSession().getAttribute("user")==null){
	Cookie[] cookies = request.getCookies();
	UserDao dao = new UserDao();
	
	if (cookies != null) {
	 for (Cookie cookie : cookies) {
	   if (cookie.getName().equals("userId") && !cookie.getValue().equals("-1")) {
		   request.getSession().setAttribute("user",dao.get(Integer.parseInt(cookie.getValue())));
		}
	  }
	}
}


if(request.getSession().getAttribute("user")==null){
	if(request.getSession().getAttribute("orders")==null) request.getSession().setAttribute("orders", new ArrayList<Order>());
}else{
	OrderDao dao = new OrderDao();
	List<Order> orders = dao.getUserOrders(((User)request.getSession().getAttribute("user")).getId());
	if(request.getSession().getAttribute("orders")==null) request.getSession().setAttribute("orders", orders);
}

%>



<div class="header">
       		<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("home")) out.print("class=\"selected\" "); %> ><a href="home.jsp">${messages.getString('nav_bar_home_pet') }</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("about")) out.print("class=\"selected\" "); %> ><a href="about.jsp">${messages.getString('nav_bar_about_pet') }</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("pets")) out.print("class=\"selected\" "); %>  ><a href="category.jsp?id=0&page=1" >${message.getString('nav_bar_pet')}</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("specials")) out.print("class=\"selected\" "); %> ><a href="specials.jsp?page=1" >${messages.getString('nav_bar_specials_pets') }</a></li>
                        
            <c:if test="${user == null}">
	            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("register")) out.print("class=\"selected\" "); %> ><a href="register.jsp">${messages.getString('nav_bar_register') }</a></li>
				
	            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("login")) out.print("class=\"selected\" "); %> ><a href="login.jsp">${messages.getString('nav_bar_login')}</a></li>
            
			</c:if>
			<c:if test="${user != null}">
			
	            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("myAccount")) out.print("class=\"selected\" "); %>  ><a href="myAccount.jsp" >${messages.getString('nav_bar_my_account') }</a></li>
					
                <li><a href="./Disconnect" >Disconnect</a></li>
	            
			</c:if>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("contact")) out.print("class=\"selected\" "); %> ><a href="contact.jsp">${messages.getString('nav_bar_contact') }</a></li>
            
            </ul>
        </div>     
</div> 
       
       