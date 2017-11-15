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
		String paginaAnterior=request.getParameter("paginaAnterior");
		String idPersona=request.getParameter("idPersona");
		try {
			int idReserva = Integer.parseInt(id);
			int idPer = Integer.parseInt(idPersona);
		
		CtrlReserva ctrlReserva = new CtrlReserva();
		CtrlPersona ctrlPersona = new CtrlPersona();
		
		ctrlReserva.deleteById(idReserva);
		Persona per = ctrlPersona.getById(idPer);
		
		if(paginaAnterior.equals("ABMReservas")){
			
			Emailer.getInstance().send(((Persona)request.getSession().getAttribute("user")).getUser(),"Reserva cancelada","Sr/a "+((Persona) request.getSession().getAttribute("user")).getApellido()+
					" "+
					((Persona) request.getSession().getAttribute("user")).getNombre()+"usted ha eliminado exitosamente su reserva. Gracias por confiar en GetCars©");
			request.setAttribute("errorNoHayAutos", false);
			request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
		}
		else{

			Emailer.getInstance().send(per.getUser(),"Reserva cancelada","Sr/a "+per.getApellido()+
					" "+
					"Lamentamos informarle que su reserva fue cancelada por el aministrador del sistema. Gracias por confiar en GetCars©");
			request.getRequestDispatcher("WEB-INF/TodasLasReservas.jsp").forward(request, response);
		}
		}
		 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}
