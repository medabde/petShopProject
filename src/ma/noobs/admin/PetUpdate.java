package ma.noobs.admin;

import java.io.IOException;
import java.util.HashMap;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.dao.PetDao;
import ma.noobs.pet.model.Pet;

/**
 * Servlet implementation class PetUpdate
 */
@WebServlet("/PetUpdate")
public class PetUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int id = Integer.parseInt(request.getParameter("id"));
		
		String name = request. getParameter("name");
		String picture = request. getParameter("picture");
		String description = request. getParameter("description");
		String details = request. getParameter("details");
		String price = request. getParameter("price");
		String promotion = request. getParameter("promotion");

		String isSpecial = request. getParameter("isspecial");
		if(isSpecial.equals("true")) { isSpecial = "1";}
		if(isSpecial.equals("false")) {isSpecial = "0";}

		String isNew = request. getParameter("isnew");
		if(isNew.equals("true")) { isNew = "1";}
		if(isNew.equals("false")) {isNew = "0";}

		String idCategory = request. getParameter("idcategory");
		
		String isFeatured = request. getParameter("isfeatured");
		if(isFeatured.equals("true")) { isFeatured = "1";}
		if(isFeatured.equals("false")) {isFeatured = "0";}

		HashMap<String,String> map = new HashMap<>();
		map.put("name", name);
		map.put("picture", picture);
		map.put("description", description);
		map.put("details", details);
		map.put("price", price);
		map.put("promotion", promotion);
		map.put("isSpecial", isSpecial);
		map.put("isNew", isNew);
		map.put("idcategory", idCategory);
		map.put("isFeatured", isFeatured);
		
		PetDao pd = new PetDao();
		Pet Onepet = pd.get(id);
		pd.update(Onepet,map);
		response.sendRedirect("./admin/Pet/AdminPet.jsp");
	}

}
