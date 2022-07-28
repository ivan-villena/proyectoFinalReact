
<%@ page import="dao.TiketDAO" %>

<%	
	Integer id = request.getParameter("id") != null ? Integer.valueOf(request.getParameter("id")) : 0;
	String mensaje = "Hubo un problema hay eliminar el tiket...";
	// ejecuto alta
	try{
		
		Integer ok = TiketDAO.eliminar( TiketDAO.ver("id="+id) );
		
		if( ok > 0 ) {
			mensaje = "El tiket ha sido eliminado correctamente...";
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