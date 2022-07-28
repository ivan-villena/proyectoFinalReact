package dataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	
	static Connection conexion;
	
	static String user="admin";
	
	static String password="admin";
	
	static String server="jdbc:mysql://localhost:3306/ba_final";
		
	
	public static ResultSet select( String codigoSQL ) throws SQLException {
				
		Connection con = DB.conectar();
		
		Statement sta = con.createStatement();
		
		ResultSet res = sta.executeQuery( "SELECT " + codigoSQL );
		
		return res;
		
	}
	
	public static Integer insert( String codigoSQL ) throws SQLException {
		
		Connection con = DB.conectar();
		
		Statement sta = con.createStatement();
		
		Integer res = sta.executeUpdate( "INSERT INTO " + codigoSQL );
		
		return res;			
		
	}
	
	public static Integer update( String codigoSQL ) throws SQLException {	
		
		Connection con = DB.conectar();
		
		Statement sta = con.createStatement();
		
		Integer res = sta.executeUpdate( "UPDATE " + codigoSQL );
		
		return res;			
		
	}
	
	public static Integer delete( String codigoSQL ) throws SQLException {		
		
		Connection con = DB.conectar();
		
		Statement sta = con.createStatement();
		
		Integer res = sta.executeUpdate( "DELETE FROM " + codigoSQL );
		
		return res;				
		
	}		
		
	public static Connection conectar(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(server,user,password);
			return conexion;

		}
		catch(Exception e){
			System.out.println("Imposible realizar conexion con la BD");
			e.printStackTrace();
		}
		return conexion;
	}

	public static void cerrarConexion(ResultSet rs){
		if(rs !=null){
			try{
				rs.close();
			}
			catch(Exception e){
				System.out.print("No es posible cerrar la Conexion");
			}
		}
	}

	public static void cerrar(java.sql.Statement stmt){
		
		if(stmt != null){
			
			try{
				stmt.close();
			}
			catch(Exception e){
				
			}
		}
	}

	public static void destruir(){
		
		if( conexion != null ){
		
			try{
				conexion.close();
			}
			catch(Exception e){
				
			}
		}
	}

}
