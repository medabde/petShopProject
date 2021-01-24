package ma.noobs.pet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.dao.UserDao;
import ma.noobs.pet.model.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/CheckRegister")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String username = request.getParameter("username").trim().toLowerCase();
		String pass = request.getParameter("pass");
		String email = request.getParameter("email").trim().toLowerCase();
		String phone = request.getParameter("phone");
		String company = request.getParameter("company");
		String address = request.getParameter("address");
		
		UserDao dao = new UserDao();
		
		if(dao.isUserNameExist(username) || dao.isEmailExist(email) ) {
			request.setAttribute("errorMessage", "Username or Email taken .. choose another one!");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp") ;
		    requestDispatcher.forward(request, response) ;
		    return;
			
		}
		
		User newUser = new User(username,pass,email,phone,company,address,false);
		dao.save(newUser);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("./CheckLogin") ;
	    requestDispatcher.forward(request, response) ;
	    return;
	}

}
