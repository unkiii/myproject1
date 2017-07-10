package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UsuariosDAO;
import tablas.Usuarios;


/**
 * Servlet implementation class afegirTutors
 */
@WebServlet("/modificarUsuariosa")
public class modificarUsuariosa extends HttpServlet {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1861951334947961197L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public modificarUsuariosa() {
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuariosDAO pdao = new UsuariosDAO();
		Usuarios p = new Usuarios();
		
		
		System.out.println("HELLOOOO modificar");

		String NIF=(String)request.getParameter("nif");
		String nom=(String)request.getParameter("nom");
		String pass=(String)request.getParameter("pass");
		String mail=(String)request.getParameter("mail");
		String edad=(String)request.getParameter("edad");
		String poblacion=(String)request.getParameter("poblacion");
		String pais=(String)request.getParameter("pais");


		p.setDni(NIF);
		p.setName(nom);
		p.setPass(pass);
		p.setMail(mail);
		p.setEdad(edad);
		p.setPoblacion(poblacion);
		p.setPais(pais);
		pdao.actualizaUsuariosa(p);
		
		response.sendRedirect("/ProjecteHibernateWeb/index.jsp");
	}

}
