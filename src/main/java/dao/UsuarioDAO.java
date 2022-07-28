package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dataBase.DB;
import model.Usuario;

public class UsuarioDAO {
	
	
	public static boolean validar( String usuario, String password ) throws SQLException {
				
		ResultSet res = DB.select("* from usuario where email = '" + usuario + "' and password = '" + password + "'");
		
		return res.next();
		
	}
	
	public static List<Usuario> listado( String condicion ) throws SQLException{
		
		String sql = "* FROM usuario";
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		ResultSet res = DB.select( sql );
		
		List<Usuario> lis = new ArrayList<Usuario>();
		
		while ( res.next() ) {
			
			lis.add( new Usuario( 
				res.getInt("id"),
				res.getString("categoria"), 
				res.getString("nombre"), 
				res.getString("apellido"), 
				res.getString("email"), 
				res.getString("password"),
				res.getInt("es_admin") == 1,
				res.getInt("telefono")
			));
		}
				
		return lis;
	}
	
	public static Usuario ver( String condicion ) throws SQLException{			
					
		String sql = "* FROM usuario";
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		ResultSet res = DB.select( sql );
		
		Usuario usu = null;
		
		while ( res.next() ) {
			
			usu = new Usuario( 
				res.getInt("id"),
				res.getString("categoria"), 
				res.getString("nombre"), 
				res.getString("apellido"), 
				res.getString("email"), 
				res.getString("password"),
				res.getInt("es_admin") == 1,
				res.getInt("telefono")
			);
			
			break;
		}
				
		return usu;
	}
	
	public static Integer contar( String condicion ) throws SQLException {
		
		String sql = "COUNT(*) AS cuenta FROM usuario";			
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		ResultSet res = DB.select( sql );
		
		Integer cuenta = 0;
		
		while ( res.next() ) {
			
			cuenta = res.getInt("cuenta");
			
			break;
		}		
		
		return cuenta;
	}

	public static Integer agregar( Usuario usuario ) throws SQLException {		
		
		return DB.insert(
				
		  "usuario VALUES ( null, '"+usuario.getCategoria()+"', '"+usuario.getNombre()+"', '"+usuario.getApellido()+"', '"+usuario.getEmail()+"', '"+usuario.getPassword()+"', "+( usuario.getEs_admin() ? "1" : "0" )+", "+usuario.getTelefono()+" )"
				
		);
	}
	
	public static Integer modificar( Usuario usuario ) throws SQLException {
		
		return DB.update(
				
		  "usuario SET categoria = '"+usuario.getCategoria()+"', nombre = '"+usuario.getNombre()+"', apellido = '"+usuario.getApellido()+"', email = '"+usuario.getEmail()+"', password = '"+usuario.getPassword()+"', es_admin = "+(usuario.getEs_admin() ? "1" : "0")+", telefono = "+usuario.getTelefono()+" WHERE id = "+usuario.getId()
		  
		);
	}
	
	public static Integer eliminar( Usuario usuario ) throws SQLException {
		
		DB.delete( "charla WHERE usuario_id = "+usuario.getId() );
		
		return DB.delete(
				
		  "usuario WHERE id = "+usuario.getId() 
		);
	}
}
