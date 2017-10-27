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
import controladores.CtrlTipoAuto;
import entidades.Auto;
import entidades.TipoAuto;

/**
 * Servlet implementation class ModificarReserva
 */
@WebServlet("/aModificarReserva2")
public class aModificarReserva2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aModificarReserva2() {
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
		int idAuto =Integer.parseInt(request.getParameter("idAuto"));
		String nombreAuto =request.getParameter("nombreAuto");
		String idReserva =request.getParameter("idReserva");
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
		
		ArrayList<Auto> listaAutos = ctrlAuto.getAutosByID(tipoAuto.getId());
		
		CtrlReserva ctrlReserva = new CtrlReserva();
		
		ArrayList<Auto> listaAutosDisponibles = ctrlReserva.getAutosDisponibles(
				stringFechaInicioReformateada  /*"2018-01-01"*/ ,
				stringFechaFinReformateada  /*"2018-01-05"*/ ,
				listaAutos);

		Auto autoAnterior = ctrlAuto.getByID(idAuto);
		if (nombreTipo.equals(autoAnterior.getTipo().getNombre())){
			listaAutosDisponibles.add(autoAnterior);
		}
		
		
		request.setAttribute("listaAutos", listaAutosDisponibles);
		request.setAttribute("nombreAuto", nombreAuto);
		request.setAttribute("idReserva", idReserva);
		request.setAttribute("fechaInicio", stringFechaInicio);
		request.setAttribute("fechaFin", stringFechaFin);
		request.setAttribute("detalle", detalle);
		request.setAttribute("nombreTipo", nombreTipo);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		request.getRequestDispatcher("WEB-INF/ModificarReserva2.jsp").forward(request, response);
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
