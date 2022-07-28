package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import dataBase.DB;
import model.Charla;


public class CharlaDAO {
	
	public static List<Charla> listado( String condicion ) throws SQLException{
					
		String sql = "* FROM charla";
		
		if( condicion != null ) sql += " WHERE " + condicion;	
		
		ResultSet res = DB.select( sql );
		
		List<Charla> lis = new ArrayList<Charla>();
		
		while ( res.next() ) {
						
			lis.add( new Charla( 
				res.getInt("id"),
				UsuarioDAO.ver( "id = " + res.getInt("usuario_id") ),
				res.getString("titulo"),
				res.getString("detalle")
			));
		}
				
		return lis;
	}
	
	public static Charla ver( String condicion ) throws SQLException{
		
		Charla charla = null;
					
		String sql = "* FROM charla";
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		ResultSet res = DB.select( sql );
		
		while ( res.next() ) {

			charla = new Charla( 
				res.getInt("id"),
				UsuarioDAO.ver( "id = " + res.getInt("usuario_id") ),
				res.getString("titulo"),
				res.getString("detalle")
			);
			
			break;
		}
				
		return charla;
	}
	
	public static Integer contar( String condicion ) throws SQLException {
		
		String sql = "COUNT(*) AS cuenta FROM charla";			
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		ResultSet res = DB.select( sql );
		
		Integer cuenta = 0;
		
		while ( res.next() ) {
			
			cuenta = res.getInt("cuenta");
			
			break;
		}		
		
		return cuenta;
	}
	
	public static Integer contar_grupos( String condicion, String groupby ) throws SQLException {
		
		String sql = "COUNT(*) AS cuenta FROM charla";
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		if( groupby != null ) sql += " GROUP BY " + groupby;
		
		ResultSet res = DB.select( sql );
		
		Integer cuenta = 0;
		
		while ( res.next() ) {
			
			cuenta ++;			
		}		
		
		return cuenta;
	}		

	public static Integer agregar( Charla charla ) throws SQLException {		
		
		return DB.insert(
				
		  "charla VALUES ( null, "+charla.getUsuario().getId()+", '"+charla.getTitulo()+"', '"+charla.getDetalle()+"' )"
				
		);
	}
	
	public static Integer modificar( Charla charla ) throws SQLException {

		return DB.update(
				
		  "charla SET usuario_id = "+charla.getUsuario().getId()+", titulo = '"+charla.getTitulo()+"', detalle = '"+charla.getDetalle()+"' WHERE id = "+charla.getId()
		  
		);
	}
	
	public static Integer eliminar( Charla charla ) throws SQLException {		
		
		return DB.delete(
				
		  "charla WHERE id = "+charla.getId()
		  
		);
	}	

}
