package ma.noobs.pet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.noobs.pet.dao.OrderDao;
import ma.noobs.pet.dao.PetDao;
import ma.noobs.pet.model.Order;
import ma.noobs.pet.model.Pet;
import ma.noobs.pet.model.User;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int petid =Integer.parseInt(request.getParameter("id"));
		PetDao dao = new PetDao();
		Pet p = dao.get(petid);
		if(request.getSession().getAttribute("user")==null) {
			List<Order> os = (List)request.getSession().getAttribute("orders");
			for(int i=0;i<os.size();i++) {
				if(os.get(i).getPet().getId()==petid) {
					os.set(i, new Order(p,os.get(i).getQuantity()+1) );
					
					request.getSession().setAttribute("orders",os);
					
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp") ;
				    requestDispatcher.forward(request, response) ;
				    return;
					
				}
			}
			os.add(new Order(p,1) );
			request.getSession().setAttribute("orders",os);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp") ;
		    requestDispatcher.forward(request, response) ;
		    return;
			
			
		}else {
			User u = (User)request.getSession().getAttribute("user");
			Order o = new Order(u,p,1);
			OrderDao ordDao = new OrderDao();
			ordDao.save(o);
			
			List<Order> orders = ordDao.getUserOrders(((User)request.getSession().getAttribute("user")).getId());
			request.getSession().setAttribute("orders", orders);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp") ;
		    requestDispatcher.forward(request, response) ;
		    return;
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
