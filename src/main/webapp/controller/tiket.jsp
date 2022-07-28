
<%@ page import="dao.TiketDAO" %>

<%@ page import="model.Tiket" %>

<%	
	Integer id				= request.getParameter("id") != null ? Integer.valueOf(request.getParameter("id")) : 0;	
	String nombre 		= request.getParameter("nombre");
	String apellido 	= request.getParameter("apellido");
	String email  		= request.getParameter("email");
	String descuento  = request.getParameter("descuento");
	Integer cantidad 	= request.getParameter("cantidad") != null ? Integer.valueOf(request.getParameter("cantidad")) : 0;
	Double total 			= request.getParameter("total") != null ? Double.valueOf(request.getParameter("total")) : 0.00;
	
	// validaciones
	String mensaje = "Hubo un error al procesar el tiket...";
	Boolean error_interno = false;	
	
	// aseguro total	
	if( total == 0.00 && cantidad != 0 ){
		
		Double valor_unitario = 200.00;

		total = ( valor_unitario * cantidad ) - ( valor_unitario * cantidad * Double.valueOf(descuento) );		
	}	
	
	// ejecuto alta
	try{
		
		Tiket tiket = new Tiket( id, nombre, apellido, email, descuento, cantidad, total ); 
		
		Integer ok = 0;
		
		ok = ( id == 0 ) ? TiketDAO.agregar( tiket ) : TiketDAO.modificar( tiket );
		
		if( ok > 0 ) {
			mensaje = "El tiket ha sido registrado correctamente...";
			response.sendRedirect( "../view/mensaje.jsp?ok="+mensaje );			
		}
		else{
			response.sendRedirect("../view/mensaje.jsp?error="+mensaje);
		}

	}catch(Exception e){
		
		response.sendRedirect("../view/mensaje.jsp?error="+mensaje);
		e.printStackTrace();
	}
%>