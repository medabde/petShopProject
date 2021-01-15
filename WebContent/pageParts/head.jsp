<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.* , ma.noobs.pet.model.Currency"%>
<%
if(request.getSession().getAttribute("messages") == null){
	ResourceBundle messagesEN = ResourceBundle.getBundle("MessagesBundleEN", new Locale("en", "US"));
	request.getSession().setAttribute("messages", messagesEN);
}
if(request.getSession().getAttribute("currency")==null){
	Currency curr = new Currency("USD",9.0,"&#36;");
	request.getSession().setAttribute("currency", curr);
}

%>



<div class="header">
       		<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("home")) out.print("class=\"selected\" "); %> ><a href="home.jsp">Home</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("about")) out.print("class=\"selected\" "); %> ><a href="about.jsp">About Us</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("categories")) out.print("class=\"selected\" "); %>  ><a href="categorieslist.jsp" >Categories</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("specials")) out.print("class=\"selected\" "); %> ><a href="specials.jsp" >Special Pets</a></li>
            <li><a href="login.jsp" >my account</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("register")) out.print("class=\"selected\" "); %> ><a href="register.jsp">Register</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("contact")) out.print("class=\"selected\" "); %> ><a href="contact.jsp">Contact Us</a></li>
            </ul>
        </div>     
</div> 
       
       