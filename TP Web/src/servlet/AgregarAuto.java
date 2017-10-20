package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controladores.CtrlAuto;
import controladores.CtrlPersona;
import controladores.CtrlTipoAuto;
import entidades.Auto;
import entidades.Persona;
import entidades.TipoAuto;

/**
 * Servlet implementation class AgregarAuto
 */
@WebServlet("/AgregarAuto")
public class AgregarAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarAuto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try {
	CtrlTipoAuto ctrlT = new CtrlTipoAuto();
	ArrayList<TipoAuto>listaTiposAuto=ctrlT.getArrayList();
			
			String nombre = request.getParameter("descripcion");
			String tipo= request.getParameter("nombreTipo");
		
			
			Auto a = new Auto();
			a.setNombre(nombre);
			TipoAuto obj = new TipoAuto();
			for (int i = 0; i < listaTiposAuto.size(); i++) {
				if(listaTiposAuto.get(i).getNombre().equals(tipo)){
					obj=listaTiposAuto.get(i);
				}
			}
			a.setTipo(obj);
			
		
			
			
//    		if(habilitado=="true"){p.setHabilitado(true);}
//			if(habilitado == "false"){p.setHabilitado(false);}
			
			CtrlAuto ctrl= new CtrlAuto();
			ctrl.setAuto(a);
			
		
			request.setAttribute("listaAutos", ctrl.getArrayList());
			request.setAttribute("listaTiposAuto", ctrlT.getArrayList());
			
			request.getRequestDispatcher("WEB-INF/ABMAutos.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
