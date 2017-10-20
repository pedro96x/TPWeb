package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controladores.CtrlAuto;

import controladores.CtrlTipoAuto;
import entidades.TipoAuto;

/**
 * Servlet implementation class EliminarAuto
 */
@WebServlet("/EliminarAuto")
public class EliminarAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarAuto() {
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
		String id=request.getParameter("idA");
		try {
			int idAuto = Integer.parseInt(id);
		
		
		CtrlAuto ctrl = new CtrlAuto();
		CtrlTipoAuto ctrlT = new CtrlTipoAuto();
		ArrayList<TipoAuto>listaTiposAuto=new ArrayList<TipoAuto>();
		ctrl.baja(idAuto);
		request.setAttribute("listaAutos", ctrl.getArrayList());
		request.setAttribute("listaTiposAuto", ctrlT.getArrayList());
		
		request.getRequestDispatcher("WEB-INF/ABMAutos.jsp").forward(request, response);
		
		
		} catch (NumberFormatException e) {
		      //Will Throw exception!
		      //do something! anything to handle the exception.
		}
		
		
	}
	

}
