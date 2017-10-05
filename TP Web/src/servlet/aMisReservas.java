package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controladores.CtrlPersona;
import controladores.CtrlReserva;
import entidades.Persona;
import entidades.Reserva;

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
		
//		try {
//			CtrlReserva ctrl= new CtrlReserva();
//			int id = 0;
//			ArrayList<Reserva>listaRes=new ArrayList<Reserva>();
//			
//			 id = ((Persona) request.getSession().getAttribute("user")).getId();
//			
//			listaRes = ctrl.getReservasAFututoByIdPersona(id);
//			
////			if ((Persona) request.getSession().getAttribute("user")!=null &&
////					(ctrl.getReservasAFututoByIdPersona(((Persona) request.getSession().getAttribute("user")).getId()) != null)){
////				
////			 id = ((Persona) request.getSession().getAttribute("user")).getId();
//			
//			
//			request.setAttribute("listaReservas", listaRes);
//			
//			request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
//			
//					
////			request.setAttribute("listaReservas", ctrl.getReservasAFututoByIdPersona(4));
//			
////			request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
////			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		try{
			CtrlReserva ctrl= new CtrlReserva();
			int id = 0;
			ArrayList<Reserva>listaRes=new ArrayList<Reserva>();
			
			id = ((Persona) request.getSession().getAttribute("user")).getId();
			
			listaRes = ctrl.getReservasAFututoByIdPersona(id);
			
			request.setAttribute("listaRes", listaRes);
			
			request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
			
		}
		 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		
		
//		try {
//			CtrlPersona ctrl= new CtrlPersona();
//			String nombre = "nulo";
//			
//			nombre = ((Persona) request.getSession().getAttribute("user")).getNombre();
//			
//			request.setAttribute("nombrePer", nombre);
//			request.setAttribute("listaPersonas", ctrl.getAll());
//			request.getRequestDispatcher("WEB-INF/ABMPersonasWeb.jsp").forward(request, response);
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
		
		
		
		
	}

}
