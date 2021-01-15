package ma.noobs.pet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.model.Currency;

/**
 * Servlet implementation class ChangeCurrency
 */
@WebServlet("/ChangeCurrency")
public class ChangeCurrency extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCurrency() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String res;
		Currency curr;
		
		if(request.getParameter("curr")==null) {
			curr = new Currency("USD",9.0,"&#36;");
		}else {
			switch (request.getParameter("curr")) {
			case "USD":
				curr = new Currency("USD",9.0,"&#36;");
				break;
			case "EUR":
				curr = new Currency("EUR",11.0,"&euro;");
				break;
			case "GBP":
				curr = new Currency("GBP",12.0,"&#8367;");
				break;
			default:
				curr = new Currency("USD",9.0,"&#36;");
				break;
			}
		}
		
		
		
		request.getSession().setAttribute("currency", curr );
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp") ;
	    
	    requestDispatcher.forward(request, response) ;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
