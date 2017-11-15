package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controladores.CtrlPersona;
import entidades.Persona;

/**
 * Servlet implementation class ModificarPersona
 */
@WebServlet("/ModificarPersona")
public class ModificarPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarPersona() {
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
		Persona p = new Persona();
		
		String id=request.getParameter("idPersona");
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		String dni=request.getParameter("dni");
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		String habilitado=request.getParameter("habilitado");
		String tip=request.getParameter("tipo_persona");
		
		
		
		
		
		
			int dniPersona = Integer.parseInt(dni);
			int idPersona = Integer.parseInt(id);
		boolean hab= Boolean.parseBoolean(habilitado);
			
				p.setNombre(nombre);
				p.setApellido(apellido);
				p.setDni(dniPersona);
				p.setId(idPersona);
				p.setPass(pass);
				p.setUser(user);
				p.setHabilitado(hab);
				p.setTipo(tip);
				
		CtrlPersona ctrlPersona = new CtrlPersona();
		ctrlPersona.modific(p);
		
		
		request.setAttribute("listaPersonas", ctrlPersona.getAll());
		request.getRequestDispatcher("WEB-INF/ABMPersonasWeb.jsp").forward(request, response);
	
		
		
		
		
	}

}
