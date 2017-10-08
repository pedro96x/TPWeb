package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controladores.CtrlLogin;
import controladores.CtrlPersona;

/**
 * Servlet implementation class EliminarPersona
 */
@WebServlet("/EliminarPersona")
public class EliminarPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarPersona() {
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
		
		String dni=request.getParameter("dni");
		try {
			int dniPersona = Integer.parseInt(dni);
		
		
		CtrlPersona ctrlPersona = new CtrlPersona();
		
		ctrlPersona.baja(dniPersona);
		
		
		} catch (NumberFormatException e) {
		      //Will Throw exception!
		      //do something! anything to handle the exception.
		}
		CtrlPersona ctrl= new CtrlPersona();
		request.setAttribute("listaPersonas", ctrl.getAll());
		request.getRequestDispatcher("WEB-INF/ABMPersonasWeb.jsp").forward(request, response);
		
	}

}
