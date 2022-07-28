<%@ page import="dao.CharlaDAO" %>

<%	
	Integer id = request.getParameter("id") != null ? Integer.valueOf(request.getParameter("id")) : 0;
	String mensaje = "Hubo un problema hay eliminar el tiket...";
	// ejecuto alta
	try{
		
		Integer ok = CharlaDAO.eliminar( CharlaDAO.ver("id="+id) );
		
		if( ok > 0 ) {
			mensaje = "La charla ha sido eliminada correctamente...";
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