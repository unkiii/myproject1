package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tablas.Usuarios;
import tablas.Usuarios;
import utils.HibernateUtils;

public class UsuariosDAO {
	
	private Session session = null; 
    private Transaction tx = null;  
	
   
    
	public UsuariosDAO() {
	}

	/*
	private void manejaExcepcion(HibernateException he) throws HibernateException
	{
	    tx.rollback();
	    throw new HibernateException("Ocurrió un error en la capa de acceso a datos", he);
	}
	*/
	
	// ABRIR session con Hibernate
	public void obrir(){
		session = HibernateUtils.getSessionFactory().openSession();
		tx = session.beginTransaction();
	}
	
	
	// CERRAR session con Hibernate
	public void tancar(){
		tx.commit();
		session.close();
	}
	public void tancar2(){
		session.close();
	}
	
	
	// CREAR UsuariosA
	public void createUsuarios(Usuarios p){
		obrir();
		//Usuarios pn = new Usuarios(p.getId(), p.getName(), p.getAddress(), p.getAge());
		session.save(p);
		tancar();
	}
	
	
	// CONSULTAR UsuariosES 'TOTES'
	@SuppressWarnings("unchecked")
	public List<Usuarios> obtenListaContactos() throws HibernateException 
    { 
        List<Usuarios> listaContactos = null;  

        try 
        { 
            obrir();
            listaContactos = session.createQuery("from Usuarios").list(); 
        } finally 
        { 
        	tancar();
        }  
        

        return listaContactos; 
    }  
	
	// CONSULTAR 1 UsuariosA
	public Usuarios obtenContacto(int dni) throws HibernateException
	{ 
		Usuarios contacto = null;  

	    try 
	    { 
	        obrir();
	        contacto = (Usuarios) session.get(Usuarios.class, dni); 
	    } finally 
	    { 
	        tancar();
	    }  
	    return contacto; 
	}
	
	// MODIFICAR UsuariosA
	public void actualizaUsuariosa(Usuarios contacto) throws HibernateException 
    { 
        try 
        { 
            obrir(); 
            session.update(contacto); 
            tx.commit(); 
        } catch (HibernateException he) 
        { 
            //manejaExcepcion(he); 
            throw he; 
        } finally 
        { 
            tancar2();
        } 
    } 

	// ELIMINAR CONTACTE PER NIF
	public void eliminaContacto(Usuarios contacto) throws HibernateException 
    { 
        try 
        { 
            obrir();
            session.delete(contacto); 
            tx.commit(); 
        } catch (HibernateException he) 
        { 
            //manejaExcepcion(he); 
            throw he; 
        } finally 
        { 
        	tancar2(); 
        } 
    }  
	
	// BUSCAR UNA UsuariosA PER NIF I ELIMINAR-LA
		public void eliminarlaUsuariosa(String dni) throws HibernateException
		{ 
			Usuarios contacto = null;  


		        obrir();
		        contacto = (Usuarios) session.get(Usuarios.class, dni); 


		    
		    try 
	        { 

	            session.delete(contacto); 
	            tx.commit(); 
	        } catch (HibernateException he) 
	        { 
	            //manejaExcepcion(he); 
	            throw he; 
	        } finally 
	        { 
	        	tancar2(); 
	        } 
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// LOGIN
		
		
		
		
		public List<String> validarLogin(Usuarios usuari) throws SQLException{
			List<String> llista = new ArrayList<String>();
			Usuarios contacto = null;  
	    try 
	    { 
	        obrir();
	        contacto = (Usuarios) session.get(Usuarios.class, usuari.getDni()); 
	    } finally 
	    { 
	        tancar();
	    }
	    	llista.add(contacto.getDni());
	    	llista.add(contacto.getPass());
	    	
		return llista;  
	    

		}
		
		
		
		public List<String> avalidarLogin(Usuarios usuari) throws SQLException{
			ResultSet rs = null;
			List<String> llista = new ArrayList<String>();
			/*
			rs = gestorDB.consultaRegistres("SELECT NIF, password FROM usuari WHERE NIF='"+usuari.getNIF()+"' AND password='"+usuari.getPasswd()+"'");
			while(rs.next()){
				llista.add(rs.getString("NIF"));
				llista.add(rs.getString("password"));
			}
			*/
			return llista;
		}
		
		
		
		
		
		/*
		public boolean iniciSessio(String nif, String pw){
			try {
				ResultSet rs = null;
				String consultaSQL = "SELECT * FROM usuari WHERE NIF='"+nif+"' AND password='"+pw+"'";
				
				rs = gestorDB.consultaRegistres(consultaSQL);
				
				
				if(rs.first()){
					return true;
				}else{
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		*/
				
		/*		
		public List<String> valorsUsuari(String nif, String passwd) throws SQLException{
			List<String> llista = new ArrayList<String>();
			ResultSet rs = null;
			String consultaSQL = "SELECT u.nom, u.primer_cognom, u.segon_cognom, u.mail, u.permisos "
					+ "FROM usuari AS u "
					+ "WHERE u.NIF='"+nif+"' AND u.password='"+passwd+"'";
			rs = gestorDB.consultaRegistres(consultaSQL);
			while(rs.next()){
				llista.add(rs.getString("nom"));
				llista.add(rs.getString("primer_cognom"));
				llista.add(rs.getString("segon_cognom"));
				llista.add(rs.getString("mail"));
				llista.add(""+rs.getInt("permisos"));
			}
			return llista;
		}
		*/
		
		
		// CONSULTAR 1 UsuariosA
		public List<String> obtenUsuario(String dni) throws HibernateException
	{ 
		List<String> llista = new ArrayList<String>();
	Usuarios contacto = null;  
		

	    try 
	    { 
	        obrir();
	        contacto = session.get(Usuarios.class, dni); 
	        
	    } finally 
	    { 
	        tancar();
	    }  
	    llista.add(contacto.getDni());
	    llista.add(contacto.getName());	    
    	llista.add(contacto.getPass());
    	llista.add(contacto.getMail());
    	llista.add(contacto.getEdad());
    	llista.add(contacto.getPoblacion());
    	llista.add(contacto.getPais());
    	
    	
    	
    	
	    return llista; 
	}
		
}
