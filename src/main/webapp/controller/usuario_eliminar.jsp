
<%@ page import="dao.UsuarioDAO" %>

<%	
	Integer id = request.getParameter("id") != null ? Integer.valueOf(request.getParameter("id")) : 0;
	String mensaje = "Hubo un problema hay eliminar el usuario...";
	// ejecuto alta
	try{
		
		Integer ok = UsuarioDAO.eliminar( UsuarioDAO.ver("id="+id) );
		
		if( ok > 0 ) {
			mensaje = "El usuario ha sido eliminado correctamente...";
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