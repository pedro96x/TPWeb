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

import com.sun.javafx.collections.NonIterableChange.SimpleRemovedChange;

import controladores.CtrlAuto;
import controladores.CtrlReserva;
import controladores.CtrlTipoAuto;
import entidades.*;
import excepciones.ExceptionNoHayAutos;
import util.Emailer;

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
		
		
		String stringFechaInicio =request.getParameter("fechaInicio");
		String stringFechaFin=request.getParameter("fechaFin");		
		String detalle=request.getParameter("detalle");
		String nombreTipo =request.getParameter("nombreTipo");
		
		
		SimpleDateFormat formatoInput=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatoOutput=new SimpleDateFormat("yyyy-MM-dd");
		
		
		String stringFechaInicioReformateada;
		String stringFechaFinReformateada;
		try {
			Date fechaInicio=formatoInput.parse(stringFechaInicio);
			
			stringFechaInicioReformateada = formatoOutput.format(fechaInicio);
			
			
			
			Date fechaFin=formatoInput.parse(stringFechaFin);
			
			stringFechaFinReformateada = formatoOutput.format(fechaFin);
	
		CtrlAuto ctrlAuto = new CtrlAuto();
		CtrlTipoAuto ctrlTipoAuto = new CtrlTipoAuto();
		
		ArrayList<TipoAuto> listaTipoAuto = ctrlTipoAuto.getArrayList();
		
		TipoAuto tipoAuto = new TipoAuto();
		
		for(TipoAuto  tipo :  listaTipoAuto){
			if(tipo.getNombre().equals(nombreTipo) ){ tipoAuto= tipo;}
		} 
		
		CtrlReserva ctrlReserva = new CtrlReserva();
//		ArrayList<Auto> listaAutos = ctrlAuto.getAutosByID(tipoAuto.getId());
//		
//		
//		
//		ArrayList<Auto> listaAutosDisponibles = ctrlReserva.getAutosDisponibles(
//				stringFechaInicioReformateada  /*"2018-01-01"*/ ,
//				stringFechaFinReformateada  /*"2018-01-05"*/ ,
//				listaAutos);
		
		ArrayList<Auto> listaAutosDisponibles = ctrlReserva.getAutosDisponiblesByFechasAndTipo(fechaInicio, fechaFin, tipoAuto.getId());
		
		request.setAttribute("listaAutos", listaAutosDisponibles);
		
		
		request.setAttribute("fechaInicio", stringFechaInicio);
		request.setAttribute("fechaFin", stringFechaFin);
		request.setAttribute("detalle", detalle);
		request.setAttribute("nombreTipo", nombreTipo);
		
		
		if (listaAutosDisponibles.size() == 0 ){
			throw new ExceptionNoHayAutos();
			//request.getRequestDispatcher("WEB-INF/ErrorNoHayAutos.jsp").forward(request, response);
		}

		request.getRequestDispatcher("WEB-INF/NuevaReserva2.jsp").forward(request, response);
		
		
		}catch (ExceptionNoHayAutos e) {
			
			 
			 
			  //request.getRequestDispatcher(e.getPaginaError()).forward(request, response);
			 
			 request.setAttribute("errorNoHayAutos", true);
			 request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
		}
		
		 catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
	 	
		
		
		
		
		
	}

}
