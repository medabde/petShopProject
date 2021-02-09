package ma.noobs.pet.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.dao.UserDao;
import ma.noobs.pet.model.User;

/**
 * Servlet implementation class Updateuser
 */
@WebServlet("/Updateuser")
public class Updateuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updateuser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String i=request.getParameter("id");
		i.trim();
		int id = Integer.parseInt(i);
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String company = request.getParameter("company");
		String address = request.getParameter("address");
		
	    HashMap <String,String> hash = new HashMap<>();
	    hash.put("username", username);
	    hash.put("email", email);
	    hash.put("phone", phone);
	    hash.put("company",company);
	    hash.put("address", address);
	    
	    
		UserDao dao = new UserDao();
		
		dao.update(dao.get(id),hash);
		User user=dao.get(id);
		request.getSession().setAttribute("user", user);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("myAccount.jsp") ;
	    requestDispatcher.forward(request, response) ;
	}

}
