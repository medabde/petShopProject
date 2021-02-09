package ma.noobs.admin;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.dao.CategoryDao;
import ma.noobs.pet.dao.PetDao;
import ma.noobs.pet.model.Pet;

/**
 * Servlet implementation class PetCreate
 */
@WebServlet("/PetCreate")
public class PetCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetCreate() {
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
		
		String name = request. getParameter("name");
		String picture = request. getParameter("picture");
		String description = request. getParameter("description");
		String details = request. getParameter("details");
		double price = Double.parseDouble(request. getParameter("price"));
		int promotion = Integer.parseInt(request. getParameter("promotion"));
		boolean isSpecial = Boolean.parseBoolean(request. getParameter("isspecial"));
		boolean isNew = Boolean.parseBoolean(request. getParameter("isnew"));
		int idCategory = Integer.parseInt(request. getParameter("idcategory"));
		boolean isFeatured = Boolean.parseBoolean(request. getParameter("isfeatured"));
		CategoryDao C = new CategoryDao();
		Pet t = new Pet(name, picture, description, price, details, promotion, isSpecial, isNew, isFeatured, C.get(idCategory));
		PetDao pd = new PetDao();
		pd.save(t);
		response.sendRedirect("./admin/Pet/AdminPet.jsp");
		
	}

}
