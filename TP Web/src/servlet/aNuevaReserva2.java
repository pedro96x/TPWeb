package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controladores.CtrlAuto;
import controladores.CtrlReserva;
import controladores.CtrlTipoAuto;
import entidades.*;

/**
 * Servlet implementation class aNuevaReserva2
 */
@WebServlet("/aNuevaReserva2")
public class aNuevaReserva2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aNuevaReserva2() {
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
		
		
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("MM/dd/yyyy");
		try {
			formatoDelTexto.parse(fechaInicio);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			formatoDelTexto.parse(fechaFin);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		CtrlAuto ctrlAuto = new CtrlAuto();
		CtrlTipoAuto ctrlTipoAuto = new CtrlTipoAuto();
		
		ArrayList<TipoAuto> listaTipoAuto = ctrlTipoAuto.getArrayList();
		
		TipoAuto tipoAuto = new TipoAuto();
		
		for(TipoAuto  tipo :  listaTipoAuto){
			if(tipo.getNombre() == nombreTipo ){ tipoAuto= tipo;}
		} 
		
		ArrayList<Auto> listaAutos = ctrlAuto.getAutosByID(tipoAuto.getId());
		
		CtrlReserva ctrlReserva = new CtrlReserva();
		
		ArrayList<Auto> listaAutosDisponibles = ctrlReserva.getAutosDisponibles(fechaInicio, fechaFin, listaAutos);
		
		
		request.setAttribute("listaAutos", listaAutosDisponibles);
		
		request.setAttribute("fechaInicio", fechaInicio);
		request.setAttribute("fechaFin", fechaFin);
		request.setAttribute("detalle", detalle);
		request.setAttribute("nombreTipo", nombreTipo);
		
		request.getRequestDispatcher("WEB-INF/NuevaReserva2.jsp").forward(request, response);
		
		
	}

}
