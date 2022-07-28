
<%@ page import="dao.UsuarioDAO" %>

<%@ page import="dao.CharlaDAO" %>

<%@ page import="model.Charla" %>

<%	
	Integer id				= request.getParameter("id") != null ? Integer.valueOf( request.getParameter("id") ) : 0;
	String usuario_id = request.getParameter("usuario_id");
	String titulo  		= request.getParameter("titulo");
	String detalle    = request.getParameter("detalle");	
	
	// validaciones
	String error = "Hubo un error al registrar la charla...";
	Boolean error_interno = false;	
	
	// ejecuto alta
	try{
		
		// busco usuario
		Charla charla = new Charla( id, UsuarioDAO.ver("id = " + usuario_id), titulo, detalle );
		
		Integer ok = ( id == null || id == 0 ) ? CharlaDAO.agregar( charla ) : CharlaDAO.modificar( charla );
					
		if( ok > 0 ) {
			String mensaje = "La charla ha sido registrada correctamente...";
			response.sendRedirect( "../view/mensaje.jsp?ok="+mensaje );
		}
		else {
			
			response.sendRedirect("../view/mensaje.jsp?error="+error);
		}

	}catch(Exception e){
		
		response.sendRedirect("../view/mensaje.jsp?error="+error);
		e.printStackTrace();
	}
%>