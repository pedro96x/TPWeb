package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import controladores.CtrlLogin;
import controladores.CtrlPersona;
import entidades.Persona;


/**
 * Servlet implementation class Start
 */
@WebServlet({ "/Start", "/start" })
public class Start extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger;
    /**
     * Default constructor. 
     */
    public Start() {
        // TODO Auto-generated constructor stub
    	logger = LogManager.getLogger(getClass());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		doPost(request, response);
		request.getRequestDispatcher("WEB-INF/welcome.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String user=request.getParameter("user");
			String pass=request.getParameter("pass");
			
			entidades.Persona per=new entidades.Persona();
			per.setUser(user);
			per.setPass(pass);
			
			CtrlLogin ctrl= new CtrlLogin();
			
			entidades.Persona pers=ctrl.compara(per);
		
			if (pers != null){
				logger.log(Level.INFO,"log in "+pers.getDni());
				
			request.getSession().setAttribute("user", pers);
			
			request.getRequestDispatcher("WEB-INF/welcome.jsp").forward(request, response);
			response.getWriter().append(user).append(" ").append(pass);
			}
			else{
			
				request.getRequestDispatcher("errorLogin.html").forward(request, response);
			}
			
//		ver
		
		
	}

}
