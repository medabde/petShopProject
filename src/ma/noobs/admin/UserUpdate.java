package ma.noobs.admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.dao.UserDao;
import ma.noobs.pet.model.User;

/**
 * Servlet implementation class UserUpdate
 */
@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdate() {
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
		
		long id = Integer.parseInt(request.getParameter("id"));
		String username = request. getParameter("username");
		String password = request. getParameter("password");
		String email = request. getParameter("email");
		String phone = request. getParameter("phone");
		String company = request. getParameter("company");
		String address = request. getParameter("address");
		String isadmin = request. getParameter("isadmin");
		if(isadmin.equals("true")) { isadmin = "1";}
		if(isadmin.equals("false")) {isadmin = "0";}
		
		HashMap<String,String> map = new HashMap<>();
		map.put("username", username);
		map.put("password", password);
		map.put("email", email);
		map.put("phone", phone);
		map.put("company", company);
		map.put("address", address);
		map.put("isadmin", isadmin);
		
		UserDao ud = new UserDao();
		User u = ud.get(id);
		ud.update(u, map);
		response.sendRedirect("./admin/User/AdminUser.jsp");
		
	}

}
