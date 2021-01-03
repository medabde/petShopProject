<div class="header">
       		<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("home")) out.print("class=\"selected\" "); %> ><a href="home.jsp">home</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("about")) out.print("class=\"selected\" "); %> ><a href="about.jsp">about us</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("category")) out.print("class=\"selected\" "); %>  ><a href="category.jsp" >pets</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("specials")) out.print("class=\"selected\" "); %> ><a href="specials.jsp" >specials pets</a></li>
            <li><a href="login.jsp" >my account</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("register")) out.print("class=\"selected\" "); %> ><a href="register.jsp">register</a></li>
            <li><a href="details.jsp">prices</a></li>
            <li <%if(request.getParameter("page")!=null)if(request.getParameter("page").equals("contact")) out.print("class=\"selected\" "); %> ><a href="contact.jsp">contact</a></li>
            </ul>
        </div>     
            
            
</div> 
       
       