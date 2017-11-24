package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import controladores.CtrlAuto;

import controladores.CtrlTipoAuto;
import entidades.Persona;
import entidades.TipoAuto;
import excepciones.ExceptionErrorGen;

/**
 * Servlet implementation class EliminarAuto
 */
@WebServlet("/EliminarAuto")
public class EliminarAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger;   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarAuto() {
    	logger = LogManager.getLogger(getClass()); 
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
		String id=request.getParameter("idAuto");
		try {
			int idAuto = Integer.parseInt(id);
		
		
		CtrlAuto ctrl = new CtrlAuto();
		CtrlTipoAuto ctrlT = new CtrlTipoAuto();
		ArrayList<TipoAuto>listaTiposAuto=new ArrayList<TipoAuto>();
		HttpSession session = request.getSession();
		int dni = ((Persona)session.getAttribute("user")).getDni();
		try {
			ctrl.baja(idAuto);
			logger.log(Level.INFO,"Auto eliminado "+dni);
			request.setAttribute("listaAutos", ctrl.getArrayList());
			request.setAttribute("listaTiposAuto", ctrlT.getArrayList());
			request.getRequestDispatcher("WEB-INF/ABMAutos.jsp").forward(request, response);
		} catch (ExceptionErrorGen e) {
			
			logger.log(Level.ERROR,"No se puede eliminar autos incluidos en reservas "+dni);
			request.setAttribute("mensaje", e.getMensajeDeError());
			request.getRequestDispatcher("WEB-INF/PaginaDeError.jsp").forward(request, response);
			
		}
		
		
		
		
		} catch (NumberFormatException e) {
		      //Will Throw exception!
		      //do something! anything to handle the exception.
		}
		
		
	}
	

}
