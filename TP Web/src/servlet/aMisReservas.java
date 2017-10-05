package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import controladores.CtrlPersona;
import controladores.CtrlReserva;
import entidades.Persona;

/**
 * Servlet implementation class aMisReservas
 */
@WebServlet("/aMisReservas")
public class aMisReservas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aMisReservas() {
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
//		doGet(request, response);
		
		try {
			CtrlReserva ctrl= new CtrlReserva();
			
			if ((Persona) request.getSession().getAttribute("user")!=null &&
					(ctrl.getReservasAFututoByIdPersona(((Persona) request.getSession().getAttribute("user")).getId()) != null)){
			int id = ((Persona) request.getSession().getAttribute("user")).getId();
			request.setAttribute("listaReservas", ctrl.getReservasAFututoByIdPersona(id));
			
			request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
			
					
//			request.setAttribute("listaReservas", ctrl.getReservasAFututoByIdPersona(4));
			
			request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
