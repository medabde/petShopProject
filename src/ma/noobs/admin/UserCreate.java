package ma.noobs.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.dao.UserDao;
import ma.noobs.pet.model.User;

/**
 * Servlet implementation class UserCreate
 */
@WebServlet("/UserCreate")
public class UserCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreate() {
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
		String username = request. getParameter("username");
		String password = request. getParameter("password");
		String email = request. getParameter("email");
		String phone = request. getParameter("phone");
		String company = request. getParameter("company");
		String address = request. getParameter("address");
		boolean isadmin = Boolean.parseBoolean(request. getParameter("isadmin"));
		User u = new User(username, password, email, phone, company, address, isadmin);
		UserDao ud = new UserDao();
		ud.save(u);
		response.sendRedirect("./admin/User/AdminUser.jsp");
	}

}
