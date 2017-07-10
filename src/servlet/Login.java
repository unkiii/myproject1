package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tablas.Usuarios;
import model.UsuariosDAO;

@WebServlet("/Login")
public class Login extends HttpServlet {
	    
	   //metodo encargado de la gestión del método POST
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        HttpSession session;
	        
	        UsuariosDAO uDAO = new UsuariosDAO();
	        Usuarios usu = new Usuarios();
	        
	        String nif;
	        String pass;
	        nif = request.getParameter("dni");
	        pass = request.getParameter("password");
	        
	        List<String> valors = new ArrayList<String>();
		        
	        usu.setDni(nif);
	        usu.setPass(pass);
	        
	        session = request.getSession();
	        
	        //deberíamos buscar el usuario en la base de datos, pero dado que se escapa de este tema, ponemos un ejemplo en el mismo código
	        try{
        		List<String> llista = uDAO.validarLogin(usu);
	        	if(nif.equals(llista.get(0)) && pass.equals(llista.get(1))){

	        		valors = uDAO.obtenUsuario(nif);
			        usu.setDni(valors.get(0));
			        usu.setName(valors.get(1));
			        usu.setPass(valors.get(2));
			        usu.setMail(valors.get(3));
			        usu.setEdad(valors.get(4));
			        usu.setPoblacion(valors.get(5));
			        usu.setPais(valors.get(6));
		        
		        	
		            //Expirar en 30 min
		            session.setMaxInactiveInterval(30*60);
		            
		            String nomComplet;
		            if(usu.getName().equals(null)){
		            	nomComplet = usu.getName();
		            }else{
		            	nomComplet = usu.getName();
		            }
		            
		            session.setAttribute("nif", usu.getDni());
		            session.setAttribute("nomLogin", usu.getName());
		            session.setAttribute("pass", usu.getPass());
		            session.setAttribute("mail", usu.getMail());
		            session.setAttribute("edad", usu.getEdad());
		            session.setAttribute("poblacion", usu.getPoblacion());
		            session.setAttribute("pais", usu.getPais());
		            
		            //redirijo a página con información de login exitoso	            
		            response.sendRedirect("principal.jsp");
			      	        
	        	}
	        }catch(Exception e){
        		session.setAttribute("correcte", 1);
	            response.sendRedirect("principal.jsp");
	        }
		          
	        
	    }
	 
	}



