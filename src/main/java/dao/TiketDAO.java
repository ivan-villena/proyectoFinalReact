package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dataBase.DB;
import model.Tiket;

public class TiketDAO {
	
	public static List<Tiket> listado( String condicion ) throws SQLException{
		
		List<Tiket> lis = new ArrayList<Tiket>();
		
		String sql = "* FROM tiket";
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		ResultSet res = DB.select( sql );
		
		while ( res.next() ) {
			
			lis.add( new Tiket( 
				res.getInt("id"),				
				res.getString("nombre"), 
				res.getString("apellido"),
				res.getString("email"), 
				res.getString("descuento"), 
				res.getInt("cantidad"),
				res.getDouble("total")
			));
		}
				
		return lis;
	}
	
	public static Tiket ver( String condicion ) throws SQLException{
								
		String sql = "* FROM tiket";
		
		if( condicion != null ) sql += " WHERE " + condicion;		
		
		ResultSet res = DB.select( sql );
		
		Tiket tiket = null;
		
		while ( res.next() ) {
			
			tiket = new Tiket( 
				res.getInt("id"),				
				res.getString("nombre"), 
				res.getString("apellido"),
				res.getString("email"), 
				res.getString("descuento"), 
				res.getInt("cantidad"),
				res.getDouble("total")
			);
			
			break;
		}
				
		return tiket;
	}
	
	public static Integer contar( String condicion ) throws SQLException {
		
		String sql = "COUNT(*) AS cuenta FROM tiket";
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		ResultSet res = DB.select( sql );
		
		Integer cuenta = 0;
		
		while ( res.next() ) {
			
			cuenta = res.getInt("cuenta");
			
			break;
		}		
		
		return cuenta;
	}
	
	public static Double sumar( String campo, String condicion ) throws SQLException {
		
		String sql = "SUM("+ ( campo == null ? "*" : campo ) +") AS sumatoria FROM tiket";
		
		if( condicion != null ) sql += " WHERE " + condicion;
		
		ResultSet res = DB.select( sql );
		
		Double cuenta = 0.00;
		
		while ( res.next() ) {
			
			cuenta = res.getDouble("sumatoria");
			
			break;
		}		
		
		return cuenta;
	}	

	public static Integer agregar( Tiket tiket ) throws SQLException {		
		
		return DB.insert(
				
		  "tiket VALUES ( null, '"+tiket.getNombre()+"', '"+tiket.getApellido()+"', '"+tiket.getEmail()+"', '"+tiket.getDescuento()+"', "+tiket.getCantidad()+", "+tiket.getTotal()+" )"
				
		);		
	}
	
	public static Integer modificar( Tiket tiket ) throws SQLException {
		
		return DB.update(
				
		  "tiket SET nombre = '"+tiket.getNombre()+"', apellido = '"+tiket.getApellido()+"', email = '"+tiket.getEmail()+"', descuento = '"+tiket.getDescuento()+"', cantidad = "+tiket.getCantidad()+", total = "+tiket.getTotal()+" WHERE id = "+tiket.getId()
		  
		);
	}
	
	public static Integer eliminar( Tiket tiket ) throws SQLException {		
		
		return DB.delete(
				
		  "tiket WHERE id = "+tiket.getId() 
		);
	}	

}
