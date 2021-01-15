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
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("home")) out.print("class=\"selected\" "); %> ><a href="home.jsp">home</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("about")) out.print("class=\"selected\" "); %> ><a href="about.jsp">about us</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("categories")) out.print("class=\"selected\" "); %>  ><a href="categorieslist.jsp" >pets</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("specials")) out.print("class=\"selected\" "); %> ><a href="specials.jsp" >specials pets</a></li>
            <li><a href="login.jsp" >my account</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("register")) out.print("class=\"selected\" "); %> ><a href="register.jsp">register</a></li>
            <li><a href="details.jsp">prices</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("contact")) out.print("class=\"selected\" "); %> ><a href="contact.jsp">contact</a></li>
            </ul>
        </div>     
</div> 
       
       