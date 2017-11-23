package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controladores.CtrlTipoAuto;
import entidades.TipoAuto;

/**
 * Servlet implementation class ModificarTipoAuto
 */
@WebServlet("/ModificarTipoAuto")
public class ModificarTipoAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarTipoAuto() {
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
		
		try {
			TipoAuto ta;
			CtrlTipoAuto ctrl;
			ta = new TipoAuto();
			int id =Integer.parseInt(request.getParameter("idTipoAuto"));
			String nombre = request.getParameter("nombre");
			String tipo_permiso = request.getParameter("tipo_permiso");
			String cantMax = request.getParameter("cantMax");
			String limite = request.getParameter("limite");
			String anti = request.getParameter("anti");
			
			ta.setId(id);
			ta.setNombre(nombre);
			
			ta.setCantMaxReservas(Integer.parseInt(cantMax));
			ta.setMinDiasDeAnti(Integer.parseInt(anti));
			ta.setLimMaxDeTiempoDeReserva(Integer.parseInt(limite));
			
			ta.setPermiso(tipo_permiso);
			
			try {
				ctrl = new CtrlTipoAuto();
				ctrl.modific(ta);
				
				request.setAttribute("listaTiposAuto",ctrl.getArrayList());
				request.getRequestDispatcher("WEB-INF/ABMTiposAuto.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
			
			
		
		
		
		
	}

}
