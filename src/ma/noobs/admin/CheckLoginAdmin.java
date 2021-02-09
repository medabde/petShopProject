package ma.noobs.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.dao.UserDao;
import ma.noobs.pet.model.User;

/**
 * Servlet implementation class CheckLoginAdmin
 */
@WebServlet("/CheckLoginAdmin")
public class CheckLoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLoginAdmin() {
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
		boolean isRememberMe = (request.getParameter("terms")==null)?false:true;
		
		
		UserDao dao = new UserDao();
		User admin = dao.checkLogin(username, pass, true);
		if(admin != null) {
			if(isRememberMe) {
				Cookie adminId = new Cookie("adminId", admin.getId()+"");
				adminId.setMaxAge(3600000);
				response.addCookie(adminId);
			}
			
			request.getSession().invalidate();
			request.getSession().setAttribute("admin", admin);
			response.sendRedirect("./admin/Pet/AdminPet.jsp");
		}else {
			request.setAttribute("errorMessage", "Username or Password Incorrect!");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("./admin/AdminLogin.jsp") ;
		    requestDispatcher.forward(request, response) ;*/
		    response.sendRedirect("./admin/AdminLogin.jsp");
		}
	}

}
