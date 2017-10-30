package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controladores.CtrlTipoAuto;
import entidades.Persona;

/**
 * Servlet implementation class aLogin
 */
@WebServlet("/aLogin")
public class aLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aLogin() {
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
//			para borrar la session
//			HttpSession session = request.getSession(false);
//			if (session != null) {
//			    session.invalidate();
//			}

			request.getSession().setAttribute("user", null);
//			para borrar la session
			
//			response.sendRedirect("/login.html");
//			request.getRequestDispatcher("WEB-INF/ABMReservas.jsp").forward(request, response);
			request.getRequestDispatcher("login2.jsp").forward(request, response);
//			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
