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
import entidades.Auto;
import entidades.TipoAuto;

/**
 * Servlet implementation class ModificarAuto
 */
@WebServlet("/ModificarAuto")
public class ModificarAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarAuto() {
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
		Auto a = new Auto();
		
		a.setId(Integer.parseInt(request.getParameter("idAuto")));
		a.setNombre(request.getParameter("nombre"));
		String tipoString = request.getParameter("tipo");
		TipoAuto tipo = new TipoAuto();
		CtrlTipoAuto ctrlT = new CtrlTipoAuto();
		ArrayList<TipoAuto> listaTiposAuto =  ctrlT.getArrayList();
		
		for (TipoAuto ta : listaTiposAuto) {
			if(tipoString.equals(ta.getNombre())){
				tipo=ta;
		}	
		}
		
		a.setTipo(tipo);
		System.out.println(a.getTipo().getId());
		CtrlAuto ctrl = new CtrlAuto();
		try {
			ctrl.actualizar(a);
			
			request.setAttribute("listaAutos", ctrl.getArrayList());
			request.setAttribute("listaTiposAuto", ctrlT.getArrayList());
			
			request.getRequestDispatcher("WEB-INF/ABMAutos.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
