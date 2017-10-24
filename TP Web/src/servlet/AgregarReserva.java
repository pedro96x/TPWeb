package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controladores.CtrlAuto;
import controladores.CtrlReserva;
import entidades.Auto;
import entidades.Persona;
import entidades.Reserva;

/**
 * Servlet implementation class AgregarReserva
 */
@WebServlet("/AgregarReserva")
public class AgregarReserva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarReserva() {
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
		
		
		String fechaInicio =request.getParameter("fechaInicio");
		String fechaFin=request.getParameter("fechaFin");		
		String detalle=request.getParameter("detalle");
		String nombreTipo =request.getParameter("nombreTipo");
		String nombreAuto =request.getParameter("nombreAuto");
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	    Date parsed = null;
	    try {
	        parsed = sdf.parse(fechaInicio);
	    } catch (ParseException e1) {
	        // TODO Auto-generated catch block
	        e1.printStackTrace();
	    }
	    java.sql.Date inicio = new java.sql.Date(parsed.getTime());
	  

		
	    Date parsed2 = null;
	    try {
	        parsed2 = sdf.parse(fechaFin);
	    } catch (ParseException e1) {
	        // TODO Auto-generated catch block
	        e1.printStackTrace();
	    }
	    java.sql.Date fin = new java.sql.Date(parsed2.getTime());
		
		
		
		
		
		
		
		
		
		CtrlReserva ctrlReserva = new CtrlReserva();
		Reserva res = new Reserva();
		
		res.setFechaIni(inicio);
		res.setFechaFin(fin);
		res.setDetalle(detalle);
		res.setIdPersona(((Persona) request.getSession().getAttribute("user")).getId());
		
	
		CtrlAuto ctrlAuto = new CtrlAuto();
		
		ArrayList<Auto> autos= ctrlAuto.getArrayList();
		
		for(Auto  a: autos){
			if (a.getNombre().equals(nombreAuto)){res.setAutoReservado(a);}
		}
		
		
		ctrlReserva.setReserva(res);
		
		
		
		
		
//		Preguntar si esto se puede reemplazar por una llamada a el servlet aMisReservas 
//		Un servlet puede llamar a otro servlet?
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
//		Preguntar si esto se puede reemplazar por una llamada a el servlet aMisReservas 
		
		
		
		
		
		
	}

}
