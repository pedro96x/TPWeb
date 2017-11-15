package servlet;
import entidades.Persona;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import controladores.CtrlTipoAuto;
import excepciones.ExceptionNoSePuedeEliminar;

/**
 * Servlet implementation class EliminarTipoAuto
 */
@WebServlet("/EliminarTipoAuto")
public class EliminarTipoAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarTipoAuto() {
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
		
		String idString = request.getParameter("idTipoAuto");
		try {
			
			int id = Integer.parseInt(idString);
			
			CtrlTipoAuto ctrl = new CtrlTipoAuto();
			
			try {
				
					
					ctrl.baja(id);
			
					request.setAttribute("listaTiposAuto", ctrl.getArrayList());
					request.getRequestDispatcher("WEB-INF/ABMTiposAuto.jsp").forward(request,response);
				} catch (ExceptionNoSePuedeEliminar e) {
					// TODO Auto-generated catch block
					
					logger.log(Level.ERROR,"Eliminar tipos incluidos en reservas "+"39455528");
					request.setAttribute("mensaje", e.getMensajeDeError());
					request.getRequestDispatcher("WEB-INF/PaginaDeError.jsp").forward(request, response);
				}
				
			 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
