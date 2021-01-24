<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ma.noobs.pet.dao.* , ma.noobs.pet.model.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<%
	int petPerPage = 5;
	
	
	try{
		int pagenumb = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("page", pagenumb);
		
		
		CategoryDao catDao = new CategoryDao();
		PetDao petDao = new PetDao();
		if(Integer.parseInt(request.getParameter("id"))==0){
			List<Pet> pets = petDao.getAll();
			
			List<Pet> catPets = new ArrayList<>();
			for(int i=0;i<pets.size();i++){
				if(i< petPerPage * pagenumb && i>= petPerPage * (pagenumb-1)){
					catPets.add(pets.get(i));
				}
			}
			
			request.setAttribute("cat", new Category(0,"ALL"));
			
			int nbpages = (pets.size()%petPerPage == 0)?pets.size()/petPerPage:pets.size()/petPerPage+1;
			request.setAttribute("pets", catPets);
			request.setAttribute("nbPages", nbpages);
			request.setAttribute("totalPets", pets.size());
			
		}else{
			Category cat = catDao.get(Integer.parseInt(request.getParameter("id")));
			
			if(cat==null) response.sendRedirect("home.jsp");
			List<Pet> pets = petDao.getFromCat(cat.getId());
			
			List<Pet> catPets = new ArrayList<>();
			for(int i=0;i<pets.size();i++){
				if(i< petPerPage * pagenumb && i>= petPerPage * (pagenumb-1)){
					catPets.add(pets.get(i));
				}
			}
			
			int nbpages = (pets.size()%petPerPage == 0)?pets.size()/petPerPage:pets.size()/petPerPage+1;
			request.setAttribute("cat", cat);
			request.setAttribute("pets", catPets);
			request.setAttribute("nbPages", nbpages);
			request.setAttribute("totalPets", pets.size());
			
		}
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

</head>
<body>
<div id="wrap">

       <jsp:include page="pageParts/head.jsp" flush="true">
		    <jsp:param name="page" value="pets"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="./home.jsp">home</a> &gt;&gt; ${cat.getName()}( ${totalPets} )
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>${cat.getName()}</div>
           
           <div class="new_products">
    				<c:forEach items="${pets}" var="pet">
    					<div class="new_prod_box">
	                        <a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><c:out value="${pet.getName()}"/></a>
	                        <div class="new_prod_bg">
	                        <c:if test="${pet.isNew()}">
		                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
	                        	<span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
		                        
	                        </c:if>
	                        <c:if test="${pet.getPromotion() > 0}">
	                        	<span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
	                        </c:if>
	                        
	                        <a href="details.jsp?id=<c:out value="${pet.getId()}"/>"><img style="height:87px;width: 93px;" src="<c:out value="${pet.getPicture()}"/>" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
           			</c:forEach>
                                      
                    

            <div class="pagination">
            <c:choose>
				  <c:when test="${page -1 == 0}">
				  	<span class="disabled"><<</span>
				  </c:when>
				  <c:otherwise>
				  	<a href="category.jsp?id=${cat.getId()}&page=${page-1}"><<</a>
				  </c:otherwise>
				</c:choose>
           
            <c:forEach var="j" begin="1" end="${nbPages}">  
            	<c:choose>
				  <c:when test="${page == j}">
				  	<span class="current">${j}</span>
				  </c:when>
				  <c:otherwise>
				  	<a href="category.jsp?id=${cat.getId()}&page=${j}">${j}</a>
				  </c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				  <c:when test="${page == nbPages}">
				  	<span class="disabled">>></span>
				  </c:when>
				  <c:otherwise>
				  	<a href="category.jsp?id=${cat.getId()}&page=${page+1}">>></a>
				  </c:otherwise>
				</c:choose>
			
            </div>  
            
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