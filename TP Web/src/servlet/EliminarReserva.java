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
import util.Emailer;

/**
 * Servlet implementation class EliminarReserva
 */
@WebServlet("/EliminarReserva")
public class EliminarReserva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarReserva() {
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
		
		String id=request.getParameter("idReserva");
		try {
			int idReserva = Integer.parseInt(id);
		
		
		CtrlReserva ctrlReserva = new CtrlReserva();
		
		ctrlReserva.deleteById(idReserva);
		
		
		
			CtrlReserva ctrl= new CtrlReserva();
			int id1 = 0;
			ArrayList<Reserva>listaRes=new ArrayList<Reserva>();
			
			id1 = ((Persona) request.getSession().getAttribute("user")).getId();
			
			listaRes = ctrl.getReservasAFututoByIdPersona(id1);
			
			request.setAttribute("listaRes", listaRes);
			Emailer.getInstance().send(((Persona)request.getSession().getAttribute("user")).getUser(),"Reserva","Sr/a "+((Persona) request.getSession().getAttribute("user")).getApellido()+
					" "+
					((Persona) request.getSession().getAttribute("user")).getNombre()+"usted ha eliminado exitosamente su reserva. Gracias por confiar en GetCars©");
			
			request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
			
		}
		 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}
