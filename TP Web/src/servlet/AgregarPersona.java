package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.dom.PSVIElementNSImpl;

import controladores.CtrlPersona;
import entidades.Persona;

/**
 * Servlet implementation class AgregarPersona
 */
@WebServlet("/AgregarPersona")
public class AgregarPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarPersona() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		try {
			
			
			
			
			
			
			String nombre = request.getParameter("nombre");
			String apellido= request.getParameter("apellido");
			String dni = request.getParameter("dni");
			String user=request.getParameter("user");
			String pass=request.getParameter("pass");
			String habilitado= request.getParameter("habilitado");
			
			Persona p = new Persona();
			p.setNombre(nombre);
			p.setApellido(apellido);
			p.setDni(Integer.parseInt(dni));
			p.setUser(user);
			p.setPass(pass);
		
			p.setHabilitado(Boolean.valueOf(habilitado));
			
//    		if(habilitado=="true"){p.setHabilitado(true);}
//			if(habilitado == "false"){p.setHabilitado(false);}
			
			CtrlPersona ctrl= new CtrlPersona();
			try {
			ctrl.alta(p);
			request.setAttribute("listaPersonas", ctrl.getAll());
			request.getRequestDispatcher("WEB-INF/ABMPersonasWeb.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
