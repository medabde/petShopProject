package ma.noobs.pet.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangeLanguage
 */
@WebServlet("/ChangeLanguage")
public class ChangeLanguage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeLanguage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResourceBundle messages;
		
		if(request.getParameter("ln")==null) {
			messages = ResourceBundle.getBundle("MessagesBundleEN", new Locale("en", "US"));
			
		}else {
			switch (request.getParameter("ln")) {
			case "en":
				messages = ResourceBundle.getBundle("MessagesBundleEN", new Locale("en", "US"));
				break;
			case "fr":
				messages = ResourceBundle.getBundle("MessagesBundleFR", new Locale("fr", "FR"));
				break;
			case "de":
				messages = ResourceBundle.getBundle("MessagesBundleDE", new Locale("de", "GM"));
				break;

			default:
				messages = ResourceBundle.getBundle("MessagesBundleEN", new Locale("en", "US"));
				break;
			}
		}
		
		
		
		request.getSession().setAttribute("messages", messages);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp") ;
	    
	    requestDispatcher.forward(request, response) ;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
